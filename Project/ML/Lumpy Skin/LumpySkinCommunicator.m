classdef LumpySkinCommunicator
    %   LumpySkinCommunicator
    %   takes the input from gui
    %   loads lumpy skin model
    %   predicts with model
    %   returns predicted value
    
    methods(Static)
        
        function outputArg = returnPrediction(input)
            % returns value of lumpy skin model
            load(['Project' filesep 'ML' filesep 'Lumpy Skin' filesep 'lumpySkinBaggedTreeModel.mat']);
            model = lumpySkinBaggedTree;
            prediction = model.predictFcn(input);
                
            if prediction(1) == 1
                outputArg = "lumpy skin";
            else
                outputArg = "no lumpy skin";
            end
        end
    end
end

