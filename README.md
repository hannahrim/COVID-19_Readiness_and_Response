# COVID-19_Readiness_and_Response

Project Plan:  COVID Readiness & Response
UC Berkeley Data Analysis Boot Camp
Group Project – Team 4

# Overview:

As the global pandemic of COVID19 continues to rage around the world, health systems in developing countries need mechanisms to prioritize resources for infection prevention and control.  Health facilities need guidance and materials, such as disinfectant and personal protective equipment (PPE), to help prevent infections within their facilities where potentially infected individuals congregate seeking treatment for COVID and other diseases.  But public health resources are insufficient to blanket the system with resources, and this would in any case be inefficient since some facilities already have sufficient capacity to prevent infection.  

Team 4 proposes the development of a predictive model using machine learning to identify health facilities (or the districts in which they are located) in selected developing countries most in need of capacity building for infection prevention and control.  If such a model could accurately predict which facilities and/or districts are most in need, the savings in time and resources would be substantial, and resources would be freed up for other program areas and diseases.

# Data sources:
For over 30 years, the United States Agency for International Development (USAID) has supported the Demographic and Health Surveys Program (DHS Program). The DHS Program provides technical assistance and funding for the implementation of more than 320 household and facility-based surveys in 90 countries across Africa, Asia, Latin America/Caribbean and Eastern Europe.  Two of these surveys, the Service Provision Assessment (SPA), a health facility assessment to measure service availability and readiness, and the Demographic and Health Survey (DHS), a population-based survey to measure social, demographic, and health status characteristics of populations, would serve the needs of our predictive model. 

In the SPA, health facility service readiness includes elements of infection control and prevention.  For instance, the survey measures whether a health facility has 
- a continuous source of clean water, 
- effective mechanisms for medical waste disposal, 
- PPE (e.g. masks, gowns, eye protection, sterile gloves, etc.),
- disinfectant,
- guidelines for infection control
- others.

An index of readiness to prevent and control infection can be calculated from the above indicators and a threshold value for readiness established whereby facilities can be grouped as ready, or not, to provide services safely during the pandemic.   Other variables of interest to help predict readiness are also available in the SPA, such as facility type (e.g. hospital, health center, health post), number of beds (a measure of capacity, or size), number of health care workers present, etc.

We can also link the DHS to this data set which would provide population-based estimates of demographic information, such as socio-economic status, level of education, age distribution, prevalent occupations, and other characteristics of the population served by the health facility.  These estimates, based on a house-hold survey, would be applicable at the domain of estimation of the survey, for example the geographic region of the country in which the facility resides.  All facilities in the same region would therefore have the same value.

We will start with data from one country, and if the results are promising we can extend to multiple countries, potentially.  Ideally the country would have conducted a SPA and DHS surveys in the same year.  Since SPA surveys are conducted far less often than DHS, we will focus on countries having implemented the SPA, and ideally recently.  Potential candidate countries include the Democratic Republic of the Congo (DRC), and Senegal, which have both conductedthe SPA and DHS in recent years.

# Data Management
The data are available in many formats (CSV, JSON, geoJSON, XML, to name a few), and also via Application Program Interface (API).  We will acquire the data and load it into a PostgreSQL database at Amazon RDS.
[Sample data](https://github.com/hannahrim/COVID-19_Readiness_and_Response/blob/Jueun-Lee/sampleData.csv)

# Dashboard
We will use Tableau to create graphics (bar charts) to show differences between geographic areas for different predictors.  We will use Flask to show a map of readiness for infection control within the country.

# Model (Data Analysis)
We will use a machine learning classification model to classify health facilities and districts as either ready to provide health services safely (i.e. adequate readiness for infection control and prevention), or not ready.  We will use python with the sklearn, numpy, pandas, scipy modules.
[Draft Model](https://github.com/hannahrim/COVID-19_Readiness_and_Response/blob/Jueun-Lee/DraftModel.ipynb)

# Project Management & Communications
We have created a GitHub repository (COVID Readiness & Response) with branches for project management, database management,  dashboards and visualizations, and Analysis (machine learning).  We also have set up a project communication platform in Asana. 

# Roles 
- Project Management : Hannah Rim 
- Machine Learning : David Boone, Jueun Lee
- Dashboard : Ramesh Azariah
- Database : Jueun Lee, Shanice Brown 



	
