#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Mar  7 12:05:32 2020

@author: ithier
"""
import pandas as pd
import json 
import os

def populate_df(df, filename, path_to_json):
    filename = path_to_json + filename
    with open(filename, 'r') as json_file:
        d = json.load(json_file)
        for identifier, data in d.items():
            df = df.append(data, ignore_index=True)
                
    return df

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