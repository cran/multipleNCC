\name{Chenprob}
\alias{Chenprob}

\title{
Sampling probabilities estimated with local averaging.
}
\description{
Estimates sampling probabilities with local averaging (Chen, 2001). 
The weights included in the Cox-regressions (wpl) and which could be used for
other procedures are inverse sampling probabilities i.e. the inverse of these
probabilities. The probabilties are estimated for all subjects in the cohort.
}
\usage{
Chenprob(survtime, samplestat, no.intervals = 10, left.time = 0, 
no.intervals.left = c(3,4))
}

\arguments{
  \item{survtime}{
Follow-up time for all cohort subjects
}
  \item{samplestat}{
A vector containing sampling and status information: 0 represents non-sampled 
subjects in the cohort, 1: sampled controls, 2,3,... indicate different events. 
Cohort dimension. 
}

  \item{no.intervals}{
Number of intervals for censoring times for Chen-weights with only right 
censoring
}
  \item{left.time}{
Entry time if the survival times are left-truncated. Cohort dimension. 
}
  \item{no.intervals.left}{
Number of intervals for Chen-weights with left-truncation. A vector on the form 
[number of intervals for left truncated time, number of intervals for survival time].
}
}

\value{
A vector of cohort dimension of sampling probabilities. 
}
\references{
Chen KN (2001) Generalized case-cohort sampling. J Roy Stat Soc Ser B 63(4):791-809 \cr
Stoer NC and Samuelsen SO (2012): Comparison of estimators in nested case-control 
studies with multiple outcomes. Lifetime Data Analysis, 18(3), 261-283.
}
\author{
Nathalie C. Stoer
}


\seealso{
\code{\link{wpl}}, \code{\link[survival]{coxph}}, \code{\link{GAMprob}}, \code{\link{GLMprob}}, 
\code{\link{KMprob}}
}

\examples{   

data(CVD_Accidents)
attach(CVD_Accidents)
Chenprob(agestop,samplestat,left.time=agestart)
Chenprob(agestop,samplestat,left.time=agestart,no.intervals.left=c(3,4))

function (survtime, samplestat, no.intervals, left.time = 0, no.intervals.left = 0) 
{
    n.cohort = length(survtime)
    status = rep(0, n.cohort)
    status[samplestat > 1] = 1
    samplestat[samplestat > 1] = 1
    ind.no = 1:length(samplestat)
    p = pChen(status, survtime, samplestat, ind.no, n.cohort, 
        no.intervals, left.time, no.intervals.left)
    p[status == 1] = 1
    p
  }
}



