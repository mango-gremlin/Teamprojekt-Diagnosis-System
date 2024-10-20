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
    "thal",
    "BMI",
    "Smoker",
    "Stroke", 
    "Diabetes",
    "PhysActivity",
    "HvyAlcoholConsump",
    "GenHlth",
    "MentHlth",
    "PhysHlth",
    "DiffWalk",
    "Sex", 
    "Age"];

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
    "thalassemia trait",
    "Body Mass Index",
    "smoked at least 100 cigarettes",
    "ever had a stroke",
    "diabetes diagnosis",
    "physical activity/exercise in the past 30 days",
    "heavy alcohol consumption",
    "general health",
    "mental health",
    "physical health",
    "difficulty walking or climbing stairs",
    "age in years",
    "sex"];

% array with healthy average values
dataHeart = readtable(['Project' filesep 'ML' filesep 'Heart Disease' filesep 'Datasets' filesep 'joined_heart_heartdisease.csv']);

healthyAvg = zeros(1,23);
sumOfHealthyValues = zeros(1,23);

rows = height(dataHeart);

for k = 3:13
    for row = 1:rows
        if dataHeart{row,"target"} == 0
            % if this patient has no heart disease, add healthy value to
            % array
            healthyAvg(k-2) = healthyAvg(k-2)+dataHeart{row,k};
            if k == 4 | k == 5 | k == 8 | k == 10
                if dataHeart{row, k} ~= 0
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

sumOfHealthyValues;
healthyAvg;

% load heart disease health indicators dataset and compute average of
% healthy values
dataHeartIndicators = readtable(['Project' filesep 'ML' filesep 'Heart Disease' filesep 'Datasets' filesep 'tidy_heart_disease_indicators.csv']);

healthyAvg2 = zeros(1,12);
sumOfHealthyValues2 = zeros(1,12);

rows2 = height(dataHeartIndicators);

for k = 4:13
    for row = 1:rows2
        if dataHeartIndicators{row,"HeartDiseaseorAttack"} == 0
            % if this patient has no heart disease/heart attack, 
            % add healthy value to array
            healthyAvg2(k-3) = healthyAvg2(k-3)+dataHeartIndicators{row,k};
            sumOfHealthyValues2(k-3)=sumOfHealthyValues2(k-3)+1;
          
            % if k == 4 | k == 5 | k == 8 | k == 10
            %     if dataHeartIndicators{row, k} ~= 0
            %         % ignore patients where there is no information for this
            %         % symptom/value and values are not categorical
            %         sumOfHealthyValues(k-2) = sumOfHealthyValues(k-2) + 1;
            %     end
            % else
            %         sumOfHealthyValues(k-2)=sumOfHealthyValues(k-2)+1;
            % end
            
        end 
    end
   % tableIndex
    healthyAvg2;
   % tableIndex = tableIndex+1;
end

% divide sum by number of values
for k = 1:10
    healthyAvg2(k) = healthyAvg2(k) / sumOfHealthyValues2(k);
end

% put the new values into healthyvalues2
for k = 12:23
    healthyAvg(k) = healthyAvg2(k-11);
end



healthyAvg = healthyAvg';

% make table
health_info = table(colnames,fullnames,healthyAvg);

writetable(health_info, "heart_averageHealthyValues2.csv")


