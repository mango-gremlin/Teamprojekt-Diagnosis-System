classdef SuperCommunicator
    %SUPERCOMMUNICATOR 
    % superclass for the other communicators
    
    properties
        model
        infoTablePath
    end
    
    methods(Static)
        % function obj = SuperCommunicator(model)
        %     %SUPERCOMMUNICATOR Construct an instance of this class
        %     %   Detailed explanation goes here
        % 
        %     % load model
        %     switch model
        %         case "diabetes"
        %             %load diabetes model
        %         case "heartdisease"
        %             %load heart model
        % 
        %         case "lumpyskin"
        %             %load lumpy model
        %             load(['Project' filesep 'ML' filesep 'Lumpy Skin' filesep 'lumpySkinBaggedTreeModel.mat']);
        %             obj.model = lumpySkinBaggedTree;
        %         case "general"
        %             load(['Project' filesep 'ML' filesep 'General' filesep 'generalBaggedTreeModel.mat']);
        %             obj.model = generalBaggedModel;
        %     end
        % end
        
        
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

            for i = 1:7
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
    end
end

