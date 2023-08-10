%% Idea:
% make a big table with the different values.
% each row is a type of symptom/value
% colnames:     (shortened) name in the original dataset (col names)
% healthyAvg:   average of what healthy people have in this value

% array with shortened names
colnames = ["Pregnancies", 
    "Glucose", 
    "BloodPressure", 
    "SkinThickness", 
    "Insulin", 
    "BMI", 
    "Age"];

% array with average healthy values
% array with healthy average values
datadiabetes = readtable(['Project' filesep 'ML' filesep 'Diabetes' filesep 'diabetes-dataset-full.csv']);

healthyAvg = zeros(1,8);
sumOfHealthyValues = zeros(1,8);

rows = height(datadiabetes);

for k = 1:8
    for row = 1:rows
        if datadiabetes{row,"Outcome"} == 0
            % if this patient has no diabetes, add healthy value to
            % array
            healthyAvg(k) = healthyAvg(k)+datadiabetes{row,k};
            if k == 2 | k == 3 | k == 4 | k == 5 | k == 6
                if datadiabetes{row, k} ~= 0
                    % ignore patients where there is no information for this
                    % symptom/value and values are not categorical
                    sumOfHealthyValues(k) = sumOfHealthyValues(k) + 1;
                end
            else
                    sumOfHealthyValues(k)=sumOfHealthyValues(k)+1;
            end
        end 
    end
end


% divide sum of all values of all healthy people by the number of values
for k = 1:8
    healthyAvg(k) = healthyAvg(k) / sumOfHealthyValues(k);
end

sumOfHealthyValues;
healthyAvg;

% remove diabetes pedigree function
healthyAvg(7) = [];

healthyAvg = healthyAvg';

% make table
health_info = table(colnames,healthyAvg);

writetable(health_info, "diabetes_averageHealthyValues.csv");


