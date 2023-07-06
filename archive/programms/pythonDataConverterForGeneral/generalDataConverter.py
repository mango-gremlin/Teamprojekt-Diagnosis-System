import csv

# store information about authors and project here

# this programm will only used once. Its only saved to be shown is the presentation at the end of the project
# this programm converts the csv file "dataset.csv" of the general disease file. It may uses "symptom-severity.csv"
# as help

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
print(healthyLine)

with open("generalDataConverted.csv", 'w', newline='\n') as outfile:
    writer = csv.writer(outfile, delimiter=",")
    for row in fullData:
        writer.writerow(row)
    writer.writerow(healthyLine)
