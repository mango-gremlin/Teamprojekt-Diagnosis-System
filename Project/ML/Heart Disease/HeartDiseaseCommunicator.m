classdef HeartDiseaseCommunicator
    %HEARTDISEASECOMMUNICATOR %   takes the input from gui
    %   loads both heart disease models
    %   checks whether both models received input
    %   predicts with both models
    %   returns predicted value
    %
    %   furthermore: 
    %   compares input to healthy values, and gives info text on unhealthy
    %   values.
    % contians the functions:
    % - returnPrediction: returns a prediction of heart disease outcome on the
    % input values
    % - returnInfo: calls the supercommunicator returnInfo function using
    % the heart disease info table and heart disease unhealthy values function as
    % input
    % - getUnhealthyValues: according to average healthy values &
    % literature, assesses which input values can be classified as
    % unhealthy

    methods(Static)
        
        function outputArg = returnPrediction(input_joint, input_tidy)
            % RETURN PREDICTION loads both heart disease models and uses the input
            % to make a prediction on heart disease outcome, which is outputted
            % as a string
            % also checks whether both models received input and only
            % predicts on the model(s) that received an input
            %
            % Arguments:
            % - input from GUI (table)
            
            % check if joint_input is empty
            rows_j = height(input_joint);

            isnotempty = false;

            for row = 1:rows_j
                for col = 1:13
                    if input_joint{row,col} ~= 0
                            isnotempty=true;
                    end
                end
            end

            %if it isnt empty, load model and predict for input
            if isnotempty
                load(['Project' filesep 'ML' filesep 'Heart Disease' filesep 'jointHeartBaggedTreeModel.mat']);
                model_jointHeart = jointHeartBaggedTreeModel;
                prediction_jointHeart = model_jointHeart.predictFcn(input_joint);
            end

            % check if tidy_input is empty
            rows_j = height(input_tidy);

            isnotempty_tidy = false;

            for row = 1:rows_j
                for col = 1:14
                    if input_tidy{row,col} ~= 0
                            isnotempty_tidy=true;
                    end
                end
            end

            if isnotempty_tidy
                load(['Project' filesep 'ML' filesep 'Heart Disease' filesep 'tidyHeartBaggedTreeModel.mat']);
                model_tidyHeart = tidyHeartBaggedTreeModel;
                prediction_tidyHeart = model_tidyHeart.predictFcn(input_tidy);
            end
          
            %compare and get a consensus result
            if isnotempty & isnotempty_tidy
                %if there was input for both datasets
                if prediction_jointHeart(1) == prediction_tidyHeart(1)
                    if prediction_jointHeart(1) == 1
                        outputArg = "heart disease";
                    else
                        outputArg = "no heart disease";
                    end
                else
                    outputArg = "result inconclusive";
                end
            elseif isnotempty
                    %if there was input only for joint
                    if prediction_jointHeart(1) == 1
                        outputArg = "heart disease";
                    else 
                        outputArg = "no heart disease";
                    end
            elseif isnotempty_tidy
                    %if there was input only for tidy
                    if prediction_tidyHeart(1) == 1
                        outputArg = "heart disease";
                    else 
                        outputArg = "no heart disease";
                    end
            end
        end

        function outputArg = returnInfo(input_joint, input_tidy)
            % RETURN INFO loads the supercommunicator return info function
            % with heart disease health info table and heart disease unhealthy values
            % function as input
            %
            % Arguments:
            % - input from GUI (table)
            [unhealthy, categories] = HeartDiseaseCommunicator.getUnhealthyValues(input_joint, input_tidy)

            outputArg = SuperCommunicator.returnInfo(['Project' filesep 'ML' filesep 'Heart Disease' filesep 'Health_Information' filesep 'heart_infotext.csv'], unhealthy);
        end

        function [unhealthy, categories] = getUnhealthyValues(input_joint, input_tidy)
            % GETUNHEALTHYVALUES checks for each input value whether is is healthy
            % and save info on what values are unhealthy & how to change
            % them in an output table and return this table
            % also returns the unhealthy categories
            %
            % Arguments:
            % - input from GUI (table)

            % read in table of healthy values
            healthyAvg = readtable(['Project' filesep 'ML' filesep 'Heart Disease' filesep 'Health_Information' filesep 'heart_averageHealthyValues.csv']);

            % check input for joint_heart for unhealthy values

            % loop through input, compare input with respective healthy
            % value
            % 
            inputJointRows = 13;
            
            % create a new array that saves whether values were unhealthy
            % (TRUE) or healthy (FALSE)
            % the row numbers reflect those in the healthyAvg and
            % HealthInfo Tables
            unhealthyValues = zeros(1,24);

            % for the output of which values were unhealthy, we need
            % another array where the indices correspond to the indices in
            % the actual input
            unhealthyCategories = zeros(width(input_joint)+width(input_tidy),0);

            % INPUT JOINT 
            %ignore age here because age here & in input tidy should be the
            %same
            for row = 3:inputJointRows
                switch row 
                    % 3: chest pain: 0 means asymptomatic
                    % 6: fasting blood sugar: 0 means low
                    % 9: exercise induced angina: 0 means no angina
                    case {3, 6, 9}
                        if(input_joint.(row) ~= 0)
                            unhealthyValues(row-2) = true;
                            unhealthyCategories(row) = true;
                        end
                    % 4: resting blood pressure
                    % 5: serum cholesterol
                    % 8: max heart rate
                    % higher than average = unhealthy
                    case {4, 5, 8}
                        if(healthyAvg.healthyAvg(row-2) <= input_joint.(row))
                            unhealthyValues(row-2) = true;
                            unhealthyCategories(row) = true;
                        end 
                    % 7: resting electrocardiographic results: 1 is normal
                    % 11: slope of ST segment: 1 is flat
                    case {7, 11}
                        if(input_joint.(row) ~= 1)
                            unhealthyValues(row-2) = true;
                            unhealthyCategories(row) = true;
                        end
                    % 10: st depression (oldpeak)
                    % 12: number of vessels coloured (blood flow)
                    %lower than average = unhealthy
                    case {10,12}
                        if(healthyAvg.healthyAvg(row-2) >= input_joint.(row))
                            unhealthyValues(row-2) = true;
                            unhealthyCategories(row) = true;
                        end 
                    % 13: thalassemia trait: 2 is normal
                    case 13
                        if(input_joint.(row) ~= 2)
                            unhealthyValues(row-2) = true;
                            unhealthyCategories(row) = true;
                        end
                   end
            end 

            % INPUT TIDY
            % include age & sex here. Sex is always classified as
            % "unhealthy" as there are risk factors for all sexes and
            % genders.
            % age only classified as unhealthy if > 45 (risk increases)

            % number of rows in input tidy
            inputTidyRows = 14;

            for row = 3:inputTidyRows
                switch row
                    % 13: sex: always classified as unhealthy because risk
                    % factors for all sexes.
                    case 13
                        unhealthyValues(23) = true;
                        unhealthyCategories(row+13) = true;
                        unhealthyCategories(2) = true;
                    % 14: age: risk for > 45
                    case 14 
                        if (input_tidy.(row) >= 45)
                            unhealthyValues(22) = true;
                            unhealthyCategories(row+13) = true;
                            unhealthyCategories(1) = true;
                        end 
                    % 3: BMI
                    % higher than 25 = unhealthy
                    case 3
                        if (input_tidy.(row) >= 25)
                            unhealthyValues(row+9) = true;
                            unhealthyCategories(row+13) = true;
                        end
                    % 4: Smoker
                    % 5: Stroke
                    % 6: Diabetes
                    % 8: Heavy Alcohol Consumption
                    % 12: Difficulty Walking
                    % 0 = healthy
                    case {4, 5, 6, 8, 12}
                        if (input_tidy.(row) ~= 0)
                            unhealthyValues(row+9) = true;
                            unhealthyCategories(row+13) = true;
                        end
                    % 7: Physical Activity
                    % 0 = unhealthy
                    case 7
                        if (input_tidy.(row) ~= 1)
                            unhealthyValues(row+9) = true;
                            unhealthyCategories(row+13) = true;
                        end
                    % 9: General Health
                    % above 3 = unhealthy
                    case 9 
                        if (input_tidy.(row) >= 3)
                            unhealthyValues(row+9) = true;
                            unhealthyCategories(row+13) = true;
                        end
                    % 10: Mental Health
                    % 11: Physical Health
                    % 1 or above = unhealthy
                    case {10, 11} 
                        if (input_tidy.(row) >= 1)
                            unhealthyValues(row+9) = true;
                            unhealthyCategories(row+13) = true;
                        end
                    end
            end
           
            unhealthy = unhealthyValues;
            categories = unhealthyCategories;
        end 

    end
end


