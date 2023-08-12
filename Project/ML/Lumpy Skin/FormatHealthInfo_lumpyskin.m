%% Idea:
% make a big table with the different values.
% each row is a type of symptom/value
% colnames:     (shortened) name in the original dataset (col names)
% healthyAvg:   average of what healthy people have in this value

% array with shortened names
colnames = ["x", 
    "y",
    "cld", 
    "frs", 
    "pre", 
    "tmn",
    "tmp",
    "tmx", 
    "vap", 
    "wet",
    "dominant_land_cover"];

% array with healthy average values
dataLumpy = readtable(['Project' filesep 'ML' filesep 'Lumpy Skin' filesep 'Lumpy skin disease data.csv']);

healthyAvg = zeros(1,11);
sumOfHealthyValues = zeros(1,11);

rows = height(dataLumpy);
currentcolumn = 1;

for k = 1:17
    for row = 1:rows
        % only for the rows we want
        if k == 1 | k == 2 | k == 6 | k == 8 | k == 10 | k == 11 | k == 12 | k == 13 | k == 14 | k == 15 | k == 17
            if dataLumpy{row,"lumpy"} == 0
                % if not lumpy, add healthy value to array
                % dataLumpy{row,k}
                % k
                % row
                healthyAvg(currentcolumn) = healthyAvg(currentcolumn)+dataLumpy{row,k};
                %if k == 4 | k == 5 | k == 8 | k == 10
                    if dataLumpy{row, k} ~= 0
                        % ignore patients where there is no information for this
                        % symptom/value and values are not categorical
                        sumOfHealthyValues(currentcolumn) = sumOfHealthyValues(currentcolumn) + 1;
                    end
                %else
                %        sumOfHealthyValues(currentcolumn)=sumOfHealthyValues(currentcolumn)+1;
                %end
                
            end 
        end
    end
    % to keep the right indexes, only increase the current column if we're
    % in one of the columns we want
    if k == 1 | k == 2 | k == 6 | k == 8 | k == 10 | k == 11 | k == 12 | k == 13 | k == 14 | k == 15 | k == 17
        currentcolumn = currentcolumn+1;
    end
end


% divide sum of all values of all healthy people by the number of values
for k = 1:11
    healthyAvg(k) = healthyAvg(k) / sumOfHealthyValues(k);
end

sumOfHealthyValues;
healthyAvg;

healthyAvg = healthyAvg';

% make table
health_info = table(colnames, healthyAvg);

writetable(health_info, "lumpyskin_averageHealthyValues.csv");