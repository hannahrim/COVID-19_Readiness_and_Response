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
    water_source INT,	
    soapwater INT, 
    st_precautions INT,	
    preparedness FLOAT,
    prep2 INT,
    TBservice INT,
    HIVcare INT,
    meetings INT,
    quality INT,
    inpatient INT,
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

CREATE TABLE indicators (
    FACIL INT,	
    water_source INT,	
    sterilization INT,	
    equip_hld INT,	
    guidelines_HLD INT,	
    disinfectant INT,	
    soapwater INT,	
    st_precautions INT,	
    latexgloves INT,	
    medicalmasks INT,	
    gowns INT,	
    eye_protect INT,	
    numberbeds INT,
    preparedness INT,
    PRIMARY KEY (FACIL)
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
	ind.water_source,
	ind.sterilization,
	ind.equip_hld,
	ind.guidelines_HLD,
	ind.soapwater,
	ind.disinfectant,
	ind.st_precautions,
	ind.latexgloves,
	ind.medicalmasks,
	ind.gowns,
	ind.eye_protect,
	ind.preparedness,	
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
INNER JOIN infection_indicators as ind
ON (pr.FACIL = ind.FACIL)
LEFT JOIN covid_cases_global as co
ON (pr.Country = co.Country_code)
WHERE (co.Date_reported = '10/11/2020');