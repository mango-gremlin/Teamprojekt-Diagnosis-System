classdef HeartDiseaseCommunicator
    %HEARTDISEASECOMMUNICATOR Summary of this class goes here
    %   takes the input from gui
    %   loads heart disease model(s)
    %   predicts with model
    %   returns predicted value

    
    methods(Static)
        
        function outputArg = returnPrediction(input)
            %RETURNPREDICTION loads the appropriate model(s) and runs a
            %prediction, outputs the prediction as a string
            
            % NOTE: model does not exist yet, change this later
            load(['Project' filesep 'ML' filesep 'Heart Disease' filesep 'jointHeartBaggedTreeModel.mat']);
            model_jointHeart = jointHeartBaggedTreeModel;
            prediction_jointHeart = model_jointHeart.predictFcn(input);

            load(['Project' filesep 'ML' filesep 'Heart Disease' filesep 'tidyHeartBaggedTreeModel.mat']);
            model_tidyHeart = tidyHeartBaggedTreeModel;
            prediction_tidyHeart = model_tidyHeart.predictFcn(input);

            %compare and get the mean 
            
            if prediction_jointHeart(1) == prediction_tidyHeart(1)
                if prediction_jointHeart(1) == 1
                    outputArg = "heart disease"
                else
                    outputArg = "no heart disease"
                end
            else
                outputArg = "result inconclusive"
            end

        end
    end
end

