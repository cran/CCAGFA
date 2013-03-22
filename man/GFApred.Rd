\name{GFApred}
\alias{GFApred}
\alias{CCApred}
\title{
Predict samples of one view given the other(s)
}
\description{
  Function for making predictions from some subset of views to the
  remaining ones. This can be used, for example, for multi-output regression
  and classification tasks.
}
\usage{
CCApred(pred, Y, model, sample = FALSE, nSample = 100)
GFApred(pred, Y, model, sample = FALSE, nSample = 100)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pred}{
    A vector of binary indicators telling which of the views
    are observed (1), and which are to be predicted (0).
}
  \item{Y}{
    The input data as a list of M elements, N times D[m] matrices.
}
  \item{model}{
    A list of model parameters as returned by \code{\link{GFA}}.
}
  \item{sample}{
    Boolean indicator telling whether to also draw samples from
    the predictive distribution.
}
  \item{nSample}{
    How many samples to draw if \code{sample=TRUE}.
}
}
\details{
  Estimates the conditional distribution of Z given the
  observed view and then estimates the expected predictions
  for the unobserved view. It is also possible to draw samples
  from the full predictive distribution, which cannot be
  specified in analytic form.
}
\value{
  \item{Y}{The mean predictions. Also the observed input data is
    returned, so that Y is in the same format as the input data
    for \code{GFA}.}
  \item{Z}{The mean of the latent variables given the observed data.}
  \item{covZ}{The covariance of the latent variables given the observed
    data.}
  \item{sam}{List that contain \code{nSample} elements. Each is a list
    that contains the projection matrices (\code{W}), the latent
    variables (\code{Z}), and the \code{N} samples drawn from the
    predictive posterior.}
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
  # CCAexperiment() or CCA().
  #
  # Predict the 2nd view:
  #
  # predictedY <- CCApred(c(1,0),Y,model)$Y
  #
  # Draw some samples from the conditional distribution of the
  # first view given the second
  #
  # sampled <- CCApred(c(0,1),Y,model,sample=TRUE,nSample=10)$sam$Y
  #
}

