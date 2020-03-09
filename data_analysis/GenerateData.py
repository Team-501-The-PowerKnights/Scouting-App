#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Mar  9 12:16:24 2020

@author: ithier
"""

from PopulateMasterSpreadsheet import populate_compiled
from PopulateSummarySpreadsheet import populate_summary

"""
Generate compiled and summary CSVs. CSVs are saved to the path "./generated_data/".
Thus, make sure there is a generated_data folder in the directory this file
is in. It will overwrite the files in the generated_data directory so if you 
want to keep the old ones, change their name before running this script.
"""
def main():
    # the path to a folder containing all the json files
    path_to_json = './json_files/'
    
    # create compiled csv
    populate_compiled(path_to_json)
    
    # create summary csv
    populate_summary()
    
main()