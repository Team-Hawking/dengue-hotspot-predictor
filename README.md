# Dengue Hotspot Predictor

In the recent years the world has witnessed a dramatic surge of a mosquito-borne viral disease commonly known as - Dengue. According to the World Health Organization (WHO) an estimated 500,000 people are hospitalized each year due to this disease. Today, 40% of the world population is at risk of being affected by Dengue. The prime carrier of this disease are the female mosquito of the "Aedes aegypti" species. But not all corners of the world are equally likely to be affected by Dengue nor is everyone at similar level of risk. Using NASA satellite data points coupled with NASA datasets on soil, water, temperature, air quality and density of population of a particular area, applying machine learning models, we present a predictive analytics tool which will predict the next hotspot of Dengue and help us save lives of millions of people, by taking preventive action or supplying adequate medical resources before it's too late.

## Metrics

Metrics are the factors which can help us generate a predictive value for the breeding spot of Aedes mosquito and the outbreak of Dengue as whole. The key metrices we are considering:  *Temperature*, *Precipitation*, *Relative Humidity*, *Vegetation*, *Railfall*, *Urbanization*, *Population density*

### Temperature

 - Most common throughout tropical and sub-tropical region

 - Optimal temperatures for development, longevity, and fecundity are between 22°C and 32°C ([Beserra et al. 2009](https://onlinelibrary.wiley.com/doi/full/10.1111/jvec.12187#jvec12187-bib-0004))
 
 - Temperature 10°C and below limits the growth of larvae and adult survival

 - Higher temperature are favourable for growth of Aedes. Cnversely temperature higher than 35°C impedes the development of Aedes mosquito.
 
 - Projected temperature elevation of 2°C by the end of the 21st century (cross check sources) [(Donalísio and Glasser 2002)](https://onlinelibrary.wiley.com/doi/full/10.1111/jvec.12187#jvec12187-bib-0015)


- In Taiwan, [study](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5759216/) shows a 13.8°C is a critical temperature to limit the occurance of *Aedes*


### Vegetation 


 - Normalized difference vegetation index (NDVI) is provided by NASA MODIS satellite NDVI database
 
 - This [paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6163306/) uses two greeness indexs to draw association with Dengue in Taiwan - Normalized difference vegetation index (NDVI) and enchanced vegetation index (EVI).
 
 - Sounthern Taiwan's ecology is conducive to breeding "Aedes". Study the ecological structure of that region.

  -  NASA’s Moderate Resolution Imaging Spectroradiometer (MODIS) was used for collecting NDVI (a greeness index).
 
  - NDVI data are generated every 16 days at 250 m spatial resolution

  - 





















### Statistical tools

 - **95% Confidence Interval of (x,y)**: If we take repeated samples, then 95% of the sample interval produced will contain the true (population) statistic. Example: we take repeated sampling of mean temperature of a region and concluded with 95% confidence that the interval was (30,40). It means 95% of the times the interval (30,40) contained the actual (population) mean that we are trying to predict. So, we are 95% confident with our results. 
   
    Mathematically: ave +- z * se
    where ave = average/mean, z = z-score, se = standard error
  
   - [Calculating confidence interval from a normal distribution with R](https://www.cyclismo.org/tutorial/R/confidence.html)

   - [How to make a 95% confidence interval in R - Normal Distribution](https://www.youtube.com/watch?v=28aluI4wsMM)


 - **Central Limit Theorem**: If we take repeated samples from a population (not necessarily normally distributed) then the sample satistic (mean, standard deviation) approximates a normal distribution as n increases (n=sample size). Also standard deviation decreases.

   - [Central Limit Theorem - Khan Academy](https://www.khanacademy.org/math/ap-statistics/sampling-distribution-ap/sampling-distribution-mean/v/central-limit-theorem) 
























### Resources

 - [NASA Open Data Portal](https://data.nasa.gov/)
 - [NASA Earth Data](https://worldview.earthdata.nasa.gov/)
 - [NASA Earth Observatory](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3510154/)
 - [NASA Vegetation Data](https://data.nasa.gov/browse?q=vegetation+)
 - [Impact of rainfall on Aedes aegpyti populations](https://www.researchgate.net/publication/321180537_Impact_of_rainfall_on_Aedes_aegypti_populations)
 - [Periods of high dengue transmission defined by rainfall do not impact efficacy of dengue vaccine in regions of endemic disease](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0207878)
 - [Forecast of Dengue Incidence Using Temperature and Rainfall](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3510154/)


