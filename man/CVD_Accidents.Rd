\name{CVD_Accidents}
\alias{CVD_Accidents}
\docType{data}
\title{
Causes of death in three counties in Norway in 1974-2000
}
\description{
Causes of death from 1974-2000 for all men and women participating in a 
cardiovascular health screening in 1974-1978 in three counties in Norway.
All variables are know for all cohort members and it is thus a synthetic 
nested case-control. One control per case is sampled for cardiovascular disease cases and
subjects who died from alcohol abuse, liver disease, and accidents and violence. 
The controls are matched sex and BMI plus/minus 2 in addition to being alive at
the time the case died.                                 
}
\usage{data(CVD_Accidents)}
\format{
  A data frame with 3933 observations on the following 23 variables.
  \describe{
    \item{\code{agestart}}{Age at health survey, inclusion time}
    \item{\code{agestop}}{Age at censoring}
    \item{\code{dead}}{Indicator for death from any cause (0=censored, 1=dead)}
    \item{\code{dead1}}{Indicator for cancer death (0=censored or dead from 
    other cause than cancer, 1=dead from cancer)}
    \item{\code{dead2}}{Indicator for death from cardiovascular disease, 
    including sudden death (0=censored or dead from other causes than 
    cardiovascular diseas, 1=dead from cardiovascular diseas)}
    \item{\code{dead3}}{Indicator for death from other medical causes 
    (0=censored or dead from cancer, cardiovascular diseas, alcohol abuse, 
    liver disease, violence or accidents, 1=dead from other medical causes)}
    \item{\code{dead4}}{Indicator for death from alcohol abuse, liver disease,
    violence and accidents (0=censored or death from other medical causes than 
    alcohol abuse, liver disase, violence or accidents, 1=death from alcohol
    abuse, liver disease, violence and accidents)}
    \item{\code{sex}}{sex (1=male, 2=female)}
    \item{\code{county}}{county in Norway (5=Oppland, 14=Sogn og Fjordane, 
    20=Finnmark)}
    \item{\code{sbp}}{Systolic blood pressure at health screening}
    \item{\code{bmi}}{Body mass index at helth screening}
    \item{\code{smkstart}}{Age started smoking}
    \item{\code{smkgr}}{Smoking group (1=never smoked, 2=former smoker, 3=1-9 
    cigaretts per day, 4=10-19 cigaretts per day, 5=20+ cigaretts per day, 
    6=pipe or cigar)}
    \item{\code{smoking3gr}}{Smoking 3 groups (1=never smoked, 2=former smoker, 
    3=smoker)}
    \item{\code{samplestat}}{Indicator for sampling and events (0=non-sampled subjects
    in the cohort, 1=sampled controls, 2=dead from cardiovascular disease, 3=dead 
    from alcohol abuse, liver disease, violence or accidents}
    \item{\code{dead24}}{Indicator for death from either cardiovascular disease
    or alcohol abuse, liver disease, violence or accidents (0=censored or dead 
    from other causes than cardiovascular disease, alcohol abuse, liver disease,
    violence or accidents, 1=death from cardiovascular disease, alcohol abuse, 
    liver disease,violence or accidents)}
  }
}
\source{
http://folk.uio.no/borgan/abg-2008/data/data.html
}

