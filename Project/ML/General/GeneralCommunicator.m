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

        function precautions = returnInfo(illness)
            listOfPrecautions = readtable(['Project' filesep 'ML' filesep 'General' filesep 'symptom_precaution.csv']);
            % find index and extract precautions to an cell array
            if isequal(string(illness), 'healthy')
                precautions = ["stay healthy ;D"];
            else
                index = find(strcmp(listOfPrecautions.Disease, string(illness)));
                precautionIllness = listOfPrecautions(index,2:5);
                precautionArray = [precautionIllness.Precaution_1, precautionIllness.Precaution_2, precautionIllness.Precaution_3, precautionIllness.Precaution_4];
                % filter the array, so it does not contains empty cells
                filterCondition = @(x) ~isequal(x, '');            
                precautions = precautionArray(cellfun(filterCondition, precautionArray));
            end
        end
    end
end

