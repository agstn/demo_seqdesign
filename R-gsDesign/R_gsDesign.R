#' Load Package
# install.packages("gsDesign")
library(gsDesign)

nBinomial(p1=0.105, p2=0.069, beta=.2, alpha=0.05, sided = 2, scale="OR")

#' Design
#' Symmetric, 2-sided design with O'Brien-Fleming-like boundaries lower bound is non-binding 
#' (ignored in Type I error computation) sample size is computed based on a fixed design requiring n=1952
#+ comment = NA
m1 <- gsDesign(k = 3, timing = c(0.5, 0.67, 1), test.type = 2, alpha = 0.05, beta = 0.2, sfu = "OF", 
               n.fix = 1952, endpoint = "Binomial", delta0 = 0.105, delta1 = 0.069)

summary(m1)
m1
