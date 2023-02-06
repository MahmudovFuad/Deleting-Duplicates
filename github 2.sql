--Delete dublicate rows sql server 


---first creating table 

CREATE TABLE [dbo].[product](
	[product_name] [nvarchar](20) NULL,
	[production_date] [date] NULL,
	[number] [int] NULL,
	[price] [decimal](9, 3) NULL,
	[city] [nvarchar](20) NULL
) ON [PRIMARY]

go



---insert to table dublicate rows



insert into product(city,product_name,production_date,number,price)
values('Baku','Yoghurt','2020-01-01',100,2.550),
('Ankara','Tea','2020-05-02',150,10.500),
('Baku','Sausage','2021-03-19',240,13.75),
('Istanbul','Rice','2022-04-30',500,4.500),
('Ankara','Sugar','2019-07-19',660,5.500),
('Istanbul','Soap','2022-01-01',1000,11.30),
('Ankara','Waffles','2022-02-02',330,8.500),
('Istanbul','Fruit Juice','2021-03-01',2200,2.000),
('Baku','Alcohol','2022-05-05',1200,25.000),
('Ankara','Water','2022-10-10',900,1.800),
('Baku','Bread','2022-07-05',240,2.000),
('Istanbul','Cake','2023-09-18',465,3.700),
('Baku','Pasta','2018-07-01',1250,3.400),
('Ankara','Milk','2021-03-20',1345,2.800),
('Istanbul','Chip','2022-10-30',680,3.000)
,('Baku','Yoghurt','2020-01-01',100,2.550),
('Ankara','Tea','2020-05-02',150,10.500),
('Baku','Sausage','2021-03-19',240,13.75),
('Istanbul','Rice','2022-04-30',500,4.500),
('Ankara','Sugar','2019-07-19',660,5.500),
('Istanbul','Soap','2022-01-01',1000,11.30),
('Ankara','Waffles','2022-02-02',330,8.500),
('Istanbul','Fruit Juice','2021-03-01',2200,2.000),
('Baku','Alcohol','2022-05-05',1200,25.000),
('Ankara','Water','2022-10-10',900,1.800),
('Baku','Bread','2022-07-05',240,2.000),
('Istanbul','Cake','2023-09-18',465,3.700),
('Baku','Pasta','2018-07-01',1250,3.400),
('Ankara','Milk','2021-03-20',1345,2.800),
('Istanbul','Chip','2022-10-30',680,3.000)

select * from product order by 1


--deleting duplicates  (According to columns product_name,production_name,number) 


with cte as(
select *from(
select ROW_NUMBER() over(partition by product_name,production_date,number order by product_name) as rn,* from product 
)x )
delete from cte where  rn>1
select *from  product