% The Datasets heart.csv and heart_disease_uci.csv are very similar and can
% be fused together.

% heart_disease_uci.csv columns:
% * id        of the person
% age       in years
% sex       sex
% * dataset   location of data collection
% * cp        chest pain type:
%            - typical angina
%            - atypical angina
%            - non-anginal
%            - asymptomatic
% trestbps  resting blood pressure 
%           (in mm Hg on admission to the hospital)
% chol      serum cholesterol in mg/dl
% fbs       if fasting blood sugar > 120 mg/dl 
%           (true/false)
% * restecg   resting electrocardiographic results
%            - normal
%            - stt abnormality
%            - lv hypertrophy
% * thalch    max heart rate achieved
% exang     exercise induced angina (true/false)
% oldpeak   ST depression induced by exercise 
%           relative to rest
% * slope     slope of the peak exercise ST segment
%            - flat
%            - downsloping  
%            - upsloping
% ca    	number of major vessels colored by 
%           fluoroscopy
%            - 0
%            - 1
%            - 2
%            - 3
% * thal     thalassemia; blood flow in the heart
%            - 1: fixed defect (no blood flow in some part of the heart)
%            - 2: normal blood flow
%            - 3: reversible defect (a blood flow is observed but it is not normal)
% * num       target
%            - 0 (no heart disease)
%            - stages of heart disease (1,2,3,4)

% heart.csv columns:
% age       in years
% sex       sex (1 = male, 0 = female)
% cp        chest pain type:
%            - (0) typical angina
%            - (1) atypical angina
%            - (2) non-anginal
%            - (3) asymptomatic
% trestbps  resting blood pressure 
%           (in mm Hg on admission to the hospital)
% chol      serum cholesterol in mg/dl
% fbs       if fasting blood sugar > 120 mg/dl 
%           (true/false)
% restecg   resting electrocardiographic results
%            - (0) normal 
%            - (1) stt abnormality 
%            - (2) lv hypertrophy 
% thalach   max heart rate achieved
% exang     exercise induced angina (true/false)
% oldpeak   ST depression induced by exercise 
%           relative to rest
% slope     slope of the peak exercise ST segment
%            - (0) flat
%            - (1) downsloping  
%            - (2) upsloping
% ca    	number of major vessels colored by 
%           fluoroscopy
%            - 0
%            - 1
%            - 2
%            - 3
% thal      ???
%            - (1) normal
%            - (2) fixed defect
%            - (3) reversible defect
% num       target
%            - (0) (no heart disease)
%            - (1) stages of heart disease (1,2,3,4)


% load both datasets
heart = readtable("Datasets\Heart\heart.csv")
heart_disease = readtable("Datasets\Heart\heart_disease_uci_refactored_formatted.csv")
heart_disease = fillmissing(heart_disease, 'constant', 0)

%heart_disease_NaNs = isnan(heart_disease)

% iterate through heart_disease to transform NaN into -1
%table_size = heart_disease.size();
%rows = height(heart_disease);
%
%for row = 1:rows
%    for col = 1:14
%        if heart_disease_NaNs{row,col}
%            heart_disease{row,col} = -1;    
%        en
%    end
%end

% join
joined_heart = [heart;heart_disease]

height(joined_heart)

% save new table
writetable(joined_heart, "joined_heart_heartdisease.csv")























