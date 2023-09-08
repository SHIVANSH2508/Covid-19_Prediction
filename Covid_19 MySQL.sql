/*Cough_symptoms (TRUE = 1 , FALSE = 0)*/
/*FEVER (TRUE = 1 , FALSE = 0)*/
/*Sore_throat (TRUE = 1 , FALSE = 0)*/
/*Shortness_of_breath (TRUE = 1 , FALSE = 0)*/
/*Headache (TRUE = 1 , FALSE = 0)*/
/*Corona (Negative = 0, Positive =1, Other = 2)*/
/*Age_60_above (Unknown = 0 , Yes = 1, No = 2)*/
/*Sex (Unknown = 0, Male = 1,Female = 2)*/
/*Known_contact (Abroad=0, Contact with confirmed = 1, Other = 2)*/


/*1. Find the number of corona patients who faced shortness of breath.*/
select count(*) as count from `cleaned_data (1)` where corona = 1 and  Shortness_of_breath = 1;

/*2. Find the number of negative corona patients who have fever and sore_throat. */
select count(*) as count from `cleaned_data (1)` where Corona = 0 and Fever = 1 and Sore_throat = 1;

/*3. Group the data by month and rank the number of positive cases.*/
select monthname(Test_date), count(Ind_ID) as Total_Number , RANK () OVER (ORDER BY count(corona) desc) AS Rank_No from `cleaned_data (1)` where corona = 1
group by monthname(Test_date);

/*4. Find the female negative corona patients who faced cough and headache.*/
select * from `cleaned_data (1)` where corona = 0 and Sex = 2  and Cough_symptoms = 1 and Headache = 1;

/*5. How many elderly corona patients have faced breathing problems?*/
select count(*) as count from `cleaned_data (1)` where corona = 1 and Age_60_above = 1 and Shortness_of_breath= 1;

/*6. Which three symptoms were more common among COVID positive patients?*/
select sum(Cough_symptoms), sum(Fever), sum(Sore_throat), sum(Shortness_of_breath), sum(Headache) from `cleaned_data (1)` where Corona = 1;

/*7. Which symptom was less common among COVID negative people?*/
select sum(Cough_symptoms), sum(Fever), sum(Sore_throat), sum(Shortness_of_breath), sum(Headache) from `cleaned_data (1)` where Corona = 0;

/*8. What are the most common symptoms among COVID positive males whose known contact was abroad? */
select sum(Cough_symptoms), sum(Fever), sum(Sore_throat), sum(Shortness_of_breath), sum(Headache) from `cleaned_data (1)` where Corona = 1 and Sex = 1
and Known_contact = 0;

