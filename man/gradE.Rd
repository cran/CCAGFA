\name{gradE}
\alias{gradE}
\alias{E}
\title{
Compute the cost function and its gradient
}
\description{
  Internal functions for computing the cost function and the gradient of
  the rotation optimization.
}
\usage{
gradE(r, par)
E(r, par)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{r}{
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
Seppo Virtanen and Arto Klami
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{internal}
