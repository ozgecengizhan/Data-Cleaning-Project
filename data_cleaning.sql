-- Data Cleaning 

Select * 
from layoffs ;

-- 1: Remove Duplicates
-- 2: Standardize the Data
-- 3: Null Values or Blank Values
-- 4: Remove Any Columns

-- Ham veritabanında çalışmamak için layoffs tablosunun kopyasını oluşturuyoruz.

Create table layoffs_stagging 
like layoffs ;

Select *
from layoffs_stagging ;

Insert layoffs_stagging
select * 
from layoffs ;

-- Yinelenen verileri kaldırmak için satır numarası ve bunları tüm sütunlarla eşleştireceğiz.
-- Ve sonrasında herhangi bir yineleme olup olmadığına bakacağız.

select * ,
ROW_NUMBER() over(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, 'date') as row_num
from layoffs_stagging;

-- Yinelenen verileri görmek için cte ile gecici tablolar oluşturabiliriz

with duplicate_cte as 
(
select * ,
ROW_NUMBER() over(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, 'date', stage, country, funds_raised_millions) as row_num
from layoffs_stagging
)
select * 
from duplicate_cte
where row_num > 1;

select * 
from layoffs_stagging
where company = 'Casper' ;

