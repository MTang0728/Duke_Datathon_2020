library(ggplot2)
library(grid)
library(gridExtra)
library(rms)

EDI <- read.csv("/Users/lin-chuntseng/Desktop/complete_dataset.csv", header= T)
summary(EDI)
str(EDI)

#### Mean-center the continuous variables
EDI$population_density_cent = EDI$population_density - mean(EDI$population_density)
EDI$Birthrate_cent = EDI$Birthrate - mean(EDI$Birthrate)
EDI$Deathrate_cent = EDI$Deathrate - mean(EDI$Deathrate)
EDI$Industry_cent = EDI$Industry - mean(EDI$Industry)
EDI$Service_cent = EDI$Service - mean(EDI$Service)
EDI$Agriculture_cent = EDI$Agriculture - mean(EDI$Agriculture)
EDI$hospital_beds_per_thousand_cent = EDI$hospital_beds_per_thousand - mean(EDI$hospital_beds_per_thousand)

# Convert population density to nominal variable

EDI$population_cent_fac <- EDI$population_density_cent
EDI$population_cent_fac[EDI$population_cent_fac < 0]<-0
EDI$population_cent_fac[EDI$population_cent_fac > 0 & EDI$population_cent_fac < 200 ]<-1
EDI$population_cent_fac[EDI$population_cent_fac > 200]<-2

EDI$population_cent_fac <- as.factor(EDI$population_cent_fac)

# Convert hospital_beds_per_thousands to nominal variable

EDI$hospital_beds_per_thousand_cent_fac <- EDI$hospital_beds_per_thousand_cent
EDI$hospital_beds_per_thousand_cent_fac[EDI$hospital_beds_per_thousand_cent_fac < 0]<-0
EDI$hospital_beds_per_thousand_cent_fac[EDI$hospital_beds_per_thousand_cent_fac > 0 & EDI$hospital_beds_per_thousand_cent_fac < 6]<-1
EDI$hospital_beds_per_thousand_cent_fac[EDI$hospital_beds_per_thousand_cent_fac > 6]<-2

EDI$hospital_beds_per_thousand_cent_fac <- as.factor(EDI$hospital_beds_per_thousand_cent_fac)


# log the response
EDI$response_LOG <- log(EDI$response)
# Check normality for response

hist(EDI$response)
hist(log(EDI$response))

qqnorm(EDI$response, pch = 1, frame = FALSE)
qqline(EDI$response, col = "steelblue", lwd = 2)

###### EDA #######
###-------------------------------- numerical -------------------------------###

# 1. Slight negative association between retail percentage change and EDI change
ggplot(EDI,aes(x=retail_and_recreation_percent_change_from_baseline, y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="Retail Percentage Change vs EDI Change (log)",
       x="Retail Percentage Change",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))


# 2. Slight negative association between grocery & pharmacy percentage change and EDI change
ggplot(EDI,aes(x=grocery_and_pharmacy_percent_change_from_baseline, y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="Grocery & Pharmacy Percentage Change vs EDI Change (log)",
       x="Grocery & Pharmacy Percentage Change",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))

# 3. Slight positive association between parks percentage change and EDI change
ggplot(EDI,aes(x=parks_percent_change_from_baseline, y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="Parks Percentage Change vs EDI Change (log)",
       x="Parks Percentage Change",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))

# 4. Slight negative association between transit stations percentage change and EDI change
ggplot(EDI,aes(x=transit_stations_percent_change_from_baseline , y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="Transit Stations Percentage Change vs EDI Change (log)",
       x="Transit Stations Percentage Change",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))

# 5. Slight negative association between transit_stations percentage change and EDI change
ggplot(EDI,aes(x=transit_stations_percent_change_from_baseline , y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="Transit Stations Percentage Change vs EDI Change (log)",
       x="Transit Stations Percentage Change",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))

# 6. Slight positive association between residential percentage change and EDI change
ggplot(EDI,aes(x=residential_percent_change_from_baseline , y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="Residential Percentage Change vs EDI Change (log)",
       x="Residential Percentage Change",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))

# 7. No clear association between birthrate centered and EDI change
ggplot(EDI,aes(x=Birthrate_cent , y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="Birthrate Centered vs EDI Change (log)",
       x="Birthrate Centered",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))

# 8. Negative association between deathrate centered and EDI change
ggplot(EDI,aes(x=Deathrate_cent , y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="Deathrate Centered vs EDI Change (log)",
       x="Deathrate Centered",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))

# 9. Slight positive association between agriculture centered and EDI change
ggplot(EDI,aes(x=Agriculture_cent , y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="Agriculture Centered vs EDI Change (log)",
       x="Agriculture Centered",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))

# 10. Slight positive association between agriculture centered and EDI change
ggplot(EDI,aes(x=Agriculture_cent , y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="Agriculture Centered vs EDI Change (log)",
       x="Agriculture Centered",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))

# 11. Slight positive association between industry centered and EDI change
ggplot(EDI,aes(x=Industry_cent , y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="Industry Centered vs EDI Change (log)",
       x="Industry Centered",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))

# 12. No clear association between service centered and EDI change
ggplot(EDI,aes(x=Service_cent , y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="Service Centered vs EDI Change (log)",
       x="Service Centered",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))

# 13. Positive association between new_cases_per_million and EDI change
ggplot(EDI,aes(x=new_cases_per_million , y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="New_cases_per_million vs EDI Change (log)",
       x="New_cases_per_million",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))

# 14. Positive association between new_deaths_per_million and EDI change
ggplot(EDI,aes(x=new_deaths_per_million , y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="New_deaths_per_million vs EDI Change (log)",
       x="New_deaths_per_million",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))

# 15. Positive association between new_deaths_per_million and EDI change
ggplot(EDI,aes(x=new_deaths_per_million , y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="New_deaths_per_million vs EDI Change (log)",
       x="New_deaths_per_million",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))

# 16. Positive association between stringency_index and EDI change
ggplot(EDI,aes(x=stringency_index , y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="Stringency_index vs EDI Change (log)",
       x="Stringency_index",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))

# 17. Negative association between hospital_beds_per_thousand and EDI change
ggplot(EDI,aes(x=hospital_beds_per_thousand_cent , y=response_LOG)) +
  geom_point() + #coord_flip()# +
  scale_fill_brewer(palette="Blues") +
  labs(title="Hospital_beds_per_thousand vs EDI Change (log)",
       x="Hospital_beds_per_thousand",y='EDI Change (log)') + 
  geom_smooth(col="red3", method="lm") +
  theme_classic() + theme(legend.position="none")+
  theme(plot.title = element_text(hjust = 0.5))

 
###-------------------------------- categorical------------------------------###
# 18. Slight association between centered population density and EDI change


ggplot(EDI,aes(x=population_cent_fac, y=response_LOG, fill=population_cent_fac)) +
  geom_boxplot() + #coord_flip() +
  scale_fill_brewer(palette="Reds") +
  labs(title="Centered Population Density vs EDI Change (log)",
       x="Centered Population Density",y="EDI Change (log)") +
  theme_classic() + theme(legend.position="none")


# 19. There's a difference among levels of centered hospital beds


ggplot(EDI,aes(x=hospital_beds_per_thousand_cent_fac, y=response_LOG, fill=hospital_beds_per_thousand_cent_fac)) +
  geom_boxplot() + #coord_flip() +
  scale_fill_brewer(palette="Reds") +
  labs(title="Centered Hospital Beds per Thousand vs EDI Change (log)",
       x="Centered Hospital Beds per Thousand",y="EDI Change (log)") +
  theme_classic() + theme(legend.position="none")

str(EDI)

#################### Backward Model Selection
n <- nrow(EDI)
NullModel <- lm(response_LOG~1, data = EDI)
FullModel <- lm(response_LOG ~ retail_and_recreation_percent_change_from_baseline + grocery_and_pharmacy_percent_change_from_baseline +
                  parks_percent_change_from_baseline + transit_stations_percent_change_from_baseline +
                  workplaces_percent_change_from_baseline + residential_percent_change_from_baseline +
                  population_cent_fac + hospital_beds_per_thousand_cent + Agriculture_cent + Service_cent +
                  Industry_cent + Deathrate_cent + Birthrate_cent + stringency_index +
                  new_deaths_per_million + new_cases_per_million, data = EDI)

#model_back <- step(FullModel, direction="backward", trace=0, k = n )

model_step <- step(NullModel, scope=formula(FullModel), direction="both", trace=0 , k = log(n))

summary(model_step)

############## Check Assumption ##########

## 1. linearity (Check hospital_beds_per_thousand_cent vs response)
ggplot(EDI,aes(x=hospital_beds_per_thousand_cent ,y=model_step$residual)) + geom_point(alpha=.7) + 
  geom_hline(yintercept=0, col='red3') + theme_classic() +
  labs(title = 'Residuals vs hospital_beds_per_thousand_cent', x='hospital_beds_per_thousand_cent',y="Residuals")

## 2. linearity (Check Birthrate_cent vs response)
ggplot(EDI,aes(x=Birthrate_cent ,y=model_step$residual)) + geom_point(alpha=.7) + 
  geom_hline(yintercept=0, col='red3') + theme_classic() +
  labs(title = 'Residuals vs Birthrate_cent', x='Birthrate_cent',y="Residuals")

## 3. linearity (Check Agriculture_cent vs response)
ggplot(EDI,aes(x=Agriculture_cent ,y=model_step$residual)) + geom_point(alpha=.7) + 
  geom_hline(yintercept=0, col='red3') + theme_classic() +
  labs(title = 'Residuals vs Agriculture_cent', x='Agriculture_cent',y="Residuals")

## 4. linearity (Check Service_cent vs response)
ggplot(EDI,aes(x=Service_cent ,y=model_step$residual)) + geom_point(alpha=.7) + 
  geom_hline(yintercept=0, col='red3') + theme_classic() +
  labs(title = 'Residuals vs Service_cent', x='Service_cent',y="Residuals")

## 5. linearity (Check Deathrate_cent vs response)
ggplot(EDI,aes(x=Deathrate_cent ,y=model_step$residual)) + geom_point(alpha=.7) + 
  geom_hline(yintercept=0, col='red3') + theme_classic() +
  labs(title = 'Residuals vs Deathrate_cent', x='Deathrate_cent',y="Residuals")

## 6. linearity (Check Industry_cent vs response)
ggplot(EDI,aes(x=Industry_cent ,y=model_step$residual)) + geom_point(alpha=.7) + 
  geom_hline(yintercept=0, col='red3') + theme_classic() +
  labs(title = 'Residuals vs Industry_cent', x='Industry_cent',y="Residuals")

## 7. linearity (Check Retail_and_recreation_percent_change_from_baseline vs response)
ggplot(EDI,aes(x=retail_and_recreation_percent_change_from_baseline ,y=model_step$residual)) + geom_point(alpha=.7) + 
  geom_hline(yintercept=0, col='red3') + theme_classic() +
  labs(title = 'Residuals vs Retail & Recreation percent change', x='retail_and_recreation_percent_change_from_baseline',y="Residuals")

## 8. linearity (Check new_cases_per_million vs response)
ggplot(EDI,aes(x=new_cases_per_million ,y=model_step$residual)) + geom_point(alpha=.7) + 
  geom_hline(yintercept=0, col='red3') + theme_classic() +
  labs(title = 'Residuals vs New cases per million', x='New cases per million',y="Residuals")

## 9. linearity (Check stringency_index vs response)
ggplot(EDI,aes(x=stringency_index ,y=model_step$residual)) + geom_point(alpha=.7) + 
  geom_hline(yintercept=0, col='red3') + theme_classic() +
  labs(title = 'Residuals vs Stringency_index', x='stringency_index',y="Residuals")

## 10. linearity (Check new_deaths_per_million  vs response)
ggplot(EDI,aes(x=new_deaths_per_million  ,y=model_step$residual)) + geom_point(alpha=.7) + 
  geom_hline(yintercept=0, col='red3') + theme_classic() +
  labs(title = 'Residuals vs New deaths per million ', x='New deaths per million ',y="Residuals")


# Independence and Equal variance (Acceptable)
plot(model_step, which=1, col=c('blue4'))

# Normality (Acceptable)
plot(model_step, which=2, col=c('blue4'))



# Do VIF to check multi-colinearity
vif(model_step)


# Make prediction based on prophet model
newdata <- data.frame(hospital_beds_per_thousand_cent = -1.33111, Birthrate_cent = 0.33222, population_cent_fac = '0', 
                      Agriculture_cent = -0.02933333, Service_cent = 0.1338889, Deathrate_cent = -1.734444, Industry_cent = -0.1034444, 
                      retail_and_recreation_percent_change_from_baseline = 84.6382133467667, new_cases_per_million = 1219.38844323954, 
                      stringency_index = 52.3787838281501, new_deaths_per_million = -8.65071573037781)
pred <- predict(model_step, newdata, interval = "prediction")
pred