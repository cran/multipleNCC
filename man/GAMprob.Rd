\name{GAMprob}
\alias{GAMprob}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Sampling probabilities estimated with generalized additive models.
}
\description{
Estimates sampling probabilities with generalized additive models. 
The weights included in the Cox-regressions (wpl) and which could be used for
other procedures are inverse sampling probabilities i.e. the inverse of these
probabilities. The probabilties are estimated for all subjects in the cohort.

\code{survtime}, \code{left.time} and continuous matching variables will be 
smoothed on while categorical matching variables are taken as factors.   
}
\usage{
GAMprob(survtime, samplestat, left.time = 0, match.var = 0, match.int = 0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{survtime}{
Follow-up time for all cohort subjects
}
  \item{samplestat}{
A vector containing sampling and status information: 0 represents non-sampled 
subjects in the cohort, 1: sampled controls, 2,3,... indicate different events. 
Cohort dimension. 
}

  \item{left.time}{
Entry time if the survival times are left-truncated. Cohort dimension. 
}
  
  \item{match.var}{
If the controls are matched to the cases (on other variables than time), 
match.var is the vector of matching variables. Cohort dimension.
}

  \item{match.int}{
A vector of length 2*number of matching variables. For caliper matching 
(matched on value pluss/minus epsilon) match.int should consist of 
c(-epsilon,epsilon). For exact matching match.int should consist of c(0,0). 
} 
}

\value{
A vector of cohort dimension of sampling probabilities. 
}
\references{
Stoer NC and Samuelsen SO (2013): Inverse probability weighting in nested case-control
studies with additional matching - a simulation study. Statistics in Medicine, 
32(30), 5328-5339.
}
\author{
Nathalie C. Stoer
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{wpl}}, \code{\link{coxph}}, \code{\link{Chenprob}}, \code{\link{GLMprob}}, 
\code{\link{KMprob}}, \code{\link{gam}}
}
\examples{
data(CVD_Accidents)
attach(CVD_Accidents)
GAMprob(agestop,samplestat,agestart)
GAMprob(agestop,samplestat,agestop,match.var=cbind(sex,bmi),match.int=c(0,0,-2,2))

## The function is currently defined as
function (survtime, samplestat, left.time = 0, match.var = 0, match.int = 0) 
{
    n.cohort = length(survtime)
    status = rep(0, n.cohort)
    status[samplestat > 1] = 1
    samplestat[samplestat > 1] = 1
    pgam = pGAM(status, survtime, samplestat, n.cohort, left.time)
    p = rep(1, n.cohort)
    p[status == 0] = pgam
    p
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
