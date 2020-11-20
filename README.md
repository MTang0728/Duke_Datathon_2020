# 2020 Duke Datathon Winner Submission

## About
[Competition Details](https://dukeml.org/datathon/)

## What We Did
With the continuous outbreak of COVID-19 around the world, many health experts believe that the pandemic will not end in 2021, and the cease of the pandemic will likely involve a mix of efforts. The main objective of this report is to provide a comprehensive analysis and concrete data-driven recommendations on the devastating long-term economic implications of COVID-19. To define economic impact, we found three important economic metrics: GDP, unemployment rate, and stock market index. We used principal component analysis to aggregate these three metrics into a single score which we call Economic Develop Index, EDI. We then build a regression model to see which attributes are significant. Finally, we used time-series forecasting to predict how a country would perform in the foreseeable future. Our model shows increases in Population Density, Death Rate, New Deaths Per Million, Stringency Index, and Hospital Beds Per Thousand will decrease the overall EDI. The findings match our expectation because of the increase of death rate, stringency index, new death counts, and hospital beds indicate the increase of severity for COVID-19. Moreover, we used the United States to demonstrate how our findings could be used to predict the EDI economic indicator. The same approach could be applied to other countries/cities with appropriately processed data. Finally, we made recommendations to countries facing the devastating long-term economic implications of this pandemic.

Please find the **problem statemenet** of this competition [here](https://github.com/MTang0728/Duke_Datathon_2020/blob/master/Documents/2020_Duke_Datathon_Problem_Statement.pdf).

Fore more details of our findings, please refer to our **report** [here](https://github.com/MTang0728/Duke_Datathon_2020/blob/master/Documents/Datathon%20Final%20Report.pdf).

-- **Project Status: [Completed]**  <br />
-- **Competition Status: [Winner]**

## Methods Used
- Principle Component Analysis
- Multiple Linear Regression Analysis
- Time-Series Forecasting 

## Tools Used
- Dataiku for collaboration
- Pandas and NumPy for data inspection, cleaning, verification, imputation, and merging
- Scikit-learn for feature engineering and data transformation
- R for Multiple Linear Regression Analysis
- Prophet for time-Series forecasting 

## Team Members
Dean Huang: [@DeanHuang-Git](https://github.com/DeanHuang-Git)   <br />
Leon Zhang: [@leonz12345](https://github.com/leonz12345)   <br />
Michael Tang: [@MTang0728](https://github.com/MTang0728)   <br />
Tommy Tseng: [@TommyTseng1129](https://github.com/TommyTseng1129)   <br />
