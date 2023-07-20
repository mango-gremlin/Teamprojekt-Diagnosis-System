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
