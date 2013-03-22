\name{GFAtrim}
\alias{GFAtrim}
\alias{CCAtrim}
\title{
  Simplify a CCA/BIBFA/GFA model
}
\description{
Prunes out unnecessary components and determines for each of the
remaining components whether it is shared or not. In other words,
the function reveals the component allocation into shared and
view-specific ones.
}
\usage{
CCAtrim(model, threshold = 0.001)
GFAtrim(model, threshold = 0.001)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{
    A list of model parameters as returned by \code{\link{CCA}} or
    \code{\link{GFA}}.
}
  \item{threshold}{
    The proportion of relative variance explained that components need
    to exceed to be detected as active.
}
}
\details{
  This function can be used to prune out unnecessary components and
  to recognize which of the components are shared. This can be useful
  for interpretative purposes, but it is typically not necessary to
  apply this function prior to making predictions (with
  \code{\link{GFApred}} or otherwise). The inactive components will
  anyway automatically cancel out for the predictive formulas.
  The code works well for low-dimensional data, but for complex high-dimensional
  data sources one should check whether the trimming is reasonable;
  in such cases it is difficult to make clear decisions on component activity.
}
\value{
  A list of parameter values as returned by \code{\link{GFA}}.
  The list also includes two extra elements:
  \item{trimmed}{A boolean variable indicating that the model has
    been trimmed with this function.}
  \item{active}{A binary matrix indicating for each component (column) in which
    views (row) it is active.}
}
\author{
Seppo Virtanen and Arto Klami
}

\seealso{
\code{\link{GFA}}, \code{\link{CCA}}
}
\examples{
  #
  # Assume we have a variable model which has been learned with
  # GFAexperiment() or GFA().
  # Then the following line would trim it:
  #
  # trimmed <- GFAtrim(model)
  #
}

