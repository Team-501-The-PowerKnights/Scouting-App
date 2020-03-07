#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Mar  7 13:17:10 2020

@author: ithier
"""
import json

["team", "timestamp", "match_num", "position", "scouter_name",
                "autoline", "auto_cell_levels", "num_auto_balls", "lower_balls",
                "outer_balls", "inner_balls", "shooting_position", "park/climb",
                "defense", "driving_skill", "num_fouls", "problems", "notes"]

path = "./json_files/"
filename = "file1.txt"

filename = path + filename

data = {}

data["team501_1"] = {
        "team" : 501,
        "timestamp" : 5,
        "match_num": 1,
        "position" : "Blue1",
        "scouter_name" : "Carter",
        "autoline" : "yes",
        "auto_cell_levels" : ["high", "low"],
        "num_auto_balls" : 5,
        "lower_balls" : 0,
        "outer_balls" : 10,
        "inner_balls" : 3,
        "shooting_position": ["far side trench"],
        "park/climb" : "success",
        "defense" : 3,
        "driving_skill" : 3,
        "num_fouls" : 0,
        "problems" : ["none"],
        "notes" : ""
        }

data["team238_1"] = {
        "team" : 238,
        "timestamp" : 5,
        "match_num": 1,
        "position" : "Blue1",
        "scouter_name" : "Carter",
        "autoline" : "yes",
        "auto_cell_levels" : ["high", "low"],
        "num_auto_balls" : 5,
        "lower_balls" : 0,
        "outer_balls" : 10,
        "inner_balls" : 3,
        "shooting_position": ["far side trench"],
        "park/climb" : "success",
        "defense" : 3,
        "driving_skill" : 3,
        "num_fouls" : 0,
        "problems" : ["none"],
        "notes" : ""
        }

data["team501_2"] = {
        "team" : 501,
        "timestamp" : 5,
        "match_num": 2,
        "position" : "Blue1",
        "scouter_name" : "Carter",
        "autoline" : "yes",
        "auto_cell_levels" : ["high", "low"],
        "num_auto_balls" : 5,
        "lower_balls" : 0,
        "outer_balls" : 10,
        "inner_balls" : 3,
        "shooting_position": ["far side trench"],
        "park/climb" : "success",
        "defense" : 3,
        "driving_skill" : 3,
        "num_fouls" : 0,
        "problems" : ["none"],
        "notes" : ""
        }

with open(filename, 'w') as outfile:
    json.dump(data, outfile)