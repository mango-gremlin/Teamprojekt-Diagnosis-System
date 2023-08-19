### Lumpy Skin Disease Columns:
- x - longitude
- y - latitude
- cld - cloud cover
- frs - frost day frequency
- pre - precipitation in mm 
- tmn - average daily minimum temperature C
- tmp - average daily mean temperature C
- tmx - average daily maximum temperature C
- vap - vapor pressure in mb
- wet - wet days
- dominant_land_cover [int 0:11]


### X and Y
Global longitude and latitude.

##### Interpretation
- The coordinates are a strong determinant of every other meteorological and geospatial parameter. This characteristic in itself, make x and y the best predictors for lumpy skin disease. LSD is endemic in Africa and the Middle East. Since 2015, several Southeastern European countries have been affected; the disease is spreading from the Balkans in a Northwestern direction. It is mainly transmitted by arthropods.
- [source] (https://www.fli.de/en/news/animal-disease-situation/lumpy-skin-disease/#:~:text=of%2006.09.2016-,Lumpy%20Skin%20Disease%20(%20LSD%20)%20is%20a%20notifiable%20animal%20disease%20of,countries%20and%20ultimately%20to%20Europe.)

### cld
Cloud cover refers to the fraction of the sky obscured by clouds on average when observed from a particular location.

##### Interpretation
- Cloud cover has a correlation with rainfall, which affects vectors and has a positive correlation with the spread of lumpy skin disease.
- [source]( http://www.oie.int/fileadmin/Home/eng/Health_standards/tahm/2.04.13_LSD.pdf)


### frd
Average number of days per month with presence of frost.

##### Interpretation
- Blood-feeding insects such as mosquitos and flies act as mechanical vectors to spread the disease. tThe virus has been isolated from Stomoxys, Biomyia fasciata, Tabanidae, Glossina, and Culicoides species, all of which can not survive an extended time under freezing temperatures. The higher the number frost days, the lower the transmission of the lumpy skin virus.
- [source](Coetzer, J.A.W. (2004). Infectious Diseases of Livestock. Cape Town: Oxford University Press. pp. 1268–1276)

### pre
Average quantity of precipitation in mm per month.

##### Interpretation
- Outbreaks of lumpy skin disease are associated with high humidity and are more prevalent near bodies of water. Tropical regions have thus a higher presence of lumpy skin disease with around 150-200 mm per month.
- [source](Coetzer, J.A.W. (2004). Infectious Diseases of Livestock. Cape Town: Oxford University Press. pp. 1268–1276.)


### tmn, tmp and tmnx
Average daily minimun, mean and maximun temperature.

##### Interpretation
- The prevalence of lumpy skin disease is higly associated with the temperature. Outrbreaks are associated with high temperatures, while colder temperatures hinder its transmission. Given this, the higher this three coefficients are, the higher the possibility of lumpy skin disease infection.
- [source](Yeruham, I; Nir, O; Braverman, Y; Davidson, M; Grinstein, H; Haymovitch, M; Zamir, O (22 July 1995). "Spread of Lumpy Skin Disease in Israeli Dairy Herds". The Veterinary Record. 137–4 (4): 91–93. doi:10.1136/vr.137.4.91. PMID 8533249. S2CID 23409535.)


### vap
Mean vapor pressure in milibars.
##### Interpretation
- Vapor pressure is and indicator of air saturation (quantity of water air holds). Vapor pressure around 20 or higher is considered high humidity is a predictor of lumpy skin disease. 
- [source](Coetzer, J.A.W. (2004). Infectious Diseases of Livestock. Cape Town: Oxford University Press. pp. 1268–1276.)

### wet
Average number of days per month with presence of rain.

##### Interpretation
-  Outbreaks of lumpy skin disease are dependent upon animal wind and rainfall patterns, which affect the vector populations. The increase in number of rainy days per month is positively correlated with the spread of lumpy skin disease.
- [source]( http://www.oie.int/fileadmin/Home/eng/Health_standards/tahm/2.04.13_LSD.pdf)

### dominant_land_cover
Category of most dominant land cover around the given case. Forest, Agriculture, Desert, Shrubs, Grassland, Built-up area, Wetlands, Rainforest, Barren land, Ice/Snow, and Inland water.  

##### Interpretation
- Lumpy skin disease infections occur within specific geographic distributions. It is most prominent in tropical, low-lying areas or near bodies of water.
- [source] Tulman, E. R.; Afonso, C. L.; Lu, Z.; Zsak, L.; Kutish, G. F.; Rock, D. L. (1 August 2001). "Genome of Lumpy Skin Disease Virus". Journal of Virology. 75 (15): 7122–7130. doi:10.1128/JVI.75.15.7122-7130.2001. ISSN 0022-538X. PMC 114441. PMID 11435593.
