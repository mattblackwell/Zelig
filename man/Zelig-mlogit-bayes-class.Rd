% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model-mlogit-bayes.R
\docType{class}
\name{Zelig-mlogit-bayes-class}
\alias{Zelig-mlogit-bayes-class}
\alias{zmlogitbayes}
\title{Bayesian Multinomial Logistic Regression}
\arguments{
\item{formula}{a symbolic representation of the model to be
estimated, in the form \code{y ~ x1 + x2}, where \code{y} is the
dependent variable and \code{x1} and \code{x2} are the explanatory
variables, and \code{y}, \code{x1}, and \code{x2} are contained in the
same dataset. (You may include more than two explanatory variables,
of course.) The \code{+} symbol means ``inclusion'' not
``addition.'' You may also include interaction terms and main
effects in the form \code{x1*x2} without computing them in prior
steps; \code{I(x1*x2)} to include only the interaction term and
exclude the main effects; and quadratic terms in the form
\code{I(x1^2)}.}

\item{model}{the name of a statistical model to estimate.
For a list of other supported models and their documentation see:
\url{http://docs.zeligproject.org/articles/}.}

\item{data}{the name of a data frame containing the variables
referenced in the formula or a list of multiply imputed data frames
each having the same variable names and row numbers (created by
\code{Amelia} or \code{\link{to_zelig_mi}}).}

\item{...}{additional arguments passed to \code{zelig},
relevant for the model to be estimated.}

\item{by}{a factor variable contained in \code{data}. If supplied,
\code{zelig} will subset
the data frame based on the levels in the \code{by} variable, and
estimate a model for each subset. This can save a considerable amount of
effort. You may also use \code{by} to run models using MatchIt
subclasses.}

\item{cite}{If is set to 'TRUE' (default), the model citation will be printed
to the console.}
}
\value{
Depending on the class of model selected, \code{zelig} will return
  an object with elements including \code{coefficients}, \code{residuals},
  and \code{formula} which may be summarized using
  \code{summary(z.out)} or individually extracted using, for example,
  \code{coef(z.out)}. See
  \url{http://docs.zeligproject.org/articles/getters.html} for a list of
  functions to extract model components. You can also extract whole fitted
  model objects using \code{\link{from_zelig_model}}.
}
\description{
Bayesian Multinomial Logistic Regression
}
\details{
zelig() accepts the following arguments for mlogit.bayes:
\itemize{
    \item \code{baseline}: either a character string or numeric value (equal to
    one of the observed values in the dependent variable) specifying a baseline category.
    The default value is NA which sets the baseline to the first alphabetical or
    numerical unique value of the dependent variable.
}
Additional parameters avaialable to this model include:
\itemize{
  \item \code{weights}: vector of weight values or a name of a variable in the dataset
  by which to weight the model. For more information see:
  \url{http://docs.zeligproject.org/articles/weights.html}.
  \item \code{burnin}: number of the initial MCMC iterations to be discarded (defaults to 1,000).
  \item \code{mcmc}: number of the MCMC iterations after burnin (defaults to 10,000).
  \item \code{mcmc.method}: either "IndMH" or "slice", specifying whether to use Metropolis Algorithm
  or slice sampler. The default value is IndMH.
  \item \code{thin}: thinning interval for the Markov chain. Only every thin-th draw from the Markov
  chain is kept. The value of mcmc must be divisible by this value. The default value is 1.
  \item \code{tune}: tuning parameter for the Metropolis-Hasting step, either a scalar or a numeric
  vector (for kk coefficients, enter a kk vector). The tuning parameter should be set such
  that the acceptance rate is satisfactory (between 0.2 and 0.5). The default value is 1.1.
  \item \code{verbose}: defaults to FALSE. If TRUE, the progress of the sampler (every 10\%) is
  printed to the screen.
  \item \code{seed}: seed for the random number generator. The default is \code{NA} which corresponds
  to a random seed of 12345.
  \item \code{beta.start}: starting values for the Markov chain, either a scalar or vector with
  length equal to the number of estimated coefficients. The default is \code{NA}, such
  that the maximum likelihood estimates are used as the starting values.
}
Use the following parameters to specify the model's priors:
\itemize{
    \item \code{b0}: prior mean for the coefficients, either a numeric vector or a scalar.
    If a scalar value, that value will be the prior mean for all the coefficients.
    The default is 0.
    \item \code{B0}: prior precision parameter for the coefficients, either a square
    matrix (with the dimensions equal to the number of the coefficients) or a scalar.
    If a scalar value, that value times an identity matrix will be the prior precision
    parameter. The default is 0, which leads to an improper prior.
}
}

\examples{
data(mexico)
z.out <- zelig(vote88 ~ pristr + othcok + othsocok,model = "mlogit.bayes",
data = mexico,verbose = FALSE)

}
\seealso{
Vignette: \url{http://docs.zeligproject.org/articles/zelig_mlogitbayes.html}
}
