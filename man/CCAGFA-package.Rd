\name{CCAGFA-package}
\alias{CCAGFA-package}
\alias{CCGFA}
\docType{package}
\title{CCAGFA: Bayesian canonical correlation analysis (BCCA), inter-battery
  factor analysis (BIBFA), and group factor analysis (GFA)}
\description{Variational Bayesian solution for canonical
  correlation analysis, inter-battery factor analysis and group factor
  analysis. The package contains code for learning the model and
  some supporting functionality for interpretation.

The Bayesian CCA model as implemented here was originally presented by Virtanen et al. (2011),
but a more comprehensive treatment is found in Klami et al. (2013). The latter also explains
the BIBFA model. The GFA extends CCA to multiple data sources (or groups of variables), providing interpretable linear
factorizations that describe variation shared by all possible subsets of sources. It was originally presented by Virtanen et al. (2012). Later Klami et al. (2014) provide a more extensive literature review and present a novel hierarchical low-rank ARD prior for the factor loadings to better account for inter-source relationships.

We recommend that scientific publications using the code for CCA or BIBFA cite Klami et al. (2013),
and publications using the code for GFA cite Virtanen et al. (2012), until Klami et al. (2014) has been published.

The package is based on the research done in the SMLB group, Helsinki Institute for Information Technology HIIT, Department of Information and Computer Science, Aalto University, http://research.ics.aalto.fi/mi/.}
\details{
  \tabular{ll}{
    Package: \tab CCAGFA\cr
    Type: \tab Package\cr
    Version: \tab 1.0.4\cr
    Date: \tab 2013-04-23\cr
    License: \tab GPL (>= 2)\cr
  }
}
\author{Seppo Virtanen, Eemeli Leppaaho and Arto Klami.
  Maintainer: Seppo Virtanen <seppo.j.virtanen@aalto.fi>}
\references{
Virtanen, S. and Klami, A., and Kaski, S.: Bayesian CCA via group-wise
sparsity. In \emph{Proceedings of the 28th International Conference on Machine
  Learning (ICML)}, pages 457-464, 2011.

Virtanen, S. and Klami, A., and Khan, S.A. and Kaski, S.: Baysian
group factor analysis. In \emph{Proceedings of the 15th International
  Conference on Artificial Intelligence and Statistics (AISTATS)}, volume 22 of JMLR W&CP, pages 1269-1277, 2012.

Klami, A. and Virtanen, S., and Kaski, S.:Bayesian Canonical Correlation
Analysis. \emph{Journal of Machine Learning Research},14:965-1003, 2013.

Klami, A. and Virtanen, S., Leppaaho, E., and Kaski, S.:Group Factor Analysis. \emph{Submitted to a journal}, 2014.
}
\keyword{package}
%\seealso{%%~~ \code{\link[somepkg:somepkg-package]{somepkg}} ~~}}
\examples{# Load the package
# require(CCAGFA)

# demo(CCAGFAexample)
}
