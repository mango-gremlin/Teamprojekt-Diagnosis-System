% This script generates a table containing health information text for the
% lumpy skin table values.

% colnames:       names of values (as in dataset)
% fullnames:      full names of values
% meaning:        What does this value mean?
% interpretation: How to Interpret this value?
% change:         How to change/decrease risk?
% sources:        sources

% array with shortened names
colnames = ["x, y"
    "cld", 
    "frs", 
    "pre", 
    "tmn, tmp, tmx", 
    "vap", 
    "wet", 
    "dominant_land_cover"]

% array with full names
fullnames = ["Global Latitude and Longitude",
    "Cloud Cover", 
    "Frost", 
    "Precipitation", 
    "Temperature", 
    "Vapour Pressure", 
    "Wetness", 
    "Most Dominant Land Cover"]

% what does this value mean?
meaning = ["Global Latitude and Longitude",
    "Cloud cover refers to the fraction of the sky obscured by clouds on average when observed from a particular location.", 
    "Average number of days per month with presence of frost.", 
    "Average quantity of precipitation in mm per month.", 
    "Average daily minimun, mean and maximun temperature in Celsius.", 
    "Mean vapour pressure in millibars.", 
    "Average number of days per month with presence of rain.", 
    "Category of most dominant land cover around the given case. Forest, Agriculture, Desert, Shrubs, Grassland, Built-up area, Wetlands, Rainforest, Barren land, Ice/Snow, and Inland water."]

% how to interpret this value
interpretation = ["The coordinates are a strong determinant of every other meteorological and geospatial parameter. This characteristic in itself, make x and y the best predictors for lumpy skin disease. LSD is endemic in Africa and the Middle East. Since 2015, several Southeastern European countries have been affected; the disease is spreading from the Balkans in a Northwestern direction. It is mainly transmitted by arthropods.",
    "Cloud cover has a correlation with rainfall, which affects vectors (moskitoes etc) and has a positive correlation with the spread of lumpy skin disease.", 
    "Blood-feeding insects such as mosquitos and flies act as mechanical vectors to spread the disease. The virus has been isolated from Stomoxys, Biomyia fasciata, Tabanidae, Glossina, and Culicoides species, all of which can not survive an extended time under freezing temperatures. The higher the number frost days, the lower the transmission of the lumpy skin virus.", 
    "Outbreaks of lumpy skin disease are associated with high humidity and are more prevalent near bodies of water. Tropical regions have thus a higher presence of lumpy skin disease with around 150-200 mm per month.", 
    "The prevalence of lumpy skin disease is higly associated with the temperature. Outrbreaks are associated with high temperatures, while colder temperatures hinder its transmission. Given this, the higher this three coefficients are, the higher the possibility of lumpy skin disease infection.", 
    "Vapour pressure is and indicator of air saturation (quantity of water air holds). Vapour pressure around 20 or higher is considered high humidity is a predictor of lumpy skin disease.", 
    "Outbreaks of lumpy skin disease are dependent upon animal, wind, and rainfall patterns, which affect the vector (moskitoes etc) populations. The increase in number of rainy days per month is positively correlated with the spread of lumpy skin disease.",     
    "Lumpy skin disease infections occur within specific geographic distributions. It is most prominent in tropical, low-lying areas or near bodies of water."]


% how to change/decrease risk
change = ["Consider relocating your cows.", 
    "Consider relocating to a place with less rainfall.", 
    "Relocate to colder regions or install insect-protection.", 
    "Reduce amount of bodies of water near your pasture.", 
    "Consider relocating to colder climates.", 
    "Consider relocating to more arid climates.", 
    "Keep tabs on vector populations and take steps to reduce or protect from them in rainy seasons.",     
    "Relocate to a non-tropical region away from bodies of water."]

% further reading
sources = ["https://www.fli.de/en/news/animal-disease-situation/lumpy-skin-disease/",
    "http://www.oie.int/fileadmin/Home/eng/Health_standards/tahm/2.04.13_LSD.pdf", 
    "Coetzer, J.A.W. (2004). Infectious Diseases of Livestock. Cape Town: Oxford University Press. pp. 1268–1276", 
    "Coetzer, J.A.W. (2004). Infectious Diseases of Livestock. Cape Town: Oxford University Press. pp. 1268–1276.", 
    "Yeruham, I; Nir, O; Braverman, Y; Davidson, M; Grinstein, H; Haymovitch, M; Zamir, O (22 July 1995). Spread of Lumpy Skin Disease in Israeli Dairy Herds. The Veterinary Record. 137–4 (4): 91–93. doi:10.1136/vr.137.4.91. PMID 8533249. S2CID 23409535.", 
    "Coetzer, J.A.W. (2004). Infectious Diseases of Livestock. Cape Town: Oxford University Press. pp. 1268–1276.", 
    "http://www.oie.int/fileadmin/Home/eng/Health_standards/tahm/2.04.13_LSD.pdf",     
    "Tulman, E. R.; Afonso, C. L.; Lu, Z.; Zsak, L.; Kutish, G. F.; Rock, D. L. (1 August 2001). Genome of Lumpy Skin Disease Virus. Journal of Virology. 75 (15): 7122–7130. doi:10.1128/JVI.75.15.7122-7130.2001. ISSN 0022-538X. PMC 114441. PMID 11435593"]

% full table
infoTexts = table(colnames, fullnames, meaning, interpretation, change, sources)

% save table
writetable(infoTexts, "lumpyskin_infotext.csv", 'QuoteStrings', true);
%writetable(infoTexts, "lumpyskin_infotext.csv")