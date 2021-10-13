
CREATE TABLE "Region_code_master"("Region_Name" varchar(50) NOT NULL, "Region_Code" int NOT NULL, CONSTRAINT "PK_Region_code_master" PRIMARY KEY ( "Region_Code"));

CREATE TABLE "State_Master"( "State_Code" varchar(20) NOT NULL, "State_Name" varchar(50) NOT NULL, "Region_Code" int NOT NULL, CONSTRAINT "PK_State_Master" PRIMARY KEY ( "State_Code" ), CONSTRAINT "FK_S_R" FOREIGN KEY ("Region_Code") REFERENCES "Region_code_master"("Region_Code"));

CREATE TABLE "City_Master"( "City_Code" varchar(20) NOT NULL, "City_Name" varchar(50) NOT NULL, "State_Code" varchar(20) NOT NULL, CONSTRAINT "PK_City_Master" PRIMARY KEY ( "City_Code" ),CONSTRAINT "FK_city_state" FOREIGN KEY ("State_Code") REFERENCES "State_Master" ("State_Code"));

CREATE TABLE "Customer_and_bank details_p1"(
	"Customer_id" int NOT NULL,
	"age" int NULL,
	"job" varchar(50) NULL,
	"marital" varchar(50) NULL,
	"education" varchar(50) NULL,
	"default" varchar(50) NULL,
	"housing" varchar(50) NULL,
	"loan" varchar(50) NULL,
	"City_Code" varchar(20) NULL,
	"Postal_Code" varchar(10) NULL,
	"Customer_Response" varchar(10) NULL,
 CONSTRAINT "PK_Customer" PRIMARY KEY  ( "Customer_id"),
CONSTRAINT "FK_customer_city" FOREIGN KEY ("City_Code") REFERENCES "City_Master" ("City_Code")); 

CREATE TABLE "Customer_campaign_details_p1"(
	"Customer_id" int NOT NULL,
	"contact" varchar(50) NOT NULL,
	"month" varchar(50) NOT NULL,
	"day_of_week" varchar(50) NOT NULL,
	"duration" int NOT NULL,
	"campaign" varchar(50) NOT NULL,
	"pdays" int NOT NULL,
	"previous" varchar(50) NOT NULL,
	"poutcome" varchar(50) NOT NULL,
 CONSTRAINT "PK_Customer_campaign" PRIMARY KEY ( "Customer_id"),
CONSTRAINT "FK_customer_campaign" FOREIGN KEY ("Customer_id") REFERENCES "Customer_and_bank details_p1" ("Customer_id")); 

CREATE TABLE "Customer_social_economic_data"(
	"Customer_id" int NOT NULL,
	"emp_var_rate" varchar(50) NULL,
	"cons_price_idx" varchar(50) NULL,
	"cons_conf_idx" varchar(50) NULL,
	"euribor3m" varchar(50) NULL,
	"nr_employed" varchar(50) NULL,
CONSTRAINT "PK_Customer_social" PRIMARY KEY ( "Customer_id"),
CONSTRAINT "FK_customer_social" FOREIGN KEY ("Customer_id") REFERENCES "Customer_and_bank details_p1" ("Customer_id")); 






