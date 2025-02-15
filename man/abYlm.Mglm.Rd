% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/abYlm.Mglm.R
\name{abYlm.Mglm}
\alias{abYlm.Mglm}
\title{Adaptive Bootstrap Test in Mediation Analysis with Linear Models or Generalized Linear Models}
\usage{
abYlm.Mglm(
  S,
  M,
  Y,
  X = NULL,
  covariates_cfder = NULL,
  M.family = stats::gaussian(),
  s = 1,
  s_star = 0,
  B = 199,
  lambda = 2
)
}
\arguments{
\item{S}{an n-by-1 vector for exposure.}

\item{M}{an n-by-1 vector for mediator.}

\item{Y}{an n-by-1 vector for outcome.}

\item{X}{an n-by-p matrix for p confounders. Do not include intercept in matrix X. In the absence of confounders, matrix is not required to be specified.}

\item{covariates_cfder}{a vector of p confounders to adjust mediation effects, and default is zero (or void). The length of this vector is p, the same as the column dimension of X.}

\item{M.family}{the error distribution and link function for the mediator model. The default family is \code{gaussian()}.}

\item{s}{exposure level with default set at 1.}

\item{s_star}{baseline exposure level with default set at 0.}

\item{B}{the number of bootstrap samples with default set at 199.}

\item{lambda}{the tuning parameter used in the adaptive bootstrap procedure with default set at 2.}
}
\value{
NIE refers to natural indirect effect, which is the estimated when a change of exposure S occurs from s_star to s.

p_value_NIE refers to the AB p value for NIE.

NDE refers to natural direct effect, which is estimated when exposure S changes from s_star to s.

p_value_NDE is the p value for NDE.

NTE is the estimated natural total effect when exposure S changes from s_star to s.

p_value_NTE is the p value for NTE.
}
\description{
\code{abYlm.Mglm} conducts an adaptive bootstrap test in a mediation analysis in which mediator M is modeled by a generalized linear model (GLM) and outcome Y is modeled by a linear model (LM). The family of the generalized linear model is specified according to \code{M.family}.
}
\examples{
\donttest{
  ## Load libraries
  library(abima)

  set.seed(2)

  ## Set up parameters
  M.family <- poisson()

  simulation <- function(alpha_S = 0, beta_M = 0) {
    data <- generate_all_data(
      n = 500,
      alpha_S = alpha_S,
      beta_M = beta_M,
      M.family = M.family
    )
    S <- data$S
    M <- data$M
    Y <- data$Y
    X <- data$X

    out <- abYlm.Mglm(S,
                      M,
                      Y,
                      X,
                      M.family = M.family,
                      lambda = 2,
                      B = 199)
    out
  }


  simulation(1 / 8, 1 / 8)

  simulation(0, 0)

}
}
\references{
He, Y., Song, P. X. K., and Xu, G. (2023), “Adaptive bootstrap tests for composite null hypotheses in the mediation pathway analysis,” Journal of the Royal Statistical Society Series B: Statistical Methodology, qkad129. \url{doi:10.1093/jrsssb/qkad129}.
}
