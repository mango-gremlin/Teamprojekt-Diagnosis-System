import csv
import matplotlib.pyplot as plt

# store information about authors and project here

# this programm will only used once. Its only saved to be shown is the presentation at the end of the project
# this programm converts the csv file "dataset.csv" of the general disease file. It may uses "symptom-severity.csv"
# as help

# this code was extended on 8. august to find the distribution of number per data point.
# the extended code does not change the code for the conversion, and will start only after the end of the conversion
# and after the file is saved

# REQUIRED:
# 1. dataset.csv
# 2. Symptom-severity.csv
# both are not included in the current file

# symptom-severity contains each symptom exactly once
symptoms = []
with open("Symptom-severity.csv", newline='\n') as symptomData:
    reader = csv.reader(symptomData, delimiter=',')
    # collect symptoms
    for row in reader:
        symptoms.append(row[0])

# the header is also include. Created sorted list of symptoms
symptoms.remove("Symptom")
symptoms.sort()

# create dictionary/hashmap to reduce calculation time. Index starts at one
symptomIndex = {}
for i in range(len(symptoms)):
    symptomIndex.update({symptoms[i]: (i + 1)})
# print(symptomIndex)

# title Symptom has to be added again
templateRow = [0] * (len(symptoms) + 1)

# create object for new object
booleanData = []

# import dataset
with open("dataset.csv", newline='\n') as dataset:
    reader = csv.reader(dataset, delimiter=',')
    next(reader, None)
    for row in reader:
        # add new row, deep copy of templateRow needed
        # set the name of the data
        newRow = templateRow.copy()
        newRow[0] = row[0]
        index = 0
        while index < len(row) and len(row[index]) != 0:
            index += 1
        # set entry to true if symptom exists in column
        for symptom in row[1:index]:
            # the name contain spaces (not only leading/trailing). Dict removes this before updating
            column = symptomIndex.get(symptom.replace(" ", ""))
            newRow[column] = 1

        # a test to make sure the data is correctly
        numOfSymptoms = index - 1
        countedSymptoms = 0
        for i in range(len(newRow)):
            # e == True
            if newRow[i] == 1:
                countedSymptoms += 1
        if (countedSymptoms != numOfSymptoms):
            print(numOfSymptoms)
            print(countedSymptoms)
            print(row)
            print(row[1:index])
            print(newRow)
            raise Exception("Expected number does not match counted number of symptoms")
        # everything seems right, append row
        booleanData.append(newRow)


# write data in new csv file
# create header
header = ["Disease"]
header.extend(symptoms)

# create full data
fullData = [header]
fullData.extend(booleanData)

healthyLine = templateRow.copy()
healthyLine[0] = "healthy"

with open("generalDataConverted.csv", 'w', newline='\n') as outfile:
    writer = csv.writer(outfile, delimiter=",")
    for row in fullData:
        writer.writerow(row)
    writer.writerow(healthyLine)


###
# the code to find the distribution
NUM_SYMPTOMS = len(header)
# since the maximal number of symptoms is all
distribution = [0] * NUM_SYMPTOMS

# the i-th element contains the percentage of data point with less or equal to i symptoms
containsBelowPerc = [0] * NUM_SYMPTOMS

# this part is not pretty but it only has to run once
for row in booleanData:
    # since the first element is the name of the illness
    score = sum(row[1:])
    distribution[score] += 1
# since higher numbers of symptoms are not in the dataset
limit = NUM_SYMPTOMS
while distribution[limit - 1] == 0:
    # in case the dataset is empty or a bug occured
    if(limit == 1):
        break;
    limit -= 1

# create a little boundary if possible
UPPER_LIMIT = min(limit + 2, NUM_SYMPTOMS)

# Create a bar graph
plt.bar(range(UPPER_LIMIT), distribution[:UPPER_LIMIT])

# Adding labels and title
plt.xlabel('Number of Symptoms')
plt.ylabel('Number of data point')
plt.title('Distribution of number of symptoms per data point')
plt.xticks([i for i in range(UPPER_LIMIT)])

# Display the plot
plt.show()

# display information
distributionPerc = [dist/sum(distribution) for dist in distribution]
print("Distribution in percentage \n")
formatted_array = "["
for value in distributionPerc:
    formatted_value = "{:.2f}".format(value)
    formatted_array += formatted_value + ", "
formatted_array += "...]"
print(formatted_array)

print("Contains percentage below")
sumOfBelow = [0] * NUM_SYMPTOMS
sumOfBelow[0] = distributionPerc[0]
for i in range(1, NUM_SYMPTOMS):
    sumOfBelow[i] = sumOfBelow[i - 1] + distributionPerc[i]
formatted_array = "["
for value in sumOfBelow:
    formatted_value = "{:.2f}".format(value)
    formatted_array += formatted_value + ", "
formatted_array += "...]"
print(formatted_array)
