%% Idea:
% make a big table with the different values.
% each row is a type of symptom/value
% colnames:     (shortened) name in the original dataset (col names)
% fullnames:    long name that is understandable
% healthyAvg:   average of what healthy people have in this value
% Info:         additional info on the type of value


% array with shortened names
% age and sex omitted for obvious reasons
colnames = ["cp", 
    "trestbps", 
    "chol", 
    "fbs", 
    "restecg", 
    "thalach", 
    "exang", 
    "oldpeak", 
    "slope", 
    "ca", 
    "thal"]

% array with full names
fullnames = ["chest pain type", 
    "resting blood pressure (mm/Hg)",
    "serum cholesterol (mg/dl)",
    "fasting blood sugar > 120 mg/dl",
    "resting electrocardiographic results",
    "max heart rate achieved",
    "exercise induced angina",
    "ST depression induced by exercise relative to rest",
    "slope of the peak exercise ST segment",
    "number of major vessels colored by fluoroscopy",
    "thalassemia trait"]

% array with healthy average values
data = readtable("ML/Heart Disease/joined_heart_heartdisease.csv");

healthyAvg = zeros(1,11);
sumOfHealthyValues = zeros(1,11);

rows = height(data)

for k = 3:13
    for row = 1:rows
        if data{row,"target"} == 0
            % if this patient has no heart disease, add healthy value to
            % array
            healthyAvg(k-2) = healthyAvg(k-2)+data{row,k};
            if k == 4 | k == 5 | k == 8 | k == 10
                if data{row, k} ~= 0
                    % ignore patients where there is no information for this
                    % symptom/value and values are not categorical
                    sumOfHealthyValues(k-2) = sumOfHealthyValues(k-2) + 1;
                end
            else
                    sumOfHealthyValues(k-2)=sumOfHealthyValues(k-2)+1;
            end
            
        end 
    end
end


% divide sum of all values of all healthy people by the number of values
for k = 1:11
    healthyAvg(k) = healthyAvg(k) / sumOfHealthyValues(k);
end

sumOfHealthyValues

healthyAvg = healthyAvg'

% make table
health_info = table(colnames,fullnames,healthyAvg)