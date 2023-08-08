### README LumpySkinBaggedTreeModel
This file contains information about the lumpy skin model "LumpySkinBaggedTreeModel.mat"

### Usage
Use the model by calling the predict() func of the model. <br>
Model uses 7 values of type double for prediction. <br>
Order of parameter: 'cld'	'dominant_land_cover'	'frs'	'pre'	'tmn'	'tmp'	'tmx'	'vap'	'wet'	'x'	'y' <br>
Parameter not included: region, country, reportingDate, dtr, pet, elevation, X5_Ct_2010_Da, X5_Bf_2010_Da, lumpy (target)

### Training
Data (24803 entries) was splitted in 90% training data, 10% test data. <br>
Training method was 10 - cross validation split

### Accuracy
The model had a 98.1% training accuracy and a 97.9% test accuracy <br>
Note: The accuracy for the result 'no lumpy' is at 99.1%, and the accuracy of result 'lumpy' at 90.9%
<img width="593" alt="Bildschirm­foto 2023-07-06 um 14 07 36" src="https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/assets/116288221/bd44ab89-fb98-4b22-a89b-5bb6432720ad">
<img width="286" alt="Bildschirm­foto 2023-07-06 um 14 09 32" src="https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/assets/116288221/67da1fee-b4d4-4999-8d4c-904774fdd849">
