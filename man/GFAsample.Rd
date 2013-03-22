\name{GFAsample}
\alias{GFAsample}
\alias{CCAsample}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generate data from CCA/BIBFA/GFA model
}
\description{
  Generate data from a CCA/BIBFA/GFA model that has been learned with
  \code{\link{GFA}}. The most likely use of this function is for model
  checking.
}
\usage{
CCAsample(model, N)
GFAsample(model, N)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{
    A list of model parameters as returned by \code{\link{GFA}}.
}
  \item{N}{
    How many samples to draw.
}
}
\details{
  The code randomly samples \code{Z} from the prior and then draws
  \code{N} observations for both views.
}
\value{
\item{Y}{The data, a list of N times D[m] matrices.}
\item{Z}{The latent variables, a N times K matrix.}
}
\author{
Seppo Virtanen and Arto Klami
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{GFA}},\code{\link{CCA}}
}
\examples{
  #
  # Assume we have a variable model which has been learned with
  # GFAexperiment() or GFA().
  # Then the following line would draw 100 samples from it:
  #
  # Y2 <- GFAsample(model,100)
  #
}
