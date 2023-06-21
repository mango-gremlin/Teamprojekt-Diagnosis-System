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
            load(['Project' filesep 'ML' filesep 'Heart Disease' filesep 'heartdiseaseBaggedTreeModel.mat']);
            model = heartdiseaseBaggedTreeModel;
            prediction = model.predictFcn(input);
            
            if prediction(1) == 1
                outputArg = "heart disease"
            else
                outputArg = "no heart disease"
            end

        end
    end
end

