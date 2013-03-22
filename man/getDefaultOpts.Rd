\name{getDefaultOpts}
\alias{getDefaultOpts}
\title{
Get default options for BIBFA
}
\description{
  A helper function that creates a list of options to be passed for
  \code{CCA} and \code{GFA}.
}
\usage{
getDefaultOpts()
}
\details{
  To run the code with other option values, first run this function
  and then directly modify the entries before passing the list to
  \code{CCA} and \code{GFA}.
}
\value{
\item{rotate}{Whether to optimize for a linear transformation to make
  the variational updates less correlated.}
\item{init.tau}{Initial values for the noise precision.}
\item{iter.crit}{The iteration is terminated when the relative change in the lower bound for the marginal likelihood
  drops below this threshold.}
\item{iter.max}{Maximum number of iterations.}
\item{opt.method}{Which method to use for optimizing the rotation;
  "BFGS" or "L-BFGS".}
\item{lbfgs.factr}{Optimization parameter of L-BFGS.}
\item{bfgs.crit}{Optimization parameter of BFGS.}
\item{opt.iter}{Number of iterations for the (L-)BFGS optimization.}
\item{addednoise}{A small constant used to de-correlate latent variables
  of inactive components.}
\item{prior.alpha_0}{Gamma prior for ARD.}
\item{prior.beta_0}{Gamma prior for ARD.}
\item{prior.alpha_0t}{Gamma prior for tau.}
\item{prior.beta_0t}{Gamma prior for tau.}
\item{verbose}{The amount of details printed while running \code{CCA}
  and \code{GFA}. 0=none, 1=medium, 2=high.}
}
\author{
Seppo Virtanen and Arto Klami
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{CCA}},\code{\link{GFA}}.
}
\examples{
 # opts <- getDefaultOpts()  # Get the default options
 # opts$verbose <- 1         # Change some of them
 # opts$init.tau <- 10^5

 # Run the model with the new options
 # model <- CCAexperiment(Y,K,opts)
}
