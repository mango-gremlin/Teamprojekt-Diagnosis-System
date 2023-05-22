function ConvertDATASETtoMATfile()


    diseases={}; %Cell array for the diseases since we have strings here; 
                 % with [] you init a normal array with numerical values
    diseases_index1=0;  %For the target class, the diseas here, 
    % we only need a one dimensional array since every entry will have only one diseas

    symptoms=[]; %Here we will use a numerical array and assigne a 1 to the symptoms the patient has and otherwiese zero
    symptoms_index1=0;


    all_symptoms={}; %Cell array for the symptoms since we need to store 
    % the text first so we can create the symptoms table in a second step
    all_symptoms_index1=0;  % Since each symptom


    % The main problem with this data set is, that the symptoms are given
    % in an unordered way and not all symptoms have a value per entry.
    % Therefore, we have to collect all possible symptoms first and make a
    % structured array for the machine learning models.



    current_file=fopen('dataset.csv'); %open the file

    line=fgetl(current_file); %Skip first line since it contains only the headers

    while ~feof(current_file)

        line=fgetl(current_file); %get current line in the file

        current_data=strsplit(line,','); %split the read line on all ','
        % If there is a ',,', ',,,' or more ',' in succession no new index in current_data
        % will be generated, those values will be ignored from the strsplit function

        diseases_index1=diseases_index1+1; %increase index
        diseases{diseases_index1,1}=deblank(current_data{1,1}); 
        %Remove trailing whitespace and null characters (deblank). Add the string to the table

        for i=2:size(current_data,2)
            if ~isempty(deblank(current_data{1,i}))
                all_symptoms_index1=all_symptoms_index1+1; %increase index
                all_symptoms{all_symptoms_index1,1}=deblank(current_data{1,i}); 
                %Remove trailing whitespace and null characters (deblank). Add the string to the table
            end
        end


    end


    size(diseases)  %if you do not set the ; at the end MATLAB will plot the result in the console (Good for debugging)
    % you should get the size of all entries in the .csv without the first
    % line.

    size(all_symptoms)  %size of all symptoms

    unique_symptoms=unique(all_symptoms);  %removes all dublicates from the array of symptoms

    size(all_symptoms) %size of all unique symptoms

    fclose(current_file); %close the file



    symptoms=zeros(size(diseases,1),size(unique_symptoms,1)); %Now we can preallocate our array of features (symptoms)

    %The first size we need is the amount of entries or records in our
    %table (size(diseases,1)). The second size we need is the amount of
    %features. In our case this is the amount of unique symptoms (size(all_symptoms,1))



    current_file=fopen('dataset.csv'); %open the file again to reset the data pointer to the start of the file
    %alternatively, we could reset the "current_file" pointer but to keep
    %it simple and understandable, we just open the file again after we
    %have closed it.

    line=fgetl(current_file); %Skip first line since it contains only the headers

    while ~feof(current_file)

        line=fgetl(current_file); %get current line in the file

        current_data=strsplit(line,','); %split the read line on all ','
        % If there is a ',,', ',,,' or more ',' in succession no new index in current_data
        % will be generated, those values will be ignored from the strsplit function

        symptoms_index1=symptoms_index1+1; %for each line in the file (each entry) 
        %                                  we increase the table index for our symptoms

        for i=2:size(current_data,2)

            feature_index = find(strcmp(unique_symptoms,current_data{1,i})); 
            % Since we have a cell array with strings, and we want to compare 
            % the strings to get our feature index we use the strcmp (String Compare) function.
            % For numerical values you could use all_symptoms==current_data(1,i)

            symptoms(symptoms_index1,feature_index)=1; % Based on the feature index, 
            % we set the feature (Symptom) to 1 since we preallocated the array with 0.

        end


    end

    fclose(current_file); %close the file

    size(diseases) % Size of our target array 4920 entries and one label (The diseas).
    size(symptoms) % Size of our feature array 4920 entries and 132 features (The symptoms).

    save('dataset.mat','diseases','symptoms','unique_symptoms'); 
    %Here we save our tables with the diseas, our target class, and the symptoms. 
    % Additionally we save the unique features, which we will need in our GUI example.


end




