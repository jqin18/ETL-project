-- Create tables for raw data to be loaded into in CovidVaccine_Db
CREATE TABLE "covid_vaccine" (
    "VAERS_ID" INTEGER PRIMARY KEY,
    "Vaccine" VARCHAR(200), 
    "Dose" VARCHAR(200),
    "Route" VARCHAR(200),
    "Site" VARCHAR(200),

    "RECVDATE" VARCHAR(200),
    "STATE" VARCHAR(200),
    "AGE_YRS" VARCHAR(200),
    "SEX" VARCHAR(200),
    "SYMPTOM_TEXT" VARCHAR,
    "RECOVD" VARCHAR(200),
    "ALLERGIES" VARCHAR(200),

    "SEX" VARCHAR(200),
    "SYMPTOM1" VARCHAR(200),
    "SYMPTOM2" VARCHAR(200),
    "SYMPTOM3" VARCHAR(200),
    "SYMPTOM4" VARCHAR(200),
    "SYMPTOM5" VARCHAR(200) 
);

