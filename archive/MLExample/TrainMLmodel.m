function TrainMLmodel()



    load('dataset.mat'); %Load our dataset with disease and symptoms

    rng(1); % Since TreeBagger and the cvpartition function needs some random values, 
    % we set the random generator initialization to 1 so 
    %when you start the script, you will get the same results as I do.

    %Split the data to training and testing data
    SplitSize = 0.20;  %Gives you a 80% training data and 20% testing data split
    cv = cvpartition(size(diseases,1),'HoldOut',SplitSize); 
    % This computes random indexes for the train and test set based on our amount of entries

    FeaturesTrain = symptoms(cv.training,:); % Select the training data from the symptoms table as our features
    TargetTrain = diseases(cv.training,:); % Select the training data from the diseases table as our target
    FeaturesTest = symptoms(cv.test,:); % Select the testing data from the symptoms table as our features
    TargetTest = diseases(cv.test,:); % Select the testing data from the diseases table as our target

    MLmodel = TreeBagger(50,FeaturesTrain,TargetTrain); %Train an ensamble of bagged decition trees

%     MLmodel = fitcnet(FeaturesTrain,TargetTrain,'LayerSizes',20); % Train neural network

    [TargetTestPredicted TargetTestScore] = predict(MLmodel,FeaturesTest); 
    % Use our trained model on the test set features
%     TargetTestScore; %This is the probability of the class based on the model
    

    CnfusionMatrix = confusionmat(TargetTest,TargetTestPredicted);
    %Compute the confusion matrix (What have we done right and what have we done wrong)

    confusionchart(CnfusionMatrix,unique(TargetTest),'RowSummary','row-normalized'); 
    %Show the confusion matrix with class labels
%     confusionchart(CnfusionMatrix,'RowSummary','row-normalized'); 
%Show the confusion matrix without class labels
    %The confusion matrix has 41x41 values.
    % You can check the sizes with:
    %    size(TargetTest) should give you 984  1
    %    size(unique(TargetTest)) should give you 41  1

    %Accuracy example
    %Is defined as (True Positive+True Negative) / (True Positive+True Negative + False Positive + False Negative)
    % In other words this means, (What was correct) / (Dataset size)

    our_accuracy=0.0;
    for i=1:size(TargetTest,1) %Go over each element in the testing set

        if strcmp(TargetTest{i,1},TargetTestPredicted{i,1}) %If they are equal we increase our "What was correct" part
            our_accuracy=our_accuracy+1;
        else
            TargetTest{i,1}
            TargetTestPredicted{i,1}
        end
        %If the array is numerical you can use TargetTest(i,1)==TargetTestPredicted(i,1)

    end

    our_accuracy=our_accuracy/double(size(TargetTest,1)); 
    % Here we divide our "What was correct" with "Dataset size", the result is the accuracy

    our_accuracy % Show the result in the console

    save('ourmodel.mat','MLmodel','unique_symptoms');  
    %Here we save our model for the GUI application as well as the unique symptoms

end

