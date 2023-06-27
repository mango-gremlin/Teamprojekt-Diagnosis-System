classdef GeneralCommunicator
    % GeneralCommunicator
    % Loads generalBaggedTreeModel and uses it to predict a symptom
    % base on the input array of strings
    methods(Static)
        function outputArg = returnPrediction(inputArg)
            %returnPrediction 
            % input: array of string of symptoms
            % output: string of illness
            % uses the generalBaggedTreeModel.mat to predict a illness
            load(['Project' filesep 'ML' filesep 'General' filesep 'generalBaggedTreeModel.mat']);

            model = generalBaggedModel;
            header = model.RequiredVariables;
            inputTable = array2table(zeros(1, size(header, 2)));
            inputTable.Properties.VariableNames = header;

            for i = 1:numel(inputArg)
                symptom = inputArg{i};
                inputTable.(symptom)(1) = 1;
            end
            outputArg = model.predictFcn(inputTable);
        end
    end
end

