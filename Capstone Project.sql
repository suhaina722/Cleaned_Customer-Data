Create Database customer_analysis;
Use customer_analysis;

Create Table customers (customer_id int,age INT,gender VARCHAR(10),item_purchased VARCHAR(100),age_group VARCHAR(20),
purchase_amount DECIMAL(10,2),review_rating DECIMAL(3,2),location VARCHAR(100),shipping_type VARCHAR(50),previous_purchase DECIMAl(10,2),
product_name VARCHAR(100),category VARCHAR(50),payment_method VARCHAR(50),frequency_of_purchases VARCHAR(20),size VARCHAR(20),colour VARCHAR(20),color VARCHAR(20),
discount_applied VARCHAR(10),subscription_status VARCHAR(20),purchase_count INT,purchase_frequency_days INT);

show tables;

show variables like 'secure_file_priv';
load data infile "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\cleaned_customer_data.csv"
into Table customers
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

select * from customers;
select count(*) from customers;

select gender,SUM(purchase_amount)AS    #Revenue by gender
total_revenue
from customers
group by gender;

select *           #High_spending discount users
from customers
where discount_applied = 'yes'
And purchase_amount > 100;

select item_purchased,             #Top_Rated products
AVG(review_rating)AS avg_rating
from customers
group by item_purchased
order by avg_rating DESC
limit 5;

select age_group,count(*) AS      #customers segmentation(age group)
total_customers,sum(purchase_amount)AS
total_spending
from customers
group by age_group;

select subscription_status,      #subscription behaviour
count(*) AS total_customers,
AVG(purchase_amount) AS
age_spending
from customers
group by subscription_status;

select age_group,sum(purchase_amount)AS revenue  #evenue by age group
from customers
group by age_group;

select product_name, sum(purchase_amount) AS total_sales  #Top selling product
from customers
group by product_name
order by total_sales DESC
limit 5;


