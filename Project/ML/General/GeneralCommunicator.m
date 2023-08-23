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
            
            % loads model and formats input for model
            model = generalBaggedModel;
            header = model.RequiredVariables;
            inputTable = array2table(zeros(1, size(header, 2)));
            inputTable.Properties.VariableNames = header;
            
            % the resulting array contains one as zeros representing
            % whether an symptom was in the input
            for i = 1:numel(inputArg)
                symptom = inputArg{i};
                inputTable.(symptom)(1) = 1;
            end
            
            % gets the result and info of disease
            prediction = model.predictFcn(inputTable);
            descriptionDisease = GeneralCommunicator.returnDescription(prediction);

            outputArg = [prediction, descriptionDisease];
        end
        
        % Returns the precautions of a given disease, requires access to
        % 'symptom_precaution.csv'. Returns a maximum of 4 precaution
        % Input : Illness, categorical or string of name of illness
        % Output: Array of strings, from 1 to 4 precautions
        function precautions = returnInfo(illness)
            % load file, change if files gets moved
            listOfPrecautions = readtable(['Project' filesep 'ML' filesep 'General' filesep 'datasets' filesep 'symptom_precaution.csv']);

            % find index and extract precautions to an cell array
            if isequal(string(illness), 'healthy')
                % healthy was added and is not the in file
                precautions = ["stay healthy ;D"];
            else
                % find index of illness and save the precautions in an
                % array of strings
                index = find(strcmp(listOfPrecautions.Disease, string(illness)));
                precautionIllness = listOfPrecautions(index,2:5);
                precautionArray = [precautionIllness.Precaution_1, precautionIllness.Precaution_2, precautionIllness.Precaution_3, precautionIllness.Precaution_4];

                % filter the array, so it does not contains empty cells
                filterCondition = @(x) ~isequal(x, '');

                precautions = precautionArray(cellfun(filterCondition, precautionArray));
            end
        end
        
        % Returns the descriptions of an given disease, requires access to
        % 'symptom_description.csv'. 
        % Input : Illness,  categorical or string of name of illness
        % Output: Description of illness, string 
        function description = returnDescription(illness)
            % load file, change if files gets moved
            listOfDescriptions = readtable(['Project' filesep 'ML' filesep 'General' filesep 'datasets' filesep 'symptom_Description.csv']);
            if isequal(string(illness), 'healthy')
                % healthy was added and is not the in file
                description = 'You seem to be healthy.';
            else
                % find index and return the description as string
                index = find(strcmp(listOfDescriptions.Disease, string(illness)));
                decriptionsIllness = listOfDescriptions(index, 2);
                description = decriptionsIllness.Description;
            end
        end
    end
end

