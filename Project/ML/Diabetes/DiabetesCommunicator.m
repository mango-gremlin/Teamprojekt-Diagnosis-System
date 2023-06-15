classdef DiabetesCommunicator
    %DIABETESCOMMUNICATOR Summary of this class goes here
    %   takes the input from gui
    %   loads diabetes model
    %   predicts with model
    %   returns predicted value

    
    methods(Static)
        %function obj = DiabetesCommunicator(input)
            %DIABETESCOMMUNICATOR Construct an instance of this class
            %   Detailed explanation goes here
         %   obj.input = input;
        %end
        
        function outputArg = returnPrediction(input)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            load(['Project' filesep 'ML' filesep 'Diabetes' filesep 'diabetesBaggedTreeModel.mat']);
            model = diabetesBaggedTreeModel;
            prediction = model.predictFcn(input);
            
            if prediction(1) == 1
                outputArg = "diabetes"
            else
                outputArg = "no diabetes"
            end

        end
    end
end

