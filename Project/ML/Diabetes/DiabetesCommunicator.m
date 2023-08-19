classdef DiabetesCommunicator
    %DIABETESCOMMUNICATOR Summary of this class goes here
    %   takes the input from gui
    %   loads diabetes model
    %   predicts with model
    %   returns predicted value
    %
    %   furthermore: 
    %   compares input to healthy values, and gives info text on unhealthy
    %   values.

        
    methods(Static)
               
        function outputArg = returnPrediction(input)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            load(['Project' filesep 'ML' filesep 'Diabetes' filesep 'diabetesBaggedTreeModel.mat']);
            model = diabetesBaggedTreeModel;
            prediction = model.predictFcn(input);
            
            if prediction(1) == 1
                outputArg = "diabetes";
            else
                outputArg = "no diabetes";
            end

        end

        function outputArg = returnInfo(input)
            outputArg = SuperCommunicator.returnInfo(['Project' filesep 'ML' filesep 'Diabetes' filesep 'Health_Information' filesep 'diabetes_infotext.csv'], DiabetesCommunicator.getUnhealthyValues(input));
        end

        function outputArg = getUnhealthyValues(input)
            % GETUNHEALTHYVALUES checks for each input value whether is is healthy
            % and save info on what values are unhealthy & how to change
            % them in an output table and returns this table

            % read in table of healthy values
            healthyAvg = readtable(['Project' filesep 'ML' filesep 'Diabetes' filesep 'Health_Information' filesep 'diabetes_averageHealthyValues.csv']);

            healthyAvg;

            % check input for joint_heart for unhealthy values

            % loop through input, compare input with respective healthy
            % value
            % 
            inputRows = 7;
            
        
            % create a new table that saves whether values were unhealthy
            % (TRUE) or healthy (FALSE)
            % the row numbers reflect those in the healthyAvg and
            % HealthInfo Tables
            unhealthyValues = zeros(1,7);

           
            for row = 1:inputRows
                switch row 
                    % 2: Glucose
                    % 3: Blood Pressure
                    % 4: Skin Thickness
                    % 5: Insulin
                    % higher than average = unhealthy
                    case {2, 3, 4, 5}
                        if(healthyAvg.healthyAvg(row) <= input.(row))
                            unhealthyValues(row) = true;
                        end 
                    % 1: Pregnancies
                    % 1 or above = unhealthy
                    case 1
                        if(input.(row) >= 1)
                            unhealthyValues(row) = true;
                        end
                    % 6: BMI
                    % 25 or above = unhealthy
                    case 6
                        if(input.(row) >= 25) 
                            unhealthyValues(row) = true;
                        end
                    % 7: Age
                    % higher than average = unhealthy
                    case 7
                        if(input.(row) >= healthyAvg.healthyAvg(row))
                            unhealthyValues(row) = true;
                        end
                    otherwise
                 end
            end      

            outputArg = unhealthyValues;
        end 

    end
end

