\name{gradEuv}
\alias{gradEuv}
\alias{Euv}
\title{
  Compute the cost function and its gradient
}
\description{
  Internal functions for computing the cost function and the gradient of
  the low-rank ARD prior.
}
\usage{
  gradEuv(x, par)
  Euv(x, par)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
    The current parameter values.
  }
  \item{par}{
    List of parameters required for the optimization
  }
}
\value{
  The new parameter values
}
\author{
  Seppo Virtanen, Eemeli Leppaaho and Arto Klami
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{internal}
