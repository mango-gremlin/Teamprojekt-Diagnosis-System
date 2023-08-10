<img width="639" alt="Bildschirm­foto 2023-08-08 um 16 24 34" src="https://github.com/mango-gremlin/Teamprojekt-Diagnosis-System/assets/116288221/2b1078eb-57b7-4137-b6d7-981942815277">


The bar graph is showing the number of datasets with n symptoms. There are no datasets with more than the shown amount of symptoms.

It can be seen, that there are no data points with less than 3 symptoms or more than 17. So the number of symptoms range between 3 and 17.

The exact distribution is: <br>
[0.00, 0.00, 0.00, 0.07, 0.17, 0.16, 0.14, 0.07, 0.05, 0.04, 0.06, 0.09, 0.05, 0.04, 0.01, 0.01, 0.02, 0.01] <br>
For the first 17 values (and 0 for the rest), where the i-th entry, represents the percentage of data point with i symptoms.

If the values of [0:i] are summed up, the result is: <br>
[0.00, 0.00, 0.00, 0.07, 0.25, 0.40, 0.54, 0.60, 0.66, 0.69, 0.76, 0.85, 0.90, 0.94, 0.95, 0.96, 0.99, 1.00] <br>
showing that more than half of the data points have between 3 and 6 symptoms, and only 10% have more or equal to 13 symptoms.
