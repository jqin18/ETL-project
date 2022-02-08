# ETL-project
Project proposal

Due date: Tues 8th February 2022

Project title: ETL project 2.

Team members:
Jade, Yao, Antoinette, Stella

Datasets:
https://www.kaggle.com/ayushggarg/covid19-vaccine-adverse-reactions/version/4?select=2021VAERSVAX.csv
2021 VaersData.csv
2021 Vaerssymptoms.csv
2021 Vaersvax.csv

Project description/proposal:

For this project, we will be looking into the adverse reactions to Covid-19 vaccines reported to the vaccine adverse event reporting system (VAERS) in the United States in 2021.

We will be working with 3 csv files that hold different information and our aim is to clean, transform and merge all 3 files before loading the final product into a SQL database. A relational database structure is more suitable because of the already existing columns in the csv files and the information stored is already ordered.

Below is a breakdown on how we will be transforming the files: 
2021 VaersData.csv
Keep columns: 
VAERS_ID, RECVDATE, STATE, AGE_YRS, SEX, SYMPTOM_TEXT, RECOVD, ALLERGIES

2021 Vaerssymptoms.csv
Keep columns:
SYMPTOM-VERSION 1-5

2021 Vaersvax.csv
Keep columns:
VAX_MANU, VAX_DOESE, VAX_ROUTE, VAX_SITE

Cleaning Scripts: 
[2021Vaerssytoms_cleaning](./2021Vaerssymptoms_cleaning.ipynb)
[2021VaersData_cleaning](./2021VaersData_cleaning.ipynbipynb)
[2021VaersVax_cleaning](./2021VaersVax_cleaning.ipynb)

Merging Data:
[Merging_CSVs_updated](./Merging_CSVs_updated.ipynb)

Loading Data:
[loading](./loading.ipynb)


link to the presentation slides:
https://docs.google.com/presentation/d/1O11Mhii246cFzYyks2CBj2VhMFfDkZPJQu6-bq8MgyA/edit?usp=sharing

link to final report:
https://docs.google.com/document/d/1ZvE9J2yptf4uF_woFD7Z3XLTpef61PCkJJ5_qymJZo0/edit?usp=sharing
