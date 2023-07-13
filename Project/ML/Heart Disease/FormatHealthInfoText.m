% This script generates a table containing health information text for the
% heart disease table values.

% colnames:       names of values (as in dataset)
% fullnames:      full names of values
% meaning:        What does this value mean?
% interpretation: How to Interpret this value?
% change:         How to change/decrease risk?
% sources:        sources

% array with shortened names
colnames = ["age",
    "sex",
    "cp", 
    "trestbps", 
    "chol", 
    "fbs", 
    "restecg", 
    "thalach", 
    "exang", 
    "oldpeak", 
    "slope", 
    "ca", 
    "thal",
    "BMI",
    "Smoker",
    "Stroke", 
    "Diabetes",
    "PhysActivity",
    "HvyAlcoholConsump",
    "GenHlth",
    "MentHlth",
    "PhysHlth",
    "DiffWalk",
    "target"]

% array with full names
fullnames = ["age of person in years",
    "sex of person (male/female)",
    "chest pain type", 
    "resting blood pressure (mm/Hg)",
    "serum cholesterol (mg/dl)",
    "fasting blood sugar > 120 mg/dl",
    "resting electrocardiographic results",
    "max heart rate achieved",
    "exercise induced angina",
    "ST depression induced by exercise relative to rest",
    "slope of the peak exercise ST segment",
    "number of major vessels colored by fluoroscopy",
    "thalassemia trait",
    "Body Mass Index",
    "smoked at least 100 cigarettes",
    "ever had a stroke",
    "diabetes diagnosis",
    "physical activity/exercise in the past 30 days",
    "heavy alcohol consumption",
    "general health",
    "mental health",
    "physical health",
    "difficulty walking or climbing stairs",
    "stage of heart disease"]

% What does this value mean?
meaning = ["age of person in years",
    "sex of person (male/female)",
    "Angina is pain that comes from reduced blood flow to the heart, can be a sign of heart disease. Can be in different places, not only in chest. Can present in the lead-up to a heart attack.", 
    "Pressure of the blood pumping in your veins." + newline + "Top Number: Systolic pressure = pressure in arteries while in a Systole phase (heart beat)." + newline + "Bottom Number: Diastolic pressure = pressure in arteries in a Diastole phase (between heart beats)",
    "Cholesterol is a sterol. It is a component of cell membranes (30% of all membranes = cholesterol), and many other things. It is synthetised by the body and taken in by food. Serum Cholesterol is the level of cholesterol in the blood serum (the part of blood without the blood cells in it)." + newline + "There are two different types of cholesterol:" + newline + "HDL (high-density Lipoprotein): good. It absorbs cholesterol in blood, this is then carried to liver, where it ends up getting flushed from the body. It can lower the risk for heart disease." + newline + "LDL (low-density Lipoprotein): bad. It is not transported away and builds up plaque on walls of blood vessels, making them narrower.",
    "The blood sugar or glucose in the blood while fasting." + newline + "Diabetes leads to more glucose in the blood and is also associated with heart disease & increases risk for heart disease.",
    "The electrocardiographic results when resting. An electrocardiograph measures the electrical activity in the heart and can display how regular heart beats are, or if there are any anomalies in the electrical signals it produces.",
    "The maximum heart rate that can be achieved during intensive physical activity.",
    "If a person has Angina (see above), it is usually induced by exercise/exertion because then the heart needs to pump more blood / body needs more oxygen.",
    "The ST refers to the ST segment on an ECG plot. When exercising, the ST segment of a ECG can change relative to the ST segment during rest, which can be an indicator for heart disease.",
    "slope of the peak exercise ST segment (see above)",
    "A catheter is inserted into an artery of the heart, then a fluorescent dye is inserted through the catheter, which is used to colour major vessels. This can then be seen with an X-Ray." + newline + "The number of vessels coloured by the dye can give information on the quality of blood flow.",
    "Thalassemia is an inherited disease that makes body not produce enough hemoglobin, which leads to less oxygen in red blood cells",
    "Body Mass Index",
    "smoked at least 100 cigarettes",
    "ever had a stroke",
    "diabetes diagnosis",
    "physical activity/exercise in the past 30 days",
    "heavy alcohol consumption",
    "general health",
    "mental health",
    "physical health",
    "difficulty walking or climbing stairs",
    "Stage of heart disease information."]

% How to interpret this value?
interpretation = ["The older. the higher the risk for heart disease. If you lead a healthier lifestyle - eat healthier, do exercise, avoid excessive drug use - , you can lower the risk of heart disease at a higher age.",
    "Men have a greater risk to suffer from heart attacks than women, and a greater risk of having a heart attack at a younger age than women do. Women have a higher risk for heart attack at a later age than men.",
    "Atypical Angina - chest discomfort, more like an indigestion feeling (women have this)" + newline + "non-anginal - chest pain that is non-anginal, and that may not be connected to heart disease or heart attack" + newline + "typical angina = reduced blood flow to the heart, tightness/heaviness in chest (the type of chest pain men have)" + newline + "In the lead-up to a heart attack, men usually have typical angina (chest pain) - women have atypical angina where there is no strong chest pain per se but discomfort, fatigue, shortness of breath. Angina is most common in people 60 years of age or older.", 
    "High Blood Pressure (Hypertension): blood pressure higher than 120/80. It can lead to heart disease or damage to the heart, or angina." + newline + "Low Blood Pressure: blood pressure lower than 120/80. Generally no correlation with heart disease.",
    "High serum cholesterol is generally associated with heart disease mortality." + newline + "Healthy levels of blood serum cholesterol:" + newline + "total cholesterol: <= 5 mmol/L" + newline + "total to HDL ratio: <= 6" + newline + "HDL: >= 1 mmol/L (men) and >= 1.2 mmol/L (women)" + newline + "LDL: <= 4 mmol/L",
    "Fasting glucose levels above 120 mg/dl increases risk for heart disease. Lower fasting glucose levels do not increase risk, however: too low levels (< 70 mg/dl) can increase risk for stroke." + newline + "This is because abnormal glucose metabolism can lead to plaques building up in the blood vessels, which make them narrower. It can also lead to impaired endothelial function (the membrane that lines heart & blood vessels, the cells are responsibl for controlling vascular relaxation & contraction, blood clotting etc). And it can also lead to thrombosis.",
    "LV Hypertrophy (showing probable or definite left ventricular hypertrophy by Estes  criteria): thickening of walls of lower left heart chamber (left ventricle - the main chamber that pumps blood into aorta), which leads to increase in blood pressure, which makes it harder for the heart to pump blood. Caused by high blood pressure, intense physical activity. Can lead to heart attack or heart failure, and arrhythmia." + newline + "STT Abnormality (having ST-T wave abnormality = T wave inversions and/or ST elevation or depression of > 0.05 mV): This is a little more frequent in women than in men. There may be a risk for heart disease if you have stt abnormalities with no apparent heart disease, and it could be used as an early marker. If this is the case for you, maybe get it checked out.",
    "The typical maximim heart rate depends on your age. To calculate it, subtract your age from 220." + newline + "For moderate-insentity physical activity, the healthy heart rate should be between 64% and 76% of your max heart rate." + newline + "A high max heart rate can indicate high risk for heart disease & cardiovascular mortality. A low max heart rate can also be an indicator of some underlying condition.",
    "(see angina)",
    "An abnormal ST depression is characterised by an upsloping, horizontal or downsloping depression. The duration is also important. For more info see slope.",
    "Downsloping: if this happens at a lower heart rate, it can indicate a worse prognosis and a higher likelihood of heart disease." + newline + "Upsloping is usually seen as an equivocal result to downsloping.",
    "The more major blood vessels coloured by fluoroscopy, the better the blood flow, the lower the risk for heart disease. If the number of coloured vessels is low, your blood flow may be impaired, which can increase risk for heart disease and heart attacks.",
    "Fixed Defect (ischemia) - no blood flow in part of the heart." + newline + "Reversible defect - a blood flow is observed but it is not normal." + newline + "Abnormal or reduced blood flow in parts of the heart or the entire heart can increase risk of heart disease and heart attacks.",
    "Body Mass Index",
    "smoked at least 100 cigarettes",
    "ever had a stroke",
    "diabetes diagnosis",
    "physical activity/exercise in the past 30 days",
    "heavy alcohol consumption",
    "general health",
    "mental health",
    "physical health",
    "difficulty walking or climbing stairs",
    "stage of heart disease"]

% how to change the values
change = ["",
    "",
    "Less tobacco/alcohol, lower blood pressure, lower cholesterol, more exercise, less stress and warmer temperatures.", 
    "Resting blood pressure can be decreased by exercising more and living a more healthy lifestyle, for instance eating healthy and losing weight.",
    "If the high cholesterol is caused by lifestyle: it can be caused by eating fatty foods, not enough exercise, smoking or alcohol consumption. Limiting/improving these things can lower serum cholesterol levels." + newline + "If it is caused by an inherited condition: ask your doctor for a prescription of medicine to lower your cholesterol.",
    "As this is often caused by diabetes, keeping the diabetes under control will lower blood glucose levels.",
    "LV Hypertrophy can be managed by medication if it is caused by high blood pressure, or by surgery, depending on the cause." + newline + "You can prevent it altogether by eating healthy, exercising, avoiding stress and avoiding smoking.",
    "Max heart rate can be changed by exercising to come closer to healthy levels.",
    "see angina",
    "Can be improved by exercise, or heart disease medication.",
    "Excercise and heart disease medication.",
    "",
    "",
    "Body Mass Index",
    "smoked at least 100 cigarettes",
    "ever had a stroke",
    "diabetes diagnosis",
    "physical activity/exercise in the past 30 days",
    "heavy alcohol consumption",
    "general health",
    "mental health",
    "physical health",
    "difficulty walking or climbing stairs",
    "stage of heart disease"]

% sources and further reading
sources = ["https://www.who.int/news-room/fact-sheets/detail/cardiovascular-diseases-(cvds)",
    "https://memorialhermann.org/services/specialties/heart-and-vascular/healthy-living/education/heart-disease-and-age",
    "https://www.harringtonhospital.org/typical-and-atypical-angina-what-to-look-for/" + newline + "https://www.bhf.org.uk/informationsupport/conditions/angina" + newline + "https://www.mayoclinic.org/diseases-conditions/angina/symptoms-causes/syc-20369373", 
    "https://utswmed.org/medblog/high-blood-pressure-heart-disease/",
    "https://www.sevencountriesstudy.com/serum-cholesterol-and-coronary-heart-disease/" + newline + "https://www.nhs.uk/conditions/high-cholesterol/" + newline + "https://www.cdc.gov/cholesterol/ldl_hdl.htm" + "https://www.nhs.uk/conditions/high-cholesterol/cholesterol-levels/" + newline + "https://en.wikipedia.org/wiki/Cholesterol",
    "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3687304/" + newline + "https://www.cedars-sinai.org/programs/heart/clinical/womens-heart/conditions/endothelial-function-testing.html",
    "https://www.mayoclinic.org/diseases-conditions/left-ventricular-hypertrophy/symptoms-causes/syc-20374314" + newline + "https://www.mayoclinic.org/diseases-conditions/left-ventricular-hypertrophy/diagnosis-treatment/drc-20374319" + newline + "https://my.clevelandclinic.org/health/diseases/21883-left-ventricular-hypertrophy" + newline + "https://www.sciencedirect.com/science/article/pii/S1880427611800451",
    "https://www.cdc.gov/physicalactivity/basics/measuring/heartrate.htm" + newline + "https://pubmed.ncbi.nlm.nih.gov/8574463/",
    "https://www.mayoclinic.org/diseases-conditions/angina/symptoms-causes/syc-20369373",
    "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4958709/",
    "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4958709/",
    "https://www.cdc.gov/nceh/radiation/fluoroscopy.html",
    "https://en.wikipedia.org/wiki/Thalassemia",
    "Body Mass Index",
    "smoked at least 100 cigarettes",
    "ever had a stroke",
    "diabetes diagnosis",
    "physical activity/exercise in the past 30 days",
    "heavy alcohol consumption",
    "general health",
    "mental health",
    "physical health",
    "difficulty walking or climbing stairs",
    "stage of heart disease"]

% full table
infoTexts = table(colnames, fullnames, meaning, interpretation, change, sources)

% save table
writetable(infoTexts, ['ML' filesep 'Heart Disease' filesep 'heart_infotext.csv'], 'QuoteStrings', true);