classdef DiabetesCommunicator
    %DIABETESCOMMUNICATOR Summary of this class goes here
    %   takes the input from gui
    %   loads diabetes model
    %   predicts with model
    %   returns predicted value
    
    properties
        model = load("Project/ML/Diabetes/diabetesBaggedTreeModel.mat");
    end
    
    methods(Static)
        %function obj = DiabetesCommunicator(input)
            %DIABETESCOMMUNICATOR Construct an instance of this class
            %   Detailed explanation goes here
         %   obj.input = input;
        %end
        
        function outputArg = returnPrediction(input)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            prediction = obj.model.predictFcn(input);

            outputArg = prediction(1);
        end
    end
end

