### README tidyHeartModel
This file contains information about the model tidyHeartBaggedTreeModel.mat. <br>
The data to train this model is in the file tidy_heart_disease_indicators.csv under archive/Datasets/Heart/

### Usage
Use the model by calling the predict() func of the model.  <br>
Model uses a array of size 14 representing the 14 different values that can be entered in the GUI. All values are natural numbers, either representing a category or a value in a certain range. <br>


### Training
Data (253 681 samples) was splitted in 90% training data, 10% test data. <br>
Training method was 5 - cross validation split

### Accuracy 
The model was prepruned by adjusting the parameter, number of learners and maximum number of splits. <br>
The model with the best performance was model 7. <br>
The accurcay was 90.7% on the training set. <br>
And 90.7% on the test set. <br>


<img width="351" alt="247603891-4e9af4ae-d38a-4bd6-a888-ce888e251b10" src="https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/assets/116288221/bda68751-55c2-46af-9fc5-a8a13995573e">
