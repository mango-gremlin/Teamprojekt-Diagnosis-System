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

# Overview

## Motivation
This program is supposed to be a supportive tool to diagnose diseases. In Theory, a doctor (or a patient) can input data into one of the tabs in our program and a machine learning model will predict whether this data might suggest a diagnosis, based on the data used to train the model.

The Program was made with matlab Simulink and the matlab App Designer.

## Diseases and Datasets used
#### Dataset General
Contains symptoms for a list of diseases. The patient or doctor can choose symptoms out of the provided list and the model outputs which disease the symptoms match the most according to the training data.

Source: 
https://www.kaggle.com/datasets/itachi9604/disease-symptom-description-dataset?resource=download&select=symptom_precaution.csv

#### Dataset Heart Disease
Using two Datasets with different data categories concerning (risk) factors that could increase risk for heart disease, or factors that indicate the patient has heart disease. The patient or doctor can use the two columns (one for each dataset) to input different datapoints and the models predict whether the patient has heart disease (or a high risk) or not.

Source:
https://www.kaggle.com/datasets/johnsmith88/heart-disease-dataset
https://www.kaggle.com/datasets/alexteboul/heart-disease-health-indicators-dataset


#### Dataset Diabetes
Using a Dataset containing different factors that show differences in patients with and without heart disease. The patient or doctor can input values for each category and the program outputs whether the patient most likely has diabetes or not.

Source:
https://www.kaggle.com/datasets/vikasukani/diabetes-data-set
https://www.kaggle.com/datasets/jillanisofttech/diabetes-disease-updated-dataset

#### Dataset Lumpy Skin
TODO

Source:
https://www.kaggle.com/datasets/saurabhshahane/lumpy-skin-disease-dataset

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

## Thoughts behind UI
We decided to separate the app based on the different datasets that were provided and its diseases.
At first we settled on a tab structure but this led to some unresolvable merge conflicts because of Matlab. So we chose a multi-app system instead: one start-up app to chose which diagnosis tool you want to use, four apps for the different diseases, and one app that will display your results.

## Explanation of apps
We had to decide which values from the datasets can be used to build this diagnostic tool and make edit fields based on them for the user to fill out.
For general we could simply use the different symptoms that can then be selected by the user.
For diabetes, heart disease and lumpy skin we use a mixture of edit fields, drop-downs, checkboxes and spinners based on what would be the most intuitive for the user experience.
The results will then be forwarded to the prediction app and presented there. 
It displays the diagnosis, which values can be considered unhealthy, and further information on what precautions to take. There is also a button to save these results and download them as a text file.
