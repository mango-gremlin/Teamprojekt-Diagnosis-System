# Teamprojekt-Diagnosis-System
Development of a supportive diagnosis System with a GUI using machine learning.

## Team:
| Name | Rolle | Matrikelnummer |
|:---------|---|---|
| Aylin Fischbach | GUI | 6069003 |
| Alec Talamas | GUI | 6373551 |
| Martin Kahabka| ML | 6125086 |
| Glenn Cockburn | ML | 5471236 |

Betreuer: Wolfgang Fuhl

# Overview

## Motivation
This program is supposed to be a supportive tool to diagnose diseases. In Theory, a doctor (or a patient) can input data into one of the tabs in our program and a machine learning model will predict whether this data might suggest a diagnosis, based on the data used to train the model.

The Program was made with matlab Simulink and the matlab App Designer.

## How to use the program
The base folder of the program is 'Project' or alternative (but not preferred) 'Teamprojekt-Diagnosis-System'
 The program should be accessed through matlab. When the program is opened, the current folder should be either 
 1. 'Teamprojekt-Diagnosis-System' 
 2. 'Project' (*preferred*)
 3. subfolder of the above <br> 
 <br>
 !!! DO NOT OPEN THE 'startUpApp.mlapp' from a parent folder of 'Teamprojekt-Diagnose-System' !!! <br>
(nothing bad will happen, but the program will not work)
 <br>
 <br>
 The program can be executed by  <br>
 1. opening the StartUpApp.mlapp in the 'Project' folder (*Preferred*) <br>
 2. by opening SkinApp.mlapp, GeneralApp.mlapp, Diabetes.mlapp, or HeartApp.mlapp in the 'Project/GUI' folder (!not PredictionsApp.mlapp). <br>
 <br>
 !! Note: If the programm is openened using approach 2, the necessary folder may not be added to the path and this has to be done manually (rightclick 'Project' -> Add to path -> Selected folders and subfolders)!!  <br>
 <br>
 If a diagnosis is saved, a file will be created in 'Project/Downloads'  <br>
 <br>
 !! Note: More details about the program are below or in additional ReadME (linked) files !! 

## Project Structure
![Project Structure4](https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/assets/104830903/8cf89e6b-c148-415b-8cff-9bbc2558d310)


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
Contains different environmental factors that can lead to lumpy skin disease, which affects cattle. A cow or a veterinarian can input environmental factors such as latitude/longitude on a map, or cloud cover etc and get a prediction on how risky it is to develop lumpy skin disease.

Source:
https://www.kaggle.com/datasets/saurabhshahane/lumpy-skin-disease-dataset

## ML Models used
We used Bagged Trees to predict diseases. (see below) We created them using Matlab Simulink.

# Machine Learning Models

Bagged Trees were used as models to predict the data. Matlab has an integrated environment to train the models and save them.

## Bagged Trees

### Decision Trees
Bagged trees are Decision trees that classify Data into categories. For Instance, in the General Dataset, categories represent the different diseases that the symptoms are sorted into. Since Decision trees tend to overfit, we used Bagging.

### Bagged Trees
With Bagging, many datasets are generated out of the original dataset using the Bootstrap Method where datapoints are randomly chosen out of the original dataset (sampling with replacement) until the bootstrap dataset has as many datapoints as the original dataset - each bootstrap dataset contains data from the original, but may not contain all data from the original. The Result are many datasets that are similar to the original dataset, but not the same. On each of these bootstrapped datasets you train a decision tree. Finally you aggregate the trees by taking the average probability for each class.

## How we use the models
For each dataset we created a separate bagged tree model with Simulink which we can run predictions with. Heart Disease had two datasets, so it has two models.
For each model we calculated accuracies and wrote detailed documentation, which can be found here:

[Diabetes Readme](https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/blob/661b838a2e366d13daa1f77450b1affaa859c5b6/Project/ML/Diabetes/diabetesModelREADME.md)

[Heart Disease Readme Dataset 1](https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/blob/661b838a2e366d13daa1f77450b1affaa859c5b6/Project/ML/Heart%20Disease/tidyHeartREADME.md) and [Heart Disease Readme Dataset 2](https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/blob/661b838a2e366d13daa1f77450b1affaa859c5b6/Project/ML/Heart%20Disease/jointHeartBaggedModelREADME.md)

[Lumpy Skin Readme](https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/blob/661b838a2e366d13daa1f77450b1affaa859c5b6/Project/ML/Lumpy%20Skin/LumpySkinModelREADME.md)

[General Readme](https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/blob/661b838a2e366d13daa1f77450b1affaa859c5b6/Project/ML/General/generalModelREADME.md)

# GUI

<p float="left">
  <img src="https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/assets/116217918/c20230c6-ff38-4cac-96bd-36159297d84a" width="49%" />
  <img src="https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/assets/116217918/870b11c2-7657-47ef-b082-253c345120ad" width="49%" /> 
General, Diabetes</p>

<p float="left">
  <img src="https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/assets/116217918/f00e4274-a35d-4eef-bd53-424ed7158e3e" width="49%" /> 
  <img src="https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/assets/116217918/60b81a63-03d8-41cb-88e7-470647f1e7ab" width="49%" />
Heart Disease, Lumpy Skin
</p>





## Thoughts behind UI
We decided to separate the app based on the different datasets that were provided and its diseases.
At first we settled on a tab structure but this led to some unresolvable merge conflicts because of Matlab. So we chose a multi-app system instead: one start-up app to chose which diagnosis tool you want to use, four apps for the different diseases, and one app that will display your results.

## Explanation of apps
We had to decide which values from the datasets can be used to build this diagnostic tool and make edit fields based on them for the user to fill out.
For general we could simply use the different symptoms that can then be selected by the user.
For diabetes, heart disease and lumpy skin we use a mixture of edit fields, drop-downs, checkboxes and spinners based on what would be the most intuitive for the user experience.
The results will then be forwarded to the prediction app and presented there. 
It displays the diagnosis, which values can be considered unhealthy, and further information on what precautions to take. There is also a button to save these results and download them as a text file.

# Research and Health Info
The program also outputs information on which input values could be unhealthy and how to change that. The health information is saved in a csv table. This makes the prediction a bit more useful, since one can understand which input values led to the prediction in the first place, making it possible to selectively improve values that could have led to bad health.
Additionally, to make it even easier to see what was unhealthy, the output also includes the input values as well as a list of which input values were classified as unhealthy.
