-- Exploratory Data Analysis

select * 
from layoffs_stagging2 ;

select max(total_laid_off), max(percentage_laid_off)
from layoffs_stagging2 ;

select *
from layoffs_stagging2
where percentage_laid_off = 1
order by funds_raised_millions desc ; 

select company, sum(total_laid_off)
from layoffs_stagging2
group by company
order by 2 desc ; 

select min(`date`), max(`date`)
from layoffs_stagging2 ; 

select industry, sum(total_laid_off)
from layoffs_stagging2
group by industry
order by 2 desc ; 