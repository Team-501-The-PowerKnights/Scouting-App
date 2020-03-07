#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Mar  7 12:05:32 2020

@author: ithier
"""
import pandas as pd
import json 
import os

"""
populate_df
Inputs: df- the pandas dataframe to be populated
        filename- the name of the json file that should be read and whose data
            should be put in the dataframe
        path_to_json - the entire file path to get to the folder of the json file specified in filename
Outputs: df - the dataframe to be returned that has the populated data
Description: This function reads one json file and puts the data into a pandas dataframe
"""
def populate_df(df, filename, path_to_json):
    filename = path_to_json + filename
    with open(filename, 'r') as json_file:
        d = json.load(json_file)
        for identifier, data in d.items():
            df = df.append(data, ignore_index=True)
                
    return df

"""
Create a pandas dataframe with the specified column names and put all data from
the json files into the appropriate columns in the dataframe. Json files are all the 
files ending in .txt that are in the specified path.
"""
def main():
    column_names = ["team", "timestamp", "match_num", "position", "scouter_name",
                    "autoline", "auto_cell_levels", "num_auto_balls", "lower_balls",
                    "outer_balls", "inner_balls", "shooting_position", "park/climb",
                    "defense", "driving_skill", "num_fouls", "problems", "notes"]
    
    df = pd.DataFrame(columns = column_names)
    
    path_to_json = './json_files/'
    json_files = [file for file in os.listdir(path_to_json) if file.endswith(".txt")]
    for file in json_files:
        df = populate_df(df, file, path_to_json)
    df.sort_values("team", inplace = True)
    csv_filename = "./generated_data/compiled_data.csv"
    df.to_csv(csv_filename, index=False)
    
main()