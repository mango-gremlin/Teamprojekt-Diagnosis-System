### README diabetesBaggedTreeModel
This file contains information about the diabetes model "diabetesBaggedTreeModel.mat"):  [model](diabetesBaggedTreeModel.mat)

### Usage
Use the model by calling the predict() func of the model. <br>
Model uses 7 values of type double for prediction. <br>
Order of parameter: pregnancy, glucose, bloodpressure, skinthickness, insulin, bmi, age -> binary output <br>
Parameter not included: DiabetesPedegreeFunction

### Training
Data (2769 entries) was splitted in 90% training data, 10% test data. <br>
Training method was 10 - cross validation split

### Accuracy
The model had a 98.7% training accuracy and a 99.3% test accuracy 
