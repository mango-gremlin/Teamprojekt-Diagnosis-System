cd
%Eliminating columns from less important variables
hearth_ind_data = readtable("Data Tidying\heart_disease_health_indicators_BRFSS2015.csv");
cut_hearth_ind_data = removevars(hearth_ind_data, {'CholCheck', 'Income', 'Education', 'AnyHealthcare', 'NoDocbcCost', ...
    'Fruits', 'Veggies'});
cut_hearth_ind_data
writetable(cut_hearth_ind_data, 'tidy_hearth_disease_indicators.csv');
