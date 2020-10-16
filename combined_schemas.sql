CREATE TABLE combined_preparedness (
    FACIL INT,
    Country	VARCHAR,
    REGION VARCHAR,
    Zone VARCHAR,
    FACTYPE	INT,
    MGA	INT,
    FTYPE INT,
    Factype2 INT,	
    ownership INT,
    water_source BOOLEAN,	
    soapwater BOOLEAN, 
    st_precautions BOOLEAN,	
    preparedness FLOAT,
    prep2 BOOLEAN,
    TBservice BOOLEAN,
    HIVcare BOOLEAN,
    meetings BOOLEAN,
    quality BOOLEAN,
    inpatient BOOLEAN,
    numberbeds INT,
    total_full INT,
    outpatients INT,
	PRIMARY KEY (FACIL)
);

CREATE TABLE gps (
    FACIL INT,
    Country	VARCHAR,
	REGION_code INT,
    REGION_name VARCHAR,
	LATNUM FLOAT,
	LONGNUM FLOAT,
	PRIMARY KEY (FACIL)
);

CREATE TABLE covid_cases_global (
    Date_reported DATE, 
	Country_code VARCHAR,	 
	Country VARCHAR,
	WHO_region VARCHAR,
	New_cases INT,
	Cumulative_cases INT,	 
	New_deaths INT,
	Cumulative_deaths INT, 
	PRIMARY KEY (Country,Date_reported)
);

SELECT pr.FACIL,
    pr.Country,
    pr.REGION,
    pr.Zone,
    gps.REGION_code,
    gps.REGION_name,
	gps.LATNUM,
	gps.LONGNUM,
    pr.FACTYPE,
    pr.MGA,
    pr.FTYPE,
    pr.Factype2,	
    pr.ownership,
    pr.water_source,	
    pr.soapwater, 
    pr.st_precautions,	
    pr.TBservice,
    pr.HIVcare,
    pr.meetings,
    pr.quality,
    pr.inpatient,
    pr.numberbeds,
    pr.total_full,
    pr.outpatients,
    co.Cumulative_cases,
    co.Cumulative_deaths
INTO combined_full_data
FROM combined_preparedness as pr
INNER JOIN gps as gps
ON (pr.FACIL = gps.FACIL)
LEFT JOIN covid_cases_global as co
ON (pr.Country = co.Country_code)
WHERE (co.Date_reported = '10/11/2020');
