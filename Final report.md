ETL Project report - COVID-19 World Vaccine Adverse Reactions

Here is a link to the google doc: https://docs.google.com/document/d/1ZvE9J2yptf4uF_woFD7Z3XLTpef61PCkJJ5_qymJZo0/edit?usp=sharing

Extract

The original dataset for this project was sourced from Kaggle (https://www.kaggle.com/ayushggarg/covid19-vaccine-adverse-reactions), within this dataset, there are three different data sources formatted as csv files. Each csv file contains different content regarding the information reported to the vaccine adverse event reporting system (VAERS), all csv files share the same VAERS identification number.

For example:
2021VAERSDATA.csv contains 35 columns of general information such as the age, gender, state, underlying health issues, a long description text of the symptoms experienced and any known allergy of the reporting individual. (Mostly categorical data, some numerical data)
 
2021VAERSSYMPTOMS.csv This file categorised the side effects experienced into 11 columns with professional medical terms. (100% categorical data) 
 
2021VAERSVAX.csv This file records the vaccine brand, the number of doses administered and the vaccination route given that leads to an adverse reaction. (Mostly categorical data, some numerical data)
 
We downloaded these three files and proceeded to the transformation phase of this project.  
 
 
  
 







Transform: 

1.Cleaning 
Each of the three files mentioned above were cleaned individually as a first step in the transformation phase using python and jupyter notebook. 
 
2021VAERSDATA.csv: After inspecting the entire file, only 8 out of the 35 columns were kept as these columns holds the most relevant information(VAERS_ID, RECVDATE, STATE, AGE_YRS, SEX, SYMPTOM_TEXT, RECOVD, ALLERGIES). 
 
The new data frame(with 8 columns) went through a second inspection to count and see the numbers of NaN in each column. There are 34,121 recorded Vaers ID but only 18,587 of them have the allergies column filled with text. I then performed the value_counts() function on the allergies column and found out the top 4 values with most counts are all the variants of saying not allergic to anything (None, none, NKA, KDKA).
 
If I use the .dropna() function now, it would almost wipe out half of this dataframe, which is an unreasonable loss to this dataframe. Therefore, I made the decision that instead of dropping the NaNs, I will fill the NaNs with “NKA”, which is a medical term for “not known allergies”. I’ve also replaced the different variants with NKA to keep this data frame consistent. 

Once this is done, I perform drop.na() on this data frame (left with 28,000 rows) and save the data frame as a csv file. 
 
2021VAERSSYMPTOMS.csv
The data cleaning was performed in a Jupyter notebook importing pandas and SQLalchemy. The final cleaned Dataframe was then exported as a csv file to be merged and joined with the two other cleaned datasets. The NaN or empty values in theSymptoms dataframe were intentionally not dropped, as the  lack of  symptoms gives a visual indication of how many or how little symptoms each individual is likely to record.

 
2021VAERSVAX.csv We performed Data Cleaning of the data in csv format which was downloaded from Kaggle. We transformed this data in a Jupyter Notebook using python. We deleted any unnecessary columns keeping the unique patient ID column (VAERS_ID). Then, deleted any duplicate rows. “NaN”s were dropped where it was not considered to impact the overall dataset significantly. The cleaned Dataframes were transferred into cleaned CSV files ready for merging. 




2.Merging and further cleaning

Once the three CSV files VAERSDATA, VAERSSYPTOMS, VAERSVAX were cleaned, they were loaded and read into pandas via pd.read_csv() as three separate pandas dataframes: symptoms, vaersvax, vaersdata.




Then the three pandas dataframe were joined together via outer merge on “VAERS_ID”, which was the common key between the dataframes. The “VAERS_ID” is the unique ID assigned to the Vaccine Adverse Event Reporting System (VAERS) for each patient. This ID is the common key we used to merge the dataframes together. The dataframes symptoms and vaersvax were merged together first and then the result of this join was then merged with the third dataframe vaersdata to produce the final combined dataframe.




Then some more additional cleaning was performed. Unwanted columns were removed. And duplicates were also dropped before loading into SQL database. 





After inspecting the merged data frame, we found some NaN values in the vaccine column, since our aim was to record the side effects of covid-19 vaccine, the rows will become meaningless if we do not know what covid-19 vaccine was administered, therefore, as the very last step, we dropped the rows where the vaccine column does not have any information.


Load:
We’ve decided to load the merged data frame into a SQL database.  A relational database structure is more suitable because of the already existing columns in the csv files and the information stored is already ordered.
As a first step, we have created a database called “covid_vaccine_db” within postgresql using pgAdmin4, then we created a table called “covid_vaccine”. Within this table, we created 17 columns that share the same column name as our merged data frame. Vaers_ID is the primary key, 14 out of the 16 columns are VARCHAR with 200 character limits, and symptom_text and allergies columns both have a limit of 20,000 characters. 
After the table was created, we used python and sql alchemy to connect to the local server and successfully loaded our merged dataframe into the “covid_vaccine_db” database.


