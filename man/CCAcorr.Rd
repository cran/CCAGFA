\name{CCAcorr}
\alias{CCAcorr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Compute correlation between the views
}
\description{
  A function for estimating the canonical correlations between
  two data sets. This function can only be used for models learned
  based on two data sources, since canonical correlation is
  only defined for two sets.
}
\usage{
CCAcorr(Y, model, threshold = 0.001)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y}{
    The data given as a list of two N times D[m] matrices
}
  \item{model}{
    A list of model parameters as returned by \code{\link{CCA}}.
}
  \item{threshold}{
    Relative amount of variance explained that is needed for a component
    to be treated active (see \code{\link{CCAtrim}}).
}
}
\details{
  The function computes the correlations for each component. The inactive
  ones are not suprressed away, but the variable \code{active} can be
  used for filtering them out; the correlations for the non-shared
  components should typically not be trusted. The estimated correlation
  corresponds to the correlation between the expected values of
  Z|Y[1] and Z|Y[2].
}
\value{
\item{r}{The correlations, a vector of length \code{K}.}
\item{active}{A binary indicator telling which of the components are shared.}
}
\author{
Seppo Virtanen and Arto Klami
}
\examples{
  #
  # Assume we have a variable model which has been learned with
  # CCAexperiment() or CCA().
  #
  # output <- CCAcorr(model)
  #
  # print(output$r)                           # Print the correlations
  # print(output$r[which(output$active==1)])  # Only the shared components
  #
}
