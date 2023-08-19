# Teamprojekt-Diagnosis-System
Development of a supportive diagnosis System with a GUI using machine learning.

## Team:
| Name | Rolle | Matrikelnummer |
|:---------|---|---|
| Aylin Fischbach | GUI | 6069003 |
| Alec Talamas | GUI | 6373551 |
| Martin Kahabka| ML | 6125086 |
| Mara Cockburn | ML | 5471236 |

Betreuer: Wolfgang Fuhl

## Trello: 
https://trello.com/b/r5shBZAH/teamprojekt

# How to use the program
The program should be access through matlab. When the program is opened, the current folder should be either 
1. 'Teamprojekt-Diagnose-System' (*preferred*)
2. 'Project'
3. subfolder of the above <br> 
<br>
The program can be exeuted by  <br>
1. opening the StartUpApp.mlapp in the Project/GUI/approach2 folder (*Preferred*) <br>
2. by opening Skin/General/Diabetes/HeartApp.mlapp (!not PredictionsApp.mlapp). <br>
<br>
!! Note: If the programm is opening in the second way, the necessary folder may not be added to the path and this has to be done manuelly (rightclick 'Project' -> Add to path -> Selected folders and subfolders)!!  <br>
<br>
If a diagnosis is saved, a file will be created in 'Project/Downloads'  <br>
<br>
!! Note: More details about the program are below or in additional ReadME files !! 



# Overview

## Motivation
This program is supposed to be a supportive tool to diagnose diseases. In Theory, a doctor (or a patient) can input data into one of the tabs in our program and a machine learning model will predict whether this data might suggest a diagnosis, based on the data used to train the model.

The Program was made with matlab Simulink and the matlab App Designer.

## Diseases and Datasets used
#### Dataset General
Contains symptoms for a list of diseases. The patient or doctor can choose symptoms out of the provided list and the model outputs which disease the symptoms match the most according to the training data.

Source: 

#### Dataset HeartDisease
Using two Datasets with different data categories concerning (risk) factors that could increase risk for heart disease, or factors that indicate the patient has heart disease. The patient or doctor can use the two columns (one for each dataset) to input different datapoints and the models predict whether the patient has heart disease (or a high risk) or not.

Source:

#### Dataset Diabetes
Using a Dataset containing different factors that show differences in patients with and without heart disease. The patient or doctor can input values for each category and the program outputs whether the patient most likely has diabetes or not.

Source:

## ML Models used
We used Bagged Trees to predict diseases. More on that further down.

## Useful links
(links to the other readmes, etc)


# Machine Learning Models

Bagged Trees were used as models to predict the data. Matlab has an integrated environment to train the models and save them.

## Bagged Trees

### Decision Trees
Bagged trees are Decision trees that classify Data into categories. For Instance, in the General Dataset, categories represent the different diseases that the symptoms are sorted into. Since Decision trees tend to overfit, we used Bagging.

### Bagged Trees
With Bagging, many datasets are generated out of the original dataset using the Bootstrap Method where datapoints are randomly chosen out of the original dataset (sampling with replacement) until the bootstrap dataset has as many datapoints as the original dataset - each bootstrap dataset contains data from the original, but may not contain all data from the original. The Result are many datasets that are similar to the original dataset, but not the same. On each of these bootstrapped datasets you train a decision tree. Finally you aggregate the trees by taking the average probability for each class.

## How we use the models
(Reference to the other readmes here that are specific to the models)

# GUI

## Thoughts behing UI
why designed this way

## Explain the tabs
refer to the models here
