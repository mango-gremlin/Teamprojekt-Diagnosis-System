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

        function outputArg = returnInfo(input_joint,input_tidy)
            % RETURNINFO returns which values are
            % unhealthy and information about these values as strings.

            % read in table of health info text
            % IMPORTANT: to preserve line breaks, when reading in:
            opts = detectImportOptions(['Project' filesep 'ML' filesep 'Heart Disease' filesep 'heart_infotext.csv']);
            healthInfo = readtable(['Project' filesep 'ML' filesep 'Heart Disease' filesep 'heart_infotext.csv'], opts);

            healthInfo

            unhealthy = getUnhealthyValues(input_joint, input_tidy)

            % if input not healthy, take this health info and save in
            % output table
        end 

        function outputArg = getUnhealthyValues(input_joint, input_tidy)
            % GETUNHEALTHYVALUES checks for each input value whether is is healthy
            % and save info on what values are unhealthy & how to change
            % them in an output table and returns this table

            % read in table of healthy values
            healthyAvg = readtable(['Project' filesep 'ML' filesep 'Heart Disease' filesep 'heart_averageHealthyValues.csv']);

            healthyAvg

            % check input for joint_heart for unhealthy values

            % loop through input, compare input with respective healthy
            % value
            inputJointRows = 13;

            age=[1];
            sex=[1];
            cp=[2];
            trestbps=[1];
            chol=[1];
            fbs=[1];
            restecg=[1];
            thalach=[1];
            exang=[1];
            oldpeak=[1];
            slope=[1];
            ca=[1];
            thal=[1];

            inputjointtest = table(age, sex, cp, trestbps, chol, fbs, restecg, thalach, exang, oldpeak, slope, ca, thal);

            %test.(1)

            %healthyAvg(1, 3)

            % create a new table that saves whether values were unhealthy
            % (TRUE) or healthy (FALSE)
            % the row numbers reflect those in the healthyAvg and
            % HealthInfo Tables
            unhealthyValues = zeros(1,23);

            %ignore age here because age here & in input tidy should be the
            %same
            for row = 3:inputJointRows
                switch row 
                    % 3: chest pain: 0 means asymptomatic
                    % 6: fasting blood sugar: 0 means low
                    % 9: exercise induced angina: 0 means no angina
                    case {3, 6, 9}
                        if(inputjointtest.(row) ~= 0)
                            unhealthyValues(row) = true;
                        end
                    % 4: resting blood pressure
                    % 5: serum cholesterol
                    % 8: max heart rate
                    % higher than average = unhealthy
                    case {4, 5, 8}
                        if(healthyAvg.healthyAvg(row) <= inputjointtest.(row))
                            unhealthyValues(row) = true;
                        end 
                    % 7: resting electrocardiographic results: 1 is normal
                    % 11: slope of ST segment: 1 is flat
                    case {7, 11}
                        if(inputjointtest.(row) ~= 1)
                            unhealthyValues(row) = true;
                        end
                    % 10: st depression (oldpeak)
                    % 12: number of vessels coloured (blood flow)
                    %lower than average = unhealthy
                    case {10,12}
                        if(healthyAvg.healthyAvg(row) >= inputjointtest.(row))
                            unhealthyValues(row) = true;
                        end 
                    % 13: thalassemia trait: 2 is normal
                    case 13
                        if(inputjointtest.(row) ~= 2)
                            unhealthyValues(row) = true;
                        end
                   end
               end 

            outputArg = unhealthyValues
        end 

    end
end

%% test input:
%age = [1]
        
%input-joint-test = table(age, sex, cp, trestbps, chol, fbs, restecg, thalach, exang, oldpeak, slope, ca, thal)

%input-tidy-test = table(HighBP, HighChol, BMI, Smoker, Stroke, PhysActivity, HvyAlcoholConsump, GenHlth, MentHlth, PhysHlth, DiffWalk, Sex, Age)