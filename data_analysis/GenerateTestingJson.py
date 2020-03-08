#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Mar  7 13:17:10 2020

@author: ithier
"""
import json
from random import randint

"""
This file generates random fake data for scouting data analysis tests in the
format specified in Slack.
"""
def main():
    filename = "file2.txt"
    
    position = ["Blue1", "Blue2", "Blue3", "Red1", "Red2", "Red3"]
    scouter_name = ["Carter", "Matt", "Peter", "Isaac"]
    auto_line = [1, 0]
    auto_cell_levels = ["high", "low"]
    shooting_positions = ["driver station", "autoline", "nearside trench", 
                          "farside trench", "nothing", "other"]
    park_climb = ["nothing", "parked", "failed", "success", "balanced success"]
    problems = ["fell apart", "lost capabilities", "disabled", "other", "none"]
    
    path = "./json_files/"
    
    filename = path + filename
    
    data = {}
    for i in range(20, 1, -1):
        team_num = randint(1, 4)
        match_num = i
        key = "team" + str(team_num) + "_" + str(i)
        data[key] = {
            "team" : team_num,
            "timestamp" : 5,
            "match_num": match_num,
            "position" : position[randint(0, len(position) - 1)],
            "scouter_name" : scouter_name[randint(0, len(scouter_name) - 1)],
            "autoline" : auto_line[randint(0, 1)],
            "auto_cell_levels" : auto_cell_levels[randint(0,1)],
            "num_auto_balls" : randint(0, 7),
            "lower_balls" : randint(0, 10),
            "outer_balls" : randint(0, 15),
            "inner_balls" : randint(0, 5),
            "shooting_position": shooting_positions[randint(0, len(shooting_positions) - 1)],
            "park/climb" : park_climb[randint(0, len(park_climb) - 1)],
            "defense" : randint(1,5),
            "driving_skill" : randint(1,5),
            "num_fouls" : randint(1,3),
            "problems" : problems[randint(0, len(problems) - 1)],
            "notes" : ""
                }
    
    
    with open(filename, 'w') as outfile:
        json.dump(data, outfile)

main()