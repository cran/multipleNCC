\name{PoststratVar}
\alias{PoststratVar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Modelbased variance using Chen-weights 
}

\description{
  For internal use only.
}
%\usage{
%  PoststratVar = function(fit,status,samplestat,survtime,left.time,i,m,no.intervals)  {
%}
%- maybe also 'usage' for other objects documented here.
%\arguments{
  %  \item{survtime}{
    %    Follow-up time for all cohort subjects
    %  }
  %  \item{samplestat}{
    %    A vector containing sampling and status information: 0 represents non-sampled 
    %    subjects in the cohort, 1: sampled controls, 2,3,... indicate different events. 
    %    Cohort dimension. 
    %  }
  %  
  %  \item{left.time}{
    %    Entry time if the survival times are left-truncated. Cohort dimension. 
    %  }
  %  \item{match.var}{
    %    If the controls are matched to the cases (on other variables than time), 
    %    match.var is the vector of matching variables. Cohort dimension.
    %  }
  %  \item{match.int}{
    %    A vector of length 2*number of matching variables. For caliper matching 
    %    (matched on value pluss/minus epsilon) match.int should consist of 
    %    c(-epsilon,epsilon). For exact matching match.int should consist of c(0,0). 
    %  }
%}

%\value{
  %  ???
  %}

%\references{
  %  Stoer NC and Samuelsen SO (2012): Comparison of estimators in nested case-control 
  %  studies with multiple outcomes. Lifetime Data Analysis, 18(3), 261-283.
  %}
\author{
  Nathalie C. Stoer and Sven Ove Samuelsen
}

%% ~Make other sections like Warning with \section{Warning }{....} ~
  
  %  \seealso{
    %    \code{\link{wpl}}, \code{\link{coxph}}, \code{\link{Chenprob}}, \code{\link{GAMprob}} 
    %    \code{\link{KMprob}}
    %  }
%\examples{
  %  data(CVD_Accidents)
  %  attach(CVD_Accidents)
  %  GLMprob(agestop,samplestat,agestart)
  %  GLMprob(agestop,samplestat,agestart,match.var=cbind(sex,bmi),match.int=c(0,0,-2,2))
  
  %  ## The function is currently defined as
  %  function (survtime, samplestat, left.time = 0, match.var = 0, 
               %            match.int = 0) 
    %  {
      %    n.cohort = length(survtime)
      %    status = rep(0, n.cohort)
      %    status[samplestat > 1] = 1
      %    samplestat[samplestat > 1] = 1
      %    pglm = pGLM(status, survtime, samplestat, n.cohort, left.time, 
                       %                match.var, match.int)
      %    p = rep(1, n.cohort)
      %    p[status == 0] = pglm
      %    p
      %  }
%}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
