
-- Generate the list of customer has per age and profession and display them according to ascending order of the age.
select "age","education" from "Customer_and_bank details_p1" order by "age" asc;


--	Generate the list of customer who have no housing loan and personal loan.
select * from "Customer_and_bank details_p1" where "housing" = 'no' and "loan" = 'no';

--Generate the list of customer who has credit and has been contacted more than 2 times during the campaign.
select cust.* from "Customer_campaign_details_p1" camp join "Customer_and_bank details_p1" cust on camp."Customer_id" = cust."Customer_id" 
where "campaign" > 2 and "default" = 'yes';

--	Generate the list of customer who has credit and has been contacted more than 2 times during the campaign and outcome of the campaign is successful.
select cust.* from "Customer_campaign_details_p1" camp join "Customer_and_bank details_p1" cust on camp."Customer_id" = cust."Customer_id" 
where "campaign" > 2 and "poutcome" = 'success' and "default" = 'yes'

-- Generate the list of customer who has credit and and has been contacted more than 2 times during the campaign and outcome of the campaign is failure and who have been contacted in the month of June and also display the day contacted.

select cust.*,camp."day_of_week" from "Customer_campaign_details_p1" camp join "Customer_and_bank details_p1" cust on camp."Customer_id" = cust."Customer_id" 
where "campaign" > 2 and "poutcome" = 'failure' and "month"='jun' and "default" = 'yes';

-- Generate report giving state-wise breakup of number of customers

select s."State_Name",count(cust."Customer_id") AS StateWiseCount from "Customer_and_bank details_p1" cust JOIN "City_Master" c on cust."City_Code" = c."City_Code"
JOIN "State_Master" s on c."State_Code" = s."State_Code"
group by s."State_Name" order by s."State_Name";

-- Generate report giving city-wise distribution of customers

select c."City_Name",count(cust."Customer_id") AS CityWiseCount from "Customer_and_bank details_p1" cust JOIN "City_Master" c on cust."City_Code" = c."City_Code"
group by c."City_Name" order by c."City_Name";
