
All sources:
https://www.kaggle.com/datasets/alexteboul/heart-disease-health-indicators-dataset
https://www.kaggle.com/code/alexteboul/heart-disease-health-indicators-dataset-notebook/notebook
https://www.kaggle.com/datasets/cdc/behavioral-risk-factor-surveillance-system
https://www.cdc.gov/brfss/annual_data/2015/pdf/codebook15_llcp.pdf


- HeartDiseaseorAttack
	0. no heart disease or heart attack
	1. heart disease or heart attack
- BMI - positive Integer _BMI5
- Smoker SMOKE100
	0. having smoked less than 100 cigarettes in your life
	1. having smoked100 or more cigarettes in your life
- Stroke CVDSTRK3
	0. didn't have stroke
	1. did have stroke
- Diabetes DIABETE3
	0. no
	1. yes, but only during pregnancy
	2. yes
- PhysActivity _TOTINDA
	0. didn't exercise during past 30 days
	1. did exercise during past 30 days
- HvyAlcoholConsump _RFDRHV5
	0. drinking between 0 and 14(m)/7(f) drinks per week
	1. drinking more than 14(m)/7(f) drinks per week
- GenHlth GENHLTH
	1. Excellent
	2. Very good
	3. Good
	4. Fair
	5. Poor
- MentHlth - number of days during past 30 days with bad mental health MENTHLTH
- PhysHlth - number of days during past 30 days with bad physical health PHYSHLTH
- DiffWalk DIFFWALK
	0. no serious difficulty walking or climbing stairs
	1. serious difficulty walking or climbing stairs


### Heart Disease or Attack 
https://www.cdc.gov/heartdisease/about.htm

##### Explanation
Does the patient have a heart disease or did they have a heart attack?

##### Interpretation
"Heart disease" refers to several types of heart conditions:
- Coronary Heart Disease (CHD): 
	- most common
	- blockages in coronary arteries (supply blood to the heart)

Symptoms of heart disease are: 
- heart attack - chest pain/discomfort, upper back / neck pain, indigestion, heartburn, nausea, fatigue, dizziness, etc.
- arrhythmia - fluttering feelings in the chest (palpitations)

### BMI - Body Mass Index
https://www.health.harvard.edu/blog/how-useful-is-the-body-mass-index-bmi-201603309339
https://www.nhs.uk/live-well/healthy-weight/bmi-calculator/

##### Explanation
dataset range: 12-98
BMI is calculated by dividing weight in kg by height squared in m: weight/ (height^2)

##### Interpretation
healthy: 18.5 - 25
overweight: 25 - 30
obese: >30
underweight: <18.5

In general a higher BMI is linked to a higher risk of developing a range of conditions like diabetes, arthritis, liver disease, cancer, high blood pressure, high cholesterol, sleep apnea.

Current BMI definitions of overweight or obesity were based largely on white populations. Yet body composition, including percent body fat or amount of muscle mass, can vary by race and ethnic group.

##### How to change
- BMI can be changed by loosing/gaining weight
- It is important to keep in mind, that the BMI doesn't differentiate between the weight of fat or the weight of muscles. 
- BMI may be particularly unreliable during pregnancy, for athletes, and the elderly.

### Smoker
https://www.cdc.gov/tobacco/data_statistics/fact_sheets/health_effects/effects_cig_smoking/index.htm

##### Explanation
"Have you smoked at least 100 cigarettes in your entire life? (Note: 5 packs = 100 cigarettes)"

##### Interpretation
Smokers are more likely than non-smokers to develop heart disease, stroke and lung cancer.
Smokers are at greater risk for diseases that affect the heart and blood vessels (cardiovascular disease).

##### How to change
- Reduce or quit smoking.
- Quitting smoking is one of the most important actions people can take to improve their health. This is true regardless of their age or how long they have been smoking.

### Stroke
https://www.nhs.uk/conditions/stroke/
https://www.ahajournals.org/doi/full/10.1161/STROKEAHA.119.028066

##### Explanation
"(Ever told) you had a stroke."
A stroke is a serious life-threatening medical condition that happens when the blood supply to part of the brain is cut off.

##### Interpretation
If the supply of blood to the brain is restricted or stopped, brain cells begin to die. This can lead to brain injury, disability and possibly death. People who survive a stroke are often left with long-term problems caused by injury to their brain.

Women and men have a much higher risk of dangerous heart problems soon after their first stroke compared to people without stroke, even if they don't have obvious underlying heart disease, a study has found.

##### How to change
- You can significantly reduce your risk of having a stroke if you: eat well, take regular exercise, don't drink alcohol, don't smoke.
- If you've had a stroke in the past, these measures are particularly important because your risk of having another stroke is greatly increased.


### Diabetes
https://www.cdc.gov/chronicdisease/resources/publications/factsheets/heart-disease-stroke.htm
https://www.niddk.nih.gov/health-information/diabetes/overview/preventing-problems/heart-disease-stroke

##### Explanation
"(Ever told) you have diabetes (If "Yes" and respondent is female, ask "Was this only when you were pregnant?".

##### Interpretation
Having diabetes means you are more likely to develop heart disease. People with diabetes are also more likely to have certain risk factors, such as high blood pressure or high cholesterol, that increase their chances of having a heart attack or a stroke.

High blood glucose from diabetes can damage your blood vessels and the nerves that control your heart and blood vessels. Over time, this damage can lead to heart disease.
People with diabetes tend to develop heart disease at a younger age than people without diabetes. Adults with diabetes are nearly twice as likely to have heart disease or stroke as adults without diabetes.

##### How to change
- The steps you take to manage your diabetes also help lower your chances of having heart disease or stroke:
- Follow your healthy eating plan.
- Make physical activity part of your routine.
- Stay at or get to a healthy weight.
- Get enough sleep.
- Quit smoking.

### Physical Activity
https://www.nhlbi.nih.gov/health/heart/physical-activity/benefits
https://www.cdc.gov/healthyweight/physical_activity/getting_started.html

##### Explanation
"Adults who reported doing physical activity or exercise during the past 30 days other than their regular job"

##### Interpretation
Physical activity lowers your risk for many diseases, such as coronary heart disease, diabetes, and cancer.
Inactive people are more likely to develop heart disease than people who are physically active. Studies suggest that inactivity is a major risk factor for heart disease, just like high blood pressure, high blood cholesterol, and smoking.

##### How to change
- Reduce time sitting and increase time moving.
- Make physical activity part of your daily or weekly routine.
- Take up a sport, alone or in a group.

### Heavy Alcohol Consumption
https://www.hopkinsmedicine.org/health/wellness-and-prevention/alcohol-and-heart-health-separating-fact-from-fiction
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5513687/

##### Explanation
"Heavy drinkers (adult men having more than 14 drinks per week and adult women having more than 7 drinks per week)"

##### Interpretation
Heavy drinking, on the other hand, is linked to a number of poor health outcomes, including heart conditions. Excessive alcohol intake can lead to high blood pressure, heart failure or stroke. Excessive drinking can also contribute to cardiomyopathy, a disorder that affects the heart muscle.

Light-to-moderate drinking (1 to 14 drinks/week) is associated with a significant reduction in progressive heart failure and hospitalization. However, there were no positive effects in subjects with mechanical or electrical dysfunction of heart muscle, or nonischemic heart disease, and although not significant, there was a slight risk for hospitalization for heart failure.

##### How to change
- Reduce the amount of drinks you have in a week to less than 14 for men, 7 for women. (1 drink= 355 ml beer / 118 ml wine / 44 ml spirits)
- If you have certain heart rhythm abnormalities or heart failure, you should avoid even that much or not drink at all.

### General Health

##### Explanation
"Would you say that in general your health is: Excellent, Very good, Good, Fair, Poor"

##### Interpretation
Poor general health may indicate heart disease as a cause.


### Mental Health
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6016051/

##### Explanation
"Now thinking about your mental health, which includes stress, depression, and problems with emotions, for how many days during the past 30 days was your mental health not good?"

##### Interpretation
A higher prevalence of mental diseases in CHD (Coronary Heart Disease) patients has been demonstrated. Conversely, people suffering from a mental disease seem to have an increased risk of CHD. Moreover, common pathophysiological mechanisms may link both diseases.

### Physical Health
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6041849/

##### Explanation
"Now thinking about your physical health, which includes physical illness and injury, for how many days during the past 30 days was your physical health not good?"

##### Interpretation
A low physical health is strongly and significantly associated with the incidence of all major types of coronary heart disease.

### Difficulty Walking
https://www.medindia.net/news/walking-difficulties-linked-with-heart-disease-risk-factors-174860-1.htm

##### Explanation
"Do you have serious difficulty walking or climbing stairs?"

##### Interpretation
The more risk factors people have for heart disease, the faster their decline in walking speed.

