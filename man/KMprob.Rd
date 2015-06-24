\name{KMprob}
\alias{KMprob}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Sampling probabilities estimated with a Kaplan-Meier type formula
}
\description{
Estimates sampling probabilities with a Kaplan-Meier type formula. 
The weights included in the Cox-regressions (wpl) and which could be used for
other procedures are inverse sampling probabilities i.e. the inverse of these
probabilities. The probabilties are estimated for all subjects in the cohort.
}
\usage{
KMprob(survtime, samplestat, m, left.time = 0, match.var = 0, match.int = 0)
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
  \item{m}{
Number of sampled controls. A scalar if equal number of controls for all case. 
If unequal number of controls per case: A vector of length number of cases. The 
vector must be in the same order as the cases in the samplestat-vector.
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
Samuelsen SO. A pseudolikelihood approach to analysis of nested case-control studies.
Biometrika, 84(2):379-394, 1997. \cr
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
\code{\link{GAMprob}}
}
\examples{
data(CVD_Accidents)
attach(CVD_Accidents)
KMprob(agestop,samplestat,m=1,agestart)
KMprob(agestop,samplestat,m=1,agestart,match.var=cbind(bmi),match.int=c(-2,2))

## The function is currently defined as
function (survtime, samplestat, m,  left.time = 0, match.var = 0, match.int = 0) 
{
    n.cohort = length(survtime)
    status = rep(0, n.cohort)
    status[samplestat > 1] = 1
    o = order(survtime)
    status = status[o]
    survtime = survtime[o]
    if (length(left.time) == n.cohort) {
        left.time = left.time[o]
    }
    if (length(match.var) == n.cohort) {
        match.var = match.var[o]
    }
    if (length(match.var) > n.cohort) {
        match.var = match.var[o, ]
    }
    tilbakestill = (1:n.cohort)[o]
    p = pKM(status, survtime, m, n.cohort, left.time, match.var, 
        match.int)
    p[status > 0] = 1
    p = p[order(tilbakestill)]
    p
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
