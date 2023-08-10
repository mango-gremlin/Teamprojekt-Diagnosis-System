% This script generates a table containing health information text for the
% diabetes table values.

% colnames:       names of values (as in dataset)
% fullnames:      full names of values
% meaning:        What does this value mean?
% interpretation: How to Interpret this value?
% change:         How to change/decrease risk?
% sources:        sources

% array with shortened names
colnames = ["Pregnancies", 
    "Glucose", 
    "BloodPressure", 
    "SkinThickness", 
    "Insulin", 
    "BMI", 
    "Age", 
    "Outcome"]

% array with full names
fullnames = ["Pregnancies", 
    "Glucose", 
    "Blood Pressure", 
    "Skin Thickness", 
    "Insulin", 
    "BMI",
    "Age", 
    "Outcome"]

% what does this value mean?
meaning = ["Number of times pregnant (applies to females only).", 
    "Plasma glucose concentration in mg/dL after 2 hours in an oral glucose tolerance test", 
    "Diastolic blood pressure (mm Hg)", 
    "Triceps skin fold thickness (mm)", 
    "2-Hour serum insulin (mu U/ml). Insulin is an anabolic hormone that helps regulate blood sugar levels.", 
    "Body Mass Index (BMI) is a measure of body fat based on height and weight.", 
    "Age of the person in years.", 
    "Outcome"]

% how to interpret this value?
interpretation = ["During pregnancy there is a 2-10% chance for a woman to develop gestational diabetes. It is caused by the body not being able to produce enough insulin during pregnancy, since body changes during pregnancy can lead to insulin resistance (which leads to higher insulin demand). Women are even more likely to get gestational diabetes if they already had an insulin resistance before the pregnancy.", 
    "Fasting glucose levels above 126 mg/dL: Diabetes. Elevated fasting glucose levels indicate diabetes, which requires careful management to prevent complications." + newline + "Fasting glucose levels between 100 and 125 mg/dL: Prediabetes. Prediabetes is a warning sign, and lifestyle changes can prevent or delay the onset of type 2 diabetes." + newline + "Fasting glucose levels below 100 mg/dL: Normal.", 
    "High blood pressure (Hypertension) - systolic pressure ≥ 130 mmHg and/or diastolic pressure ≥ 80 mmHg: Hypertension is a risk factor for diabetes-related complications, such as heart disease and kidney problems." + newline + "Normal blood pressure - systolic pressure < 120 mmHg and diastolic pressure < 80 mmHg: Maintaining normal blood pressure is essential for managing diabetes and reducing complications.", 
    "Skinfold thickness can be an indicator of body fat content. Higher skinfold measurements may be associated with increased diabetes risk in overweight or obese individuals.", 
    "High insulin concentrations can cause hyperinsulinemia, which correlates with diabetes.", 
    "BMI below 18.5: Underweight - Underweight individuals may have a higher risk of nutritional deficiencies and other health issues." + newline + "BMI between 18.5 and 24.9: Healthy Weight" + newline + "BMI between 25 and 29.9: Overweight - Overweight individuals have an increased risk of type 2 diabetes." + newline + "BMI of 30 and above: Obesity - Obesity is a significant risk factor for type 2 diabetes.", 
    "With increasing age, the chances of diabetes also increases.", 
    "Outcome"]

% how to change this?
change = ["Before getting pregnant, one way to prevent gestational diabetes is losing weight if one is overweight, and regular physical activity. (do not try to lose weight while pregnant)" + newline + "To help prevent during pregnancy: Checking blood sugar levels regularly, eating healthy foods (not too much, not too little), regular physical activity, and going to the doctor often to monitor the baby.", 
    "Adopt a balanced diet with a focus on whole foods, fiber-rich carbohydrates, and lean proteins. Engage in regular physical activity to improve insulin sensitivity and manage blood sugar levels. Monitor blood glucose levels regularly, and follow the guidance of healthcare professionals for diabetes management.", 
    "Follow a heart-healthy diet, rich in fruits, vegetables, whole grains, and low-fat dairy products. Limit sodium intake and avoid high-sodium processed foods to help control blood pressure. Engage in regular physical activity, which can help lower blood pressure and improve overall cardiovascular health.", 
    "Adopt a balanced diet and engage in regular physical activity to achieve and maintain a healthy weight. Seek support from healthcare professionals or registered dietitians to develop a personalized weight management plan. Regularly monitor body measurements, including skinfold thickness, to track changes in body fat levels.", 
    "Diet, exercise and weight loss. Regular blood sugar monitoring and working closely with healthcare professionals are vital for effective insulin management.", 
    "Aim for a healthy weight by adopting a balanced diet and controlling portion sizes. Engage in regular physical activity to help manage weight and improve insulin sensitivity." + newline + "Seek support from healthcare professionals or a registered dietitian to create a personalized weight management plan.", 
    "Aiming for a healthy lifestyle with regular physical activity and healthy meals can decrease the risk for type 2 diabetes in old age.", 
    "Outcome"]

% sources/further reading
sources = ["https://www.cdc.gov/diabetes/basics/gestational.html", 
    "https://www.cdc.gov/diabetes/basics/getting-tested.html#:~:text=Fasting%20Blood%20Sugar%20Test,higher%20indicates%20you%20have%20diabetes.", 
    "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4317611/#:~:text=It%20has%20been%20observed%20that,hypertensives%20develop%20diabetes%5B12%5D.", 
    "SkinThickness", 
    "https://my.clevelandclinic.org/health/diseases/24178-hyperinsulinemia", 
    "https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0229716", 
    "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9843502/#:~:text=Advanced%20age%20is%20a%20major%20risk%20factor%20for%20diabetes%20and%20prediabetes.&text=Therefore%2C%20the%20elderly%20has%20a,%2C%20retinal%2C%20and%20renal%20systems.", 
    "Outcome"]

% full table
infoTexts = table(colnames, fullnames, meaning, interpretation, change, sources)

% save table
writetable(infoTexts, "diabetes_infotext.csv", 'QuoteStrings', true);