classdef SuperCommunicator
    %SUPERCOMMUNICATOR 
    % superclass for the other communicators
    
       
    methods(Static)
              
        
        function outputArg = returnInfo(infoTablePath, unhealthy)
            % RETURNINFO returns which values are
            % unhealthy and information about these values as strings
            % together in a big string array.

            % read in table of health info text
            % IMPORTANT: to preserve line breaks, when reading in:
            opts = detectImportOptions(infoTablePath);
            healthInfo = readtable(infoTablePath, opts);

            %healthInfo;

            % find out which values are healthy and which are not
            %unhealthy = DiabetesCommunicator.getUnhealthyValues(input);

            % for the unhealthy values add a string containing the info
            % text

            % generate output array the size of the number of unhealthy
            % values 
            infoText = strings(sum(unhealthy, 'all'),0);

            textPosition = 1;

            for i = 1:length(unhealthy)
                if(unhealthy(i) == 1)
                    spacer = "______________________";
                    title = "=======" + upper(string(healthInfo.fullnames(i))) + "=======" + newline;
                    meaning = newline + "---" + "MEANING" + newline + string(healthInfo.meaning(i)) + newline;
                    interpretation = newline + "---" + "INTERPRETATION" + newline + string(healthInfo.interpretation(i)) + newline;
                    change = newline + "---" + "HOW TO IMPROVE" + newline + string(healthInfo.change(i)) + newline;
                    sources = newline + "---" + "FURTHER INFORMATION" + newline + string(healthInfo.sources(i)) + newline;

                    currentText = newline + title + newline + meaning + interpretation + change + sources + newline + spacer + newline;

                    infoText(textPosition) = currentText;

                    textPosition = textPosition + 1;
                end
            end

            if(textPosition==1)
                infoText = "All your values are healthy. See a doctor if any of the values change." + newline + "(or you did not input anything, in which case, please stop playing around.)"
            end

            outputArg = infoText;

        end

        function outputArg = inputToStringArray(input)

            output = strings(width(input), 0);

            values = input.Properties.VariableNames

            for i = 1:width(input)
                output(i) = values(i) + ": " + input.(i) + newline; 
            end

            outputArg = output
        end

        function outputArg = printUnhealthyCategories(input, unhealthy)
            output = strings(sum(unhealthy, 'all'),0);

            values = input.Properties.VariableNames;

            textPosition = 1;

            for i = 1:length(unhealthy)
                if(unhealthy(i)==1)
                    output(textPosition) = values(i);
                    textPosition = textPosition +1;
                end
            end

            outputArg = output;

        end
        
        % saveDiagnosis: saves the diagnosis, input values and additional
        % information in a .txt file under saved diagnosis. 
        % Name: Diagnosis + timestemp
        % Parameter
        % - diagnosis, string: String describing the diagnosis
        % - information, array of string: Precautions or additional
        % information
        % - input, array of string: Input of symptoms or values with name
        % Test command: 
        % SuperCommunicator.saveDiagnosis('ill', {'Name:Value', 'Symptom1', 'asdas'}, {'info1', 'info2', 'info3'})
        function saveDiagnosis(diagnosis, information, input)
            % create name
            fileName = 'Diagnosis';
            time = datetime('now');
            filePath = strcat(fileName, string(time));
            % create file and catch error
            fileID = fopen(filePath, 'w');

            if fileID == -1
                error('something went wrong while creating the file');
            else
                % the diagnosis
                diagnosisHeader = 'DIAGNOSIS';
                fprintf(fileID, '%s\n%s\n\n', diagnosisHeader, diagnosis);

                % the input
                inputHeader = 'INPUT CONFIGURATION';
                fprintf(fileID, '%s\n', inputHeader, string(input));
                fprintf(fileID, '\n');

                % additional information
                informationHeader = 'ADDITIONAL INFORMATION/PRECAUTIONS';
                fprintf(fileID, '%s\n', informationHeader, string(information));

                fclose(fileID);

            end
            
        end

    end
end
