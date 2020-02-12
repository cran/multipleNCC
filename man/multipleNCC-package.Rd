\name{multipleNCC-package}
\alias{multipleNCC-package}
\alias{multipleNCC}
\docType{package}
\title{
Weighted partial likelihood for nested case-control data
}
\description{
Fits Cox proportional hazards models with a weigthed partial likelihood. 
It handles competing risks (with one endpoint being a special situation). 
It uses cases and controls from other endpoints as additional controls for 
each endpoint. See \code{\link{wpl}} for help. 
 
Four weight estimators are implemented; Kaplan-Meier type \code{\link{KMprob}},
GAM (\code{\link{GAMprob}}), GLM (\code{\link{GLMprob}}) and local averaging
(\code{\link{Chenprob}})

}
\details{
\tabular{ll}{
Package: \tab multipleNCC\cr
Type: \tab Package\cr
Version: \tab 1.2-1\cr
Date: \tab 2016-04-16\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}

}
\author{
Nathalie C. Stoer

Maintainer: <nathalie.c.stoer@kreftregisteret.no>

}
\references{
Samuelsen, SO. (1997) A pseudolikelihood approach to analysis of nested case-control studies. \emph{Biometrika} \bold{84(2)}, 379-394 \cr
Samuelsen, SO., et al. (2007) Stratified case-cohort analysis of general cohort sampling designs. \emph{Scand J Stat} \bold{34(1)}, 103-119 \cr
Chen, KN. (2001) Generalized case-cohort sampling. \emph{J Roy Stat Soc Ser B} \bold{63(4)}, 791 - 809 \cr
Stoer NC and Samuelsen SO (2012): Comparison of estimators in nested case-control 
studies with multiple outcomes. Lifetime Data Analysis, 18(3), 261-283.
}

\keyword{ package }
\seealso{
\code{\link{wpl}}, \code{\link{coxph}}, \code{\link{Chenprob}}, \code{\link{GLMprob}}, \code{\link{GAMprob}}, \code{\link{KMprob}}
}
