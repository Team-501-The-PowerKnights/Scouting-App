#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Mar  7 15:53:56 2020

@author: ithier
"""

import pandas as pd
import numpy as np

data_filename = "./generated_data/compiled_data.csv"
df = pd.read_csv(data_filename)

team1 = df.iloc[0:12, :]
team2 = df.iloc[12:17, :]
team3 = df.iloc[17:23, :]
team4 = df.iloc[23:, :]

def stats(df):
    print("num data points: ", df.shape[0])
    
    al = df["autoline"].to_numpy()
    avg = sum(al) / df.shape[0]
    print("autoline_avg: ", avg)
    
    ab = df["num_auto_balls"].to_numpy()
    avg = sum(ab) / df.shape[0]
    print("autoballs_avg: ", avg)
    
    ab = df["lower_balls"].to_numpy()
    avg = sum(ab) / df.shape[0]
    print("lower_avg: ", avg)
    
    ob = df["outer_balls"].to_numpy()
    avg = sum(ob) 
    print("outer_balls: ", avg)
    
    ib = df["inner_balls"].to_numpy()
    avg = sum(ib) 
    print("inner_balls: ", avg)
    
    ob = df["defense"].to_numpy()
    avg = sum(ob)  / df.shape[0]
    print("avg_defense: ", avg)
    
    ob = df["driving_skill"].to_numpy()
    avg = sum(ob)  / df.shape[0]
    print("avg_driving: ", avg)
    
    ob = df["num_fouls"].to_numpy()
    avg = sum(ob)  / df.shape[0]
    print("avg_fouls: ", avg)
    
    

