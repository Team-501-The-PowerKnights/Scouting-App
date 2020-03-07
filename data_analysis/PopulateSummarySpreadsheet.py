#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Mar  7 14:16:46 2020

@author: ithier
"""
import pandas as pd
import numpy as np

"""
populate_df
Inputs: df- the dataframe to be populated
    data - a dataframe with all of the data compiled of all teams matches. This 
        df is created by doing a pd.read_csv on the outputted csv from the 
        PopulateMasterSpreadsheet script
Output: df- a populated dataframe
Description: Populate a dataframe using data obtained from the data dataframe passed in
"""
def populate_df(df, data):
    end = 0
    while end < data.shape[0]:
        start = end
        end = find_end(data, start)
        team_result = get_stats_for_team(data, start, end)
        df = df.append(team_result, ignore_index=True)
        end += 1
    return df

"""
find_end
Inputs: data - the dataframe with all data compiled of all team matches
        start - the start row index for a particular team
Outputs: an end row number
Description: Find the last row number that contains team information for the team
that's in the start row
"""
def find_end(data, start):
    team = data.loc[start, "team"]
    i = start
    while i < data.shape[0] and data.loc[i, "team"] == team:
        i += 1
    return i - 1

"""
get_stats_for_team
Inputs: df - the dataframe with all data compiled of all tteam matches
        start - the start row index for a particular team
        end - the end row indx for the last entry of that particular team
Output: result- a dictionary with keys that are the same as the column numbers
of the dataframe to be created and values that correspond to the calculated values
for those keys
Description: Calculate a range of metrics for the particular team in row ranges
start to end in the dataframe and return a dictionary containing the calculated data
"""
def get_stats_for_team(df, start, end):
    points = end - start + 1
    auto_level = []
    auto_line = 0
    auto_powercells = 0
    lower_powercells = 0
    high_powercells = 0
    inner_powercells = 0
    percent_inner = 0
    shooting_positions = []
    failed = 0
    hangs = 0
    hang_rate = 0
    balanced = 0
    balanced_rate = 0
    parked = 0
    defense = 0
    driving_skill = 0
    fouls = 0
    problems = []
    notes = []
    
    for i in range(start, end + 1):
        auto_l = df.loc[i, "auto_cell_levels"]
        if auto_l not in auto_level:
            auto_level.append(auto_l)
        
        auto_line += df.loc[i, "autoline"]
        auto_powercells += df.loc[i, "num_auto_balls"]
        lower_powercells += df.loc[i, "lower_balls"]
        high_powercells += df.loc[i, "outer_balls"]
        inner_powercells += df.loc[i, "inner_balls"]
        
        shooting_p = df.loc[i, "shooting_position"]
        if shooting_p not in shooting_positions:
            shooting_positions.append(shooting_p)
        
        pc = df.loc[i, "park/climb"]
        if pc == "parked":
            parked += 1
        elif pc == "failed":
            failed += 1
        elif pc == "success":
            hangs += 1
        elif pc == "balanced success":
            balanced += 1
        
        defense += df.loc[i, "defense"]
        driving_skill += df.loc[i, "driving_skill"]
        fouls += df.loc[i, "num_fouls"]
        
        prob = df.loc[i, "problems"]
        if prob not in problems:
            problems.append(prob)
        
        note = df.loc[i, "notes"]
        if note not in notes:
            if isinstance(note, str):
                notes.append(note)
    
    denom = high_powercells + inner_powercells
    if denom > 0:
        percent_inner = inner_powercells / denom
    
    denom = balanced + hangs + failed
    if denom > 0:
        hang_rate = (balanced + hangs) / denom
    
    denom = balanced + hangs
    if denom > 0:
        balanced_rate = balanced / denom
    
    
    result = {
            "team": df.loc[start, "team"], 
            "num_datapoints": points, 
            "auto_level_powercells": auto_level, 
            "autoline_avg": auto_line / points, 
            "auto_powercells_avg": auto_powercells / points,
            "avg_lower_powercells": lower_powercells / points, 
            "avg_high_powercells": (high_powercells + inner_powercells) / points, 
            "percent_higher_that_were_inner": percent_inner,
            "shooting_positions": shooting_positions, 
            "hang_rate": hang_rate, 
            "balanced_success_rate": balanced_rate, 
            "parked_rate": parked / points,
            "avg_defense": defense / points, 
            "avg_driving_skill": driving_skill / points, 
            "avg_num_fouls": fouls / points, 
            "problems": problems, 
            "notes": notes
            }
    return result

"""
Generate a summary_data csv file where each row is a different team number and
data in each row are calculated stats for each team
"""
def main():
    data_filename = "./generated_data/compiled_data.csv"
    csv_filename = "./generated_data/summary_data.csv"
    
    column_names = ["team", "num_datapoints", "auto_level_powercells", "autoline_avg", "auto_powercells_avg",
                    "avg_lower_powercells", "avg_high_powercells", "percent_higher_that_were_inner",
                    "shooting_positions", "hang_rate", "balanced_success_rate", "parked_rate",
                    "avg_defense", "avg_driving_skill", "avg_num_fouls", "problems", "notes"]
    
    df = pd.DataFrame(columns = column_names) 
    data = pd.read_csv(data_filename)
    df = populate_df(df, data) 
    df.sort_values("team", inplace = True)
    df.to_csv(csv_filename, index=False)

main()