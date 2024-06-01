 select * from sales2

-- data that im using 

select  order_date, sales, profit, state, region, customer_segment, product_category, product_subcategory
from sales2

-- looking at sales vs region
--shows liklihood of loss/gain of profit 

select order_date, region, sales, profit, (cast(sales as numeric)/cast(profit as numeric))*100 as profitpercentage
from sales2
where region like '%West%'

--- looking at ttotal sales vs product category

select order_date, sales, product_category
from sales2

--looking at highest selling product in each region

select region, product_category, max(sales) as highest_sale
from sales2
group by region, product_category
order by highest_sale desc


-- looking at profit for each sub cateory

select  order_date, region, product_subcategory, max(profit) as mostpopularproduct
from sales2
group by order_date, region, product_subcategory
order by mostpopularproduct desc

--most popular product per state 

select  order_date, state, region, product_subcategory, max(profit) as mostpopularproduct
from sales2
group by order_date, state, region, product_subcategory
order by mostpopularproduct desc


select s.*, b.*
from budget b
inner join sales2 s 
on b.customer_state = s.state;


--visulations for later 

--looking at highest selling product in each region

create view highestsellingproduct as 
select region, product_category, max(sales) as highest_sale
from sales2
group by region, product_category
order by highest_sale desc


--looking at sales vs region and liklihood of loss/gain of profit 

create view salesvsregionpercentage as
select order_date, region, sales, profit, (cast(sales as numeric)/cast(profit as numeric))*100 as profitpercentage
from sales2

--most popular product per state

create view mostpopularproduct as 
select  order_date, state, region, product_subcategory, max(profit) as mostpopularproduct
from sales2
group by order_date, state, region, product_subcategory
order by mostpopularproduct desc

-- looking at profit for each sub cateory

create view profitvssubcat as 
select  order_date, region, product_subcategory, max(profit) as mostpopularproduct
from sales2
group by order_date, region, product_subcategory
order by mostpopularproduct desc


