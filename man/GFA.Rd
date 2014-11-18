\name{GFA}
\alias{GFA}
\alias{CCA}
\concept{Group factor analysis}
\concept{Canonical correlation analysis}
\alias{GFAexperiment}
\alias{CCAexperiment}
\title{
Estimate a Bayesian IBFA/CCA/GFA model
}
\description{
  Estimates the parameters of a Bayesian group factor analysis (GFA),
  canonical correlation analysis (BCCA), or inter-battery factor
  analysis (BIBFA).

  GFA is a latent variable model for explaining relationships between
  multiple data matrices with co-occurring samples. The model finds linear factors
  that explain dependencies between these matrices, similarly to how
  factor analysis explains dependencies between individual variables.
  
  BIBFA is a special case of GFA for two data matrices. It finds
  factors explaining the relationship between them, as well as factors
  explaining the residual variation in each matrix. The solution of
  BIBFA equals that of CCA, with additional factors for explaining the
  data-specific noise.
}
\usage{
CCA(Y, K, opts)
GFA(Y, K, opts)
CCAexperiment(Y, K, opts, Nrep=10)
GFAexperiment(Y, K, opts, Nrep=10)
}
\arguments{
  \item{Y}{
A list containing matrices with N rows (samples) and D[m] columns (features). Must have exactly two matrices for \code{CCA}
and any number of co-occurring matrices for \code{GFA}.
}
  \item{K}{
The number of components.
}
  \item{opts}{
A list of parameters and options to be used when learning the model.
See \code{\link{getDefaultOpts}}.
}
  \item{Nrep}{
    The number of random initializations used for learning the model; only
    used for \code{CCAexperiment} and \code{GFAexperiment}.
}
}
\details{
The recommended strategy is to use \code{GFAexperiment} for
learning a Bayesian group factor analysis model. It simply calls
\code{GFA} \code{Nrep} times and returns the model with the best
variational lower bound for the marginal likelihood.

\code{CCAexperiment} and \code{CCA} are simple wrappers for the
corresponding GFA functions, to be used for the case of M=2
data sets. CCA is a special case of GFA with exactly two co-occurring
matrices, and these functions are provided for convenience only.
}
\value{
The methods return a list that contains all the model parameters
and other details.
\item{Z}{The mean of the latent variables; N times K matrix}
\item{covZ}{The covariance of the latent variables; K times K matrix}
\item{ZZ}{The second moments Z^TZ; K times K matrix}
\item{W}{List of the mean projections; D_i times K matrices}
\item{covW}{List of the covariances of the projections; K times K matrices}
\item{WW}{List of the second moments W^TW; K times K matrices}
\item{tau}{The mean precisions (inverse variance, so 1/tau gives the variances denoted by sigma in the paper); M-element vector}
\item{alpha}{The mean precisions of the projection weights, used in the ARD prior; M times K matrix}
\item{cost}{Vector collecting the variational lower bounds for each iteration}
\item{D}{Data dimensionalities; M-element vector}
\item{K}{The number of latent factors}
\item{datavar}{The total variance in the data sets, needed for \code{\link{GFAtrim}}}
\item{R}{The rank of alpha}
\item{U}{The group factor loadings; M times R matrix}
\item{V}{The latent group factors; K times R matrix}
\item{u.mu}{The mean of group factor loadings U; M-element vector}
\item{v.mu}{The mean of latent group factors V; K-element vector}
}
\references{
Virtanen, S. and Klami, A., and Kaski, S.: Bayesian CCA via group-wise
sparsity. In \emph{Proceedings of the 28th International Conference on Machine
  Learning (ICML)}, pages 457-464, 2011.

Virtanen, S. and Klami, A., and Khan, S.A. and Kaski, S.: Baysian
group factor analysis. In \emph{Proceedings of the 15th International
  Conference on Artificial Intelligence and Statistics (AISTATS)}, volume 22 of JMLR W&CP, pages 1269-1277, 2012.

Klami, A. and Virtanen, S., and Kaski, S.:Bayesian Canonical Correlation
Analysis. \emph{Journal of Machine Learning Research}, 2013.

Klami, A. and Virtanen, S., Leppaaho, E., and Kaski, S.:Group Factor Analysis. \emph{Submitted to a journal}, 2014.
}
\author{
Seppo Virtanen, Eemeli Leppaaho and Arto Klami
}
\seealso{
\code{\link{getDefaultOpts}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
#
# Create simple random data
#

N <- 50; D <- c(4,6)       # 50 samples with 4 and 6 dimensions
tau <- c(3,3)              # residual noise precision

K <- 3                          # K real components (1 shared, 1+1 private)
Z <- matrix(rnorm(N*K,0,1),N,K) # drawn from the prior
alpha <- matrix(c(1,1,1e6,1,1e6,1),2,3) 

Y <- vector("list",length=2)
W <- vector("list",length=2)

for(view in 1:2) {
  W[[view]] <- matrix(0,D[view],K)
  for(k in 1:K) {
    W[[view]][,k] <- rnorm(D[view],0,1/sqrt(alpha[view,k]))
  }
  Y[[view]] <- Z \%*\% t(W[[view]]) +
    matrix(rnorm(N*D[view],0,1/sqrt(tau[view])),N,D[view])
}

#
# Run the model
#
opts <- getDefaultOpts()
opts$iter.max <- 10       # Terminate early for fast testing

# Only tries two random initializations for faster testing
model <- CCAexperiment(Y,K,opts,Nrep=2)

}
