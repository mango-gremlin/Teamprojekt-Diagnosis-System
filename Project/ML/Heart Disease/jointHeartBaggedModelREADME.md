### README jointHeartBaggedTreeModel
This file contains information about the heart model jointHeartBaggedTreeModel.

### Usage
Use the model by calling the predict() func of the model. <br>
Model uses 23 values of type double for prediction. <br>
Order of parameter: 'age'	'ca'	'chol'	'cp'	'exang'	'fbs'	'oldpeak'	'restecg'	'sex'	'slope'	'thal'	'thalach' -> binary output <br>
Parameter not included: target

### Training
Data (1945 entries) was splitted in 90% training data, 10% test data. <br>
Training method was 5 - cross validation split

### Accuracy
The model had a 88.5% training accuracy and a 83% test accuracy 

<img width="800" alt="initJointHeartDisease" src="https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/assets/116288221/54f0bb89-2d3e-4a81-9c47-1fcb85dc8920">
<img width="892" alt="InformationJoinedHeart" src="https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/assets/116288221/4805eb4d-dd7a-4ba4-a21a-6e3c44f6d300">
