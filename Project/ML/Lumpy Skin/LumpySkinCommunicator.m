classdef LumpySkinCommunicator
    %   LUMPYSKINCOMMUNICATOR
    %   takes the input from gui
    %   loads diabetes model
    %   predicts with model
    %   returns predicted value
    %
    %   furthermore: 
    %   compares input to healthy values, and gives info text on unhealthy
    %   values.
    %
    % contains the functions:
    % - returnPrediction: returns a prediction of lumpy skin outcome on the
    % input values
    % - returnInfo: calls the supercommunicator returnInfo function using
    % the lumpy skin info table and lumpy skin unhealthy values function as
    % input
    % - getUnhealthyValues: according to average healthy values &
    % literature, assesses which input values can be classified as
    % unhealthy
    
    methods(Static)
        
        function outputArg = returnPrediction(input)
            % RETURN PREDICTION loads the lumpy skin model and uses the input
            % to make a prediction on lumpy skin outcome, which is outputted
            % as a string
            %
            % Arguments:
            % - input from GUI (table)

            load(['Project' filesep 'ML' filesep 'Lumpy Skin' filesep 'lumpySkinBaggedTreeModel.mat']);
            model = lumpySkinBaggedTree;
            prediction = model.predictFcn(input);
                
            if prediction(1) == 1
                outputArg = "lumpy skin";
            else
                outputArg = "no lumpy skin";
            end
        end

        function outputArg = returnInfo(input)
             % RETURN INFO loads the supercommunicator return info function
            % with lumpy skin health info table and lumpy skin unhealthy values
            % function as input
            %
            % Arguments:
            % - input from GUI (table)

            [unhealthy, categories] = LumpySkinCommunicator.getUnhealthyValues(input);

            outputArg = SuperCommunicator.returnInfo(['Project' filesep 'ML' filesep 'Lumpy Skin' filesep 'Health_Information' filesep 'lumpyskin_infotext.csv'], unhealthy);
        end

        function [unhealthy, categories] = getUnhealthyValues(input)
            % GETUNHEALTHYVALUES checks for each input value whether is is healthy
            % and save info on what values are unhealthy & how to change
            % them in an output table and returns this table
            % also saves the categories that were unhealthy (since the
            % indices were shifted between the input and the info text
            % tables)
            %
            % Arguments:
            % - input from GUI (table)

            % read in table of healthy values
            healthyAvg = readtable(['Project' filesep 'ML' filesep 'Lumpy Skin' filesep 'Health_Information' filesep 'lumpyskin_averageHealthyValues.csv']);

            healthyAvg;

            % check input for joint_heart for unhealthy values

            % loop through input, compare input with respective healthy
            % value
            % 
            inputRows = 11;
            
            % first: reorder input from model because different order of
            % variables (for some reason...)
            input=input(:, [10 11 1 3:9 2]);

            % create a new table that saves whether values were unhealthy
            % (TRUE) or healthy (FALSE)
            % the row numbers reflect those in the health info text table
            % later
            unhealthyValues = zeros(1,8);

            % for the output of which values were unhealthy, we need
            % another array where the indices correspond to the indices in
            % the actual input
            unhealthyCategories = zeros(1,11);

            %input for the categories needs to be shifted again since input
            %order was changed
            for row = 1:inputRows
                switch row 
                    % 1: Latitude
                    % 2: Longitude
                    % count as 1 in unhealthyValues, include every lat/long
                    case {1,2}
                            unhealthyValues(1) = true;
                            unhealthyCategories(10) = true;
                            unhealthyCategories(11) = true;
                    % 3: Cloud Cover
                    % 5: Precipitation
                    % 9: Vapour Pressure
                    % 10: Wetness
                    % higher than average = unhealthy
                    case {3, 5, 9, 10}
                        if(healthyAvg.healthyAvg(row) <= input.(row))
                            if(row >= 9)
                                unhealthyValues(row-3) = true;
                            else
                                unhealthyValues(row-1) = true;
                            end 
                            %not elegant, but solves index-shifting:
                            switch row
                                case 3
                                    unhealthyCategories(1)=true;
                                case {5,9, 10}
                                    unhealthyCategories(row-1)=true;
                            end
                        end 
                    % 4: Frost
                    % lower than average = unhealthy
                    case 4
                        if(healthyAvg.healthyAvg(row) >= input.(row))
                            unhealthyValues(row-1) = true;
                            unhealthyCategories(3)=true;
                        end 
                    % 6, 7, 8: Temperature min, mean, max
                    % higher than average = unhealthy
                    case {6, 7, 8}
                        if(healthyAvg.healthyAvg(row) <= input.(row))
                            unhealthyValues(5) = true; % because temp is overall only 1 row in the text table
                            unhealthyCategories(row-1) = true;
                        end
                    % 11: Dominant Land Cover
                    % always true
                    case 11
                        unhealthyValues(8) = true;
                        unhealthyCategories(2)=true;
                 end
            end 
       
            unhealthy = unhealthyValues;
            categories = unhealthyCategories;
        end 

    end
end

