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

        function outputArg = returnInfo(input)
            % RETURNINFO returns which values are
            % unhealthy and information about these values as strings
            % together in a big string array.

            % read in table of health info text
            % IMPORTANT: to preserve line breaks, when reading in:
            opts = detectImportOptions(['Project' filesep 'ML' filesep 'Lumpy Skin' filesep 'lumpyskin_infotext.csv']);
            healthInfo = readtable(['Project' filesep 'ML' filesep 'Lumpy Skin' filesep 'lumpyskin_infotext.csv'], opts);

            healthInfo;

            % find out which values are healthy and which are not
            unhealthy = LumpySkinCommunicator.getUnhealthyValues(input);

            % for the unhealthy values add a string containing the info
            % text

            % generate output array the size of the number of unhealthy
            % values 
            infoText = strings(sum(unhealthy, 'all'),0)+1;

            textPosition = 1;

            for i = 1:8
                if(unhealthy(i) == 1)
                    spacer = "______________________";
                    title = "=======" + upper(string(healthInfo.fullnames(i))) + "=======" + newline;
                    meaning = newline + "---" + "MEANING" + newline + string(healthInfo.meaning(i)) + newline;
                    interpretation = newline + "---" + "INTERPRETATION" + newline + string(healthInfo.interpretation(i)) + newline;
                    change = newline + "---" + "HOW TO IMPROVE" + newline + string(healthInfo.change(i)) + newline;
                    %sources = '\bf' + "Further Information" + '\rm' + newline + string(healthInfo.sources(i)) + newline;

                    currentText = newline + title + newline + meaning + interpretation + change + newline + spacer + newline;

                    infoText(textPosition) = currentText;

                    textPosition = textPosition + 1;
                end
            end

            sources = newline + newline + "---" + "FURTHER INFORMATION" + newline + "https://www.fli.de/en/news/animal-disease-situation/lumpy-skin-disease/#:~:text=of%2006.09.2016-,Lumpy%20Skin%20Disease%20(%20LSD%20)%20is%20a%20notifiable%20animal%20disease%20of,countries%20and%20ultimately%20to%20Europe" + newline + "http://www.oie.int/fileadmin/Home/eng/Health_standards/tahm/2.04.13_LSD.pdf" + newline + "Coetzer, J.A.W. (2004). Infectious Diseases of Livestock. Cape Town: Oxford University Press. pp. 1268–1276" + newline + "Yeruham, I; Nir, O; Braverman, Y; Davidson, M; Grinstein, H; Haymovitch, M; Zamir, O (22 July 1995). Spread of Lumpy Skin Disease in Israeli Dairy Herds. The Veterinary Record. 137–4 (4): 91–93. doi:10.1136/vr.137.4.91. PMID 8533249. S2CID 23409535." + newline + "Tulman, E. R.; Afonso, C. L.; Lu, Z.; Zsak, L.; Kutish, G. F.; Rock, D. L. (1 August 2001). Genome of Lumpy Skin Disease Virus. Journal of Virology. 75 (15): 7122–7130. doi:10.1128/JVI.75.15.7122-7130.2001. ISSN 0022-538X. PMC 114441. PMID 11435593"

            infoText(9) = sources;

            if(textPosition==1)
                infoText = "All the values lower the risk of lumpy skin disease." + newline + "(or you did not input anything, in which case, please stop playing around.)"
            end

            outputArg = infoText;

        end 

        function outputArg = getUnhealthyValues(input)
            % GETUNHEALTHYVALUES checks for each input value whether is is healthy
            % and save info on what values are unhealthy & how to change
            % them in an output table and returns this table

            % read in table of healthy values
            healthyAvg = readtable(['Project' filesep 'ML' filesep 'Lumpy Skin' filesep 'lumpyskin_averageHealthyValues.csv']);

            healthyAvg;

            % check input for joint_heart for unhealthy values

            % loop through input, compare input with respective healthy
            % value
            % 
            inputRows = 11;
            % 
            % x=[1];
            % y=[1];
            % cld=[60];
            % frs=[20];
            % pre=[22];
            % tmn=[1];
            % tmp=[1];
            % tmx=[1];
            % vap=[4];
            % wet=[9];
            % dominant_land_cover=[1];
            % 
            % inputtest = table(cld, dominant_land_cover, frs, pre, tmn, tmp, tmx, vap, wet, x, y);

            % first: reorder input from model because different order of
            % variables (for some reason...)
            input=input(:, [10 11 1 3:9 2]);

            %test.(1)

            %healthyAvg(1, 3)

            % create a new table that saves whether values were unhealthy
            % (TRUE) or healthy (FALSE)
            % the row numbers reflect those in the health info text table
            % later
            unhealthyValues = zeros(1,8);

            % INPUT JOINT 
            %ignore age here because age here & in input tidy should be the
            %same
            for row = 1:inputRows
                switch row 
                    % 1: Latitude
                    % 2: Longitude
                    % count as 1 in unhealthyValues, include every lat/long
                    case {1,2}
                            unhealthyValues(1) = true;
                    % 3: Cloud Cover
                    % 5: Precipitation
                    % 9: Vapour Pressure
                    % 10: Wetness
                    % higher than average = unhealthy
                    case {3, 5, 9, 10}
                        if(healthyAvg.healthyAvg(row) <= input.(row))
                            if(row >= 9)
                                unhealthyValues(row-3) = true;
                            else
                                unhealthyValues(row-1) = true;
                            end 
                        end 
                    % 4: Frost
                    % lower than average = unhealthy
                    case 4
                        if(healthyAvg.healthyAvg(row) >= input.(row))
                            unhealthyValues(row-1) = true;
                        end 
                    % 6, 7, 8: Temperature min, mean, max
                    % higher than average = unhealthy
                    case {6, 7, 8}
                        if(healthyAvg.healthyAvg(row) <= input.(row))
                            unhealthyValues(5) = true; % because temp is overall only 1 row in the text table
                        end
                    % 11: Dominant Land Cover
                    % always true
                    case 11
                        unhealthyValues(8) = true;
                 end
            end 
       
            %unhealthyValues
            outputArg = unhealthyValues;
        end 

    end
end

