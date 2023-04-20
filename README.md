# World Risk Analysis

## Overview
This repository contains a paper investigating the world anxiety towards cybercrime in 2019. The source data can be found in the UK Data Service: https://beta.ukdataservice.ac.uk/datacatalogue/studies/study?id=8739#!/access-data 

## Files Structure

There are three folders in this repository: inputs, scripts, and output.

* Inputs folder contains the raw and cleaned dataset used in this paper.
* Scripts folder contains three R files. 00_data_simulation.R simulate the data that we expected for this paper. 01_data_testing.R for testing and 02_data_cleaning.R imports and cleans the dataset obtained from the UK Data Service.
* Output folder contains the paper, the qmd file of the paper, and a reference file.

## How to generate the paper

* Download a ZIP file of this repository and open the .Rproj file in RStudio
* Run 02-data_cleaning.R to clean the original dataset
* Run world_risk.qmd to generate the pdf version of the paper
* Please remember to change the path when you read in and write the data based on where you saved this project
