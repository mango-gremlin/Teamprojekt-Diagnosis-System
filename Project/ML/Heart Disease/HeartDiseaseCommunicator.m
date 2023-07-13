classdef HeartDiseaseCommunicator
    %HEARTDISEASECOMMUNICATOR Summary of this class goes here
    %   takes the input from gui
    %   loads heart disease model(s)
    %   predicts with model
    %   returns predicted value

    %   also returns information on how healthy the input values are

    
    methods(Static)
        
        function outputArg = returnPrediction(input_joint, input_tidy)
            %RETURNPREDICTION loads the appropriate model(s) and runs a
            %prediction, outputs the prediction as a string
            
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
            % RETURNINFO checks for each input value whether is is healthy
            % and save info on what values are unhealthy & how to change
            % them in an output table

            % read in table of healthy values
            healthyAvg = readtable(['Project' filesep 'ML' filesep 'Heart Disease' filesep 'heart_averageHealthyValues.csv']);

            % read in table of health info text
            % IMPORTANT: to preserve line breaks, when reading in:
            opts = detectImportOptions(['Project' filesep 'ML' filesep 'Heart Disease' filesep 'heart_infotext.csv']);
            healthInfo = readtable(['Project' filesep 'ML' filesep 'Heart Disease' filesep 'heart_infotext.csv'], opts);

            healthInfo
            healthyAvg

            % check input for joint_heart for unhealthy values

            % loop through input, compare input with respective healthy
            % value
            rows = height(healthyAvg);

            cp=[2];
            test = table(cp);

            test.(1)

            healthyAvg(1, 1)

            for row = 1:rows
                if(healthyAvg(row, 1) == test.(1))
                    healthyAvg(row,3)
                end
            end 

            % if input not healthy, take this health info and save in
            % output table

        end 

    end
end

