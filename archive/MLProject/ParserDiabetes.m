function ParserDiabetes()
    
    % cell array with one row, indicating the outcome 
    % (diabetes or not)
    diabetesBool = {};

    diabetesBool_index1 = 0;

    symptoms = []; 
    %numerical array that contains a 0 for no diabetes or a 1 for
    %yes diabetes, for the collection of symptoms
    %the index here represents the row number in the original dataset

    all_data = {};
    all_data_index1 = 0;

    % The problem with this dataset is that it doesnt really work with
    % the way the ml model can read the data, so 
    % we need to transform the dataset as follows:

    % create a long matrix with 1 row that indicates the outcome
    % the cols correspond to the rows in the original dataset such that
    % each cell in this matrix contains the outcome of the respective
    % row in the original dataset

    current_file = fopen("Datasets\Diabetes\diabetes-dataset.csv");

    line = fgetl(current_file); %skips first line

    while ~feof(current_file)

        line = fgetl(current_file); 

        current_data = strsplit(line, ',');
        % split at comma since csv file

        diabetesBool_index1=diabetesBool+1
        diabetesBool{diabetesBool_index1} = deblank(current_data{1,1});
        % remove trailing whitespace and null characters (deblank)
        % add the string to the table DiabetesBool

        for i=2:size(current_data, 2)
            if ~isempty(deblank(current_data{1, i}))
                all_data_index1=all_data_index1+1;
                all_data{all_data_index1,1}=deblank(current_data{1,i});
            end
        end

    end

    size(diabetesBool)

    size(all_data)

    fclose(current_file);

    % now we need the amount of data (rows) from the original dataset
    symptoms=zeros(size(diabetesBool, 1), size(all_data, 1));


    current_file=fopen("Datasets\Diabetes\diabetes-dataset.csv");
    % open file again to reset pointer to start of file

    















