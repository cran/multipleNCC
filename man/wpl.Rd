\name{wpl}
\alias{wpl}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
 Weighted partial likelihood for multiple endpoints
}
\description{
This package fits Cox proportional hazard models for nested case-control data 
with a weigthed partial likelihood. It breaks the matching between cases and 
controls and this enables the controls to be reused for other endpoints. It 
handles competing risks (with simple survival data with one endpoint being a
special case) and cases and controls from one endpoint are being used as 
additional controls for another endpoint. There are four choices of weights; 
Samuelsen (1997) \code{KM}, estimated with logistic regression (\code{glm}), logistic 
genralized additive model (\code{gam}) and local averaging (Chen, 2001) 
\code{(Chen)}. \code{KM}, \code{glm} and \code{gam} handle additional matching,
while all of them handle left-truncation. 
 
 
}
\usage{  
wpl(x, data, samplestat, m = 1, weight.method = "KM", no.intervals = 10, 
variance = "robust", no.intervals.left = c(3, 4), match.var = 0, match.int = 0)
%wpl(x,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
A formula object, with the response on the left of a ~ operator, and the terms 
on the right. The response must be a survival object as returned by the Surv 
function. The status variable going in to Surv is not actually used but should 
have 1 for cases and zero for controls and non-sampled subjetcs. All elements 
going into the formula should have lenght equal to the number of subjects in the
cohort. Generally some of the covariates are not known for all subjects in the 
cohort (due to the NCC-sampling). The covariate values for those subjects should 
just be given some value e.g. 0 (not NA). Which value choosen is not important 
as the values are never used. 
}

  \item{data}{
data.frame in which to interpret the variables named in the formula.
}
  \item{samplestat}{
A vector containing sampling and status information: 0 represents non-sampled 
subjects in the cohort, 1: sampled controls, 2,3,... indicate different events. 
Cohort dimension. 
}
  \item{m}{
Number of sampled controls. A scalar if equal number of controls for all case. 
If unequal number of controls per case: A vector of length number of cases. The 
vector must be in the same order as the cases in the samplestat-vector.
}
  \item{weight.method}{
Which weigths should be used, possibilities \code{"KM"}, \code{"gam"}, 
\code{"glm"}, \code{"Chen"}
}
  \item{no.intervals}{
Number of intervals for censoring times for Chen-weights with only right 
censoring
}
  \item{variance}{
Default is robust variances, but pseudovariance (only for KM-weights), 
\code{"Modelbased"} and variance based on stratified case-cohort 
\code{"Poststrat"} (only for Chen-weights) is also possible. 
\code{Pseudo}-variance and \code{Strat}-variance will appear under 
"est.se(coef)" in the output.
}
  \item{no.intervals.left}{
Number of intervals for Chen-weights with left-truncation. A vector on the form 
[number of intervals for left truncated time, number of intervals for survival time].
}

  \item{match.var}{
If the controls are matched to the cases (on other variables than time), 
match.var is the vector or matrix of matching variables. Cohort dimension.
}

  \item{match.int}{
A vector of length 2*number of matching variables. For caliper matching 
(matched on value pluss/minus epsilon) match.int should consist of 
c(-epsilon,epsilon). For exact matching match.int should consist of c(0,0). 
} 

\item{\dots}{
Other arguments
}
}

\value{
An object of class wpl representing the fit. Objects of this class have methods 
for the functions \code{print} and \code{summary}.
The wpl-object consits of the following elemetns which is repeated for each 
endpoint. Unfortunately only the values for the first endpoint can be reached 
by $-operator(ex. fit$coefficients only return the coefficients for the first 
endpoint)
%%  If it is a LIST, use
  \item{coefficients}{The vector of coefficients.}
  \item{var}{Robust or estimated variance}
  \item{weighted.loglik}{A vector of length 2 containing the log-likelihood with the 
  initial values and with the final values of the coefficients.}
  \item{iter}{Number of iterations used}
  \item{linear.predictors}{The vector of linear predictors, one per subject. 
  Note that this vector has been centered, see predict.coxph for more details}
  \item{residuals}{The martingale residuals}
  \item{means}{Vector of column means of the X matrix}
  \item{method}{The computation method used}
  \item{n}{The number of observations used in the fit}
  \item{nevent}{The number of events (usually deaths) used in the fit}
  \item{naive.var}{naive.var}
  \item{rscore}{The robust log-rank statistic}
  \item{wald.test}{The Wald test of whether the final coefficients differ from 
  the initial values}
  \item{y}{Inclusion time and event/censoring time}
  \item{weights}{The vector of weights, which is inverse sampling probabilities}
  \item{est.var}{Estimated variance (T) or robust variance (F)}
  
 .\cr
 .\cr
 .\cr
}
\references{
Samuelsen SO. A pseudolikelihood approach to analysis of nested case-control studies.
Biometrika, 84(2):379-394, 1997. \cr
Stoer NC and Samuelsen SO (2012): Comparison of estimators in nested case-control 
studies with multiple outcomes. Lifetime Data Analysis, 18(3), 261-283.
}
\author{
Nathalie C. Stoer
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{coxph}}, \code{\link{Chenprob}}, \code{\link{GLMprob}}, \code{\link{GAMprob}}
}

\examples{
data(CVD_Accidents)
wpl(Surv(agestart,agestop,dead24)~factor(smoking3gr)+bmi+factor(sex),data=CVD_Accidents,
samplestat=CVD_Accidents$samplestat,weight.method="gam")

wpl(Surv(agestart,agestop,dead24)~factor(smoking3gr)+bmi+factor(sex),data=CVD_Accidents,
samplestat=CVD_Accidents$samplestat,m=1,match.var=cbind(CVD_Accidents$sex,
CVD_Accidents$bmi),match.int=c(0,0,-2,2),weight.method="glm")


## The function is currently defined as
function (x, data, samplestat, m = 1, weight.method = "KM", no.intervals = 10, 
    variance = "robust", no.intervals.left = c(3, 4), match.var = 0, 
    match.int = 0) 
{
    UseMethod("wpl")
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.

