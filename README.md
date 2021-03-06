# COVID-19_Readiness_and_Response

Project Plan:  COVID Readiness & Response
UC Berkeley Data Analysis Boot Camp
Group Project – Team 4

# Presentation for this project 
https://docs.google.com/presentation/d/1lAy8StLDQWyf62V-8jowSlDHaiTOXzar5aKAlyttHUI/edit?usp=sharing

# Overview:

As the global pandemic of COVID19 continues to rage around the world, health systems in developing countries need mechanisms to prioritize resources for infection prevention and control.  Health facilities need guidance and materials, such as disinfectant and personal protective equipment (PPE), to help prevent infections within their facilities where potentially infected individuals congregate seeking treatment for COVID and other diseases.  But public health resources are insufficient to blanket the system with resources, and this would in any case be inefficient since some facilities already have sufficient capacity to prevent infection.  

Team 4 developed a predictive model using machine learning to identify health facilities (or the districts in which they are located) in selected developing countries most in need of capacity building for infection prevention and control.  If such a model accurately predicts which facilities and/or districts are most in need, the savings in time and resources would be substantial, and resources would be freed up for other program areas and diseases.

# Data sources:
For over 30 years, the United States Agency for International Development (USAID) has supported the Demographic and Health Surveys Program (DHS Program). The DHS Program provides technical assistance and funding for the implementation of more than 320 household and facility-based surveys in 90 countries across Africa, Asia, Latin America/Caribbean and Eastern Europe.  Two of these surveys, the Service Provision Assessment (SPA), a health facility assessment to measure service availability and readiness, and the Demographic and Health Survey (DHS), a population-based survey to measure social, demographic, and health status characteristics of populations, would serve the needs of our predictive model. 

In the SPA, health facility service readiness includes elements of infection control and prevention.  For instance, the survey measures whether a health facility has 
- a continuous source of clean water, 
- effective mechanisms for medical waste disposal, 
- PPE (e.g. masks, gowns, eye protection, sterile gloves, etc.),
- disinfectant,
- guidelines for infection control
- others.

An index of readiness to prevent and control infection was calculated from the above indicators and a threshold value for readiness established whereby facilities was grouped as ready, or not, to provide services safely during the pandemic.   Other variables of interest to help predict readiness are also available in the SPA, such as facility type (e.g. hospital, health center, health post), number of beds (a measure of capacity, or size), number of health care workers present, etc.

We also linked the DHS to this data set which provided population-based estimates of demographic information, such as socio-economic status, level of education, age distribution, prevalent occupations, and other characteristics of the population served by the health facility.  These estimates, based on a house-hold survey, are applicable at the domain of estimation of the survey, for example the geographic region of the country in which the facility resides.  All facilities in the same region therefore have the same value.

We started with data from one country, extended to multiple countries.  The countries selected have conducted a SPA and DHS surveys in the same year, or within a reasonably short time period.  Since SPA surveys are conducted far less often than DHS, we focused on countries having implemented the SPA recently (2016-2018).  Countries included in the analysis were Democratic Republic of the Congo (DRC), Senegal, Haiti, and Bangladesh.  

# Data Management
The data are available in many formats (CSV, JSON, geoJSON, XML, to name a few), and also via Application Program Interface (API).  We acquired the data in .csv format and loaded it into a PostgreSQL database at Amazon RDS.

Data were downloaded from the DHS Project website in .CSV format.  The data from the facility assessment was recoded in Statistical Package for the Social Sciences (SPSS) Version 18 for Windows.  From the 1700+ variables in the datafile a subset of 30 relevant to the analysis was extracted, coded, merged with the GPS data and across countries before being  downloaded to .CSV.  It was then imported into PostreSQL.  Demographic data, also from the DHS Project, was downloaded for the four focal countries from the Statcompiler (https://www.statcompiler.com/en/).

Covid-19 data was downloaded from WHO homepage in .csv foramt 

[Sample data](https://github.com/hannahrim/COVID-19_Readiness_and_Response/blob/Jueun-Lee/sampleData.csv)
[Data Exploration](https://github.com/hannahrim/COVID-19_Readiness_and_Response/blob/master/data_explore.ipynb)

4 dataset was uploaded topostreSQL and 3 data table was created using SQL join including combined data 
![ERD](https://github.com/hannahrim/COVID-19_Readiness_and_Response/blob/master/Resource/QuickDBD-Free_Diagram.png)

### Primary data exploation 

![Distribution of medical facility's preparedness for each country](https://github.com/hannahrim/COVID-19_Readiness_and_Response/blob/Jueun-Lee/Images/boxplot.PNG)

![Comparison of covid-19 cases and deaths for countries](https://github.com/hannahrim/COVID-19_Readiness_and_Response/blob/Jueun-Lee/Images/covid-num.PNG)

![Covid-19 cases per 100K population](https://github.com/hannahrim/COVID-19_Readiness_and_Response/blob/Jueun-Lee/Images/covidplot.PNG)

# Dashboard
Extracting data from the prepared .CSV files dashboards focusing on readiness and response of each country were prepared.  The data used from the four countries of interest: Democratic Republic of Congo, Senegal, Haiti, and Bangladesh helped to show the relationship between the countries with access to vital resources previously listed and their level of preparedness.  The example of Senegal which had the highest level of preparedness of the four, with a score of 75% was conclusive by number of facilities within the region with reliable sources of clean water, PPE, disinfectants, medical waste disposal, and established guidelines for infection control.

![Facilities and Predicators](Deaths_Summary.jpg)

A comparison of preparedness factors such as access to medical masks, latex gloves along with general preparedness demonstrated that certain countries, again Senegal for example, were more prepared than the other in this respect.  Different factors were measured on the average number of available data to determine the outcome.  Various approaches were used to establish other relationships.  For example, graphs of the average number of recorded cases and deaths per million per country gave the status.  Comparison graphs indicated which countries had the highest number of cases and deaths.

Deeper analysis diving into preparedness at the regional level of each country was also included.  Maps of the country highlighted areas with a higher number of predictors. Some of the main predictors stated were visually organized on the map to give a general idea.  Comparisons of counties confirmed which ones had a higher control over preparedness.  
Strangely in one case, Senegal, a higher level of control with the greatest percentage of prevention indicators, still resulted in a comparatively high number of cases and deaths.  It became obvious that there are other factors yet to be considered besides the obvious to conclude level of preparedness.

![Senegal Preparedness and Deaths](Senegal_Eval.jpg)

Nevertheless, the purpose of this study was to conclude whether countries and regions had a sense of infection control, general preparedness and access to critical items such as water and bedspace to handle an epidemic or even pandemic such as Covid-19.  Our initial use of green dots for prepared and red dots for not, provided the basic perspective to confirm our prediction.  Matched with data such as availability of TB testing services, HIV Care, access to a wide variety of medical staff refined the concept of preparedness and confirmed the overall benefit of having them to reduce the number of cases and deaths.

![General Level of Preparedness](Analysis_Countries.jpg)

From the data our group so painstakingly gathered, cleaned, merged, and refined the prediction was clear: more associated positive predicators equal fewer cases and deaths.  The greater access to preparedness as a general idea, the more support can be provided to those regions who are lacking them.  

[Tableau url](https://us-west-2b.online.tableau.com/t/allcareplus/views/Region_Bangladesh/Dashboard1?:showAppBanner=false&:display_count=n&:showVizHome=n&:origin=viz_share_link)

# Model (Data Analysis)
We used a supervised machine learning classification model to classify health facilities and districts as either ready to provide health services safely (i.e. have adequate capacity for infection control and prevention), or not ready.  We used python with the sklearn, numpy, pandas, scipy modules to explore the accuracy, precision and recall of predictions from several approaches;  Logistic regression, Support Vector Models (SVM), Decision Trees, and Gradient Boosted Tree.  

Data were called from the PostgreSQL database at Amazon RDS using SQLAlchemy and Flask.  We made a dataframe to select out variables for the analysis and removed missing values using DropNa().  We created an outcome variable (prep2) to model preparedness for disease control and prevention by combining the predicators as follows:  if facilities were found to have medical masks, latex gloves, disinfectant, and soap and water available at the site on the day of the assessment they were considered prepared.  If any of these items was not present they were considered unprepared.  About 5% of facilities were judged prepared by this criteria.


Predicators selected for model included:

![Final Predictors](final-predicators.jpg)


Other predicators were also explored.  Numbers of cases and deaths of COVID19 for each country were obtained from the World Health Organization (WHO) website:  (www.who.int).  Theses data were only available at regional level for each country.  

We created classes from the data; we dropped the outcome variable 'prep2' from the dataframe (y) and the remaining variables were labeled X.  We trained the model using from  train_test_split from sklearn.model_selection using the default 75%/25% split.  We ran a logistric regression model using scipy.  

We ran into problems of convergence and needed to scale the data using the "tandardScaler from sklearn.preprocessing.  After scaling the the outcome variable we had to convert the data type from float to integer in order to run the model successfully.  We had a very small minority class (i.e. facility is prepared) and needed to oversample to boost the ability to make predictions.  We tried random and SMOTE for oversampling, and SMOTEENN for combination sampling, though there was no appreciable difference in performance among the different methods. We varied predictors to find the optimum set which provided the highest predictive value.  We calculated a balanced accuracy score using balanced_accuracy_score from sklearn.metrics.  We calculated an imbalanced classification matrix to show accuracy, precision, recall, and F1 scores for the minority and majority classes using classification_report_imbalanced from imblearn.metrics.
 
  
## Final Results

![Final Results](final-results.jpg)


While the accuracy of the models is fairly good (0.74-0.80), the precision is poor for the minority class (0.12-0.15).  A similar pattern was true for recall and F1 scores whereby the value is good for the majority class (unprepared), and poor for the minority class (prepared).

The best performing (and final) model included the following predicators: country, ownership, ftype, quality, inpatient, st_precautions, tbservice, and water_source.

# Challenges
-These models are not very good at predicting preparedness for infection control
-Non-standard data across countries, particularly with regard to region and demographic data.  For example, in DRC the facility assessment data is distributed among 26 regions of the country whereas the demographic data is subdivided into 10 regions.  These data were not possible to merge adequately.  In Senegal, the demographic data was sub-divided into four regions, whereas the facility data was grouped into 10 regions.  
-Lack of granularity in the cases and deaths data (and incongruence with regard to time). The COVID cases and deaths data is from 2020 whereas the facility data is from 2-3 years ago depending on the country.  It is not reasonable to believe that cases this would have had an effect on health facility preparedness from 2016-2018.  
-Convergence. The models were unable to converge prior to scaling the data.  Oversampling also helped balance the model and improved performance.

# Next Steps
-Explore methods to better integrate the demographic data
-More information on COVID cases and deaths will become available over time
-Explore methods to better utilize the GPS data. For example, the distance of facilities to big cities could be calculated for all facilities for which latitude and longitude data are available.  Distance to population centers is likely predictive of preparedness for infection control. 
-Explore other ways of defining preparedness.  The facilities labeled as prepared were a small subset of the data (only ~ 5%).  Relaxing the standard for preparedness may make the model more robust at prediction by increasing the number of facilities deemed prepared.  Alternatively, an index was prepared from eleven variables associated with preparedness for infection control.  This continuous outcome variable could be modeled using linear regression.

### Machine Learning Code files:
[Logistic Regression Model](COVID_Readiness-LogReg_SMOTE.ipynb)

[Support Vector Machines Model](COVID_Readiness-SVM.ipynb)

[Decision Trees Model](COVID19_decision-trees.ipynb)

[Gradient Boosted Tree Model](COVID_Prepare_gradient_boosted_tree.ipynb)

 



	
