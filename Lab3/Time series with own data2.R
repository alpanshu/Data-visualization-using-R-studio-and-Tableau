river <- scan("https://www.stat.uiowa.edu/~luke/data/river.dat")
library(lattice)
xyplot(river ~ seq_along(river), type = c("l", "p"))
xyplot(river ~ seq_along(river) | equal.count(seq_along(river), 3, overlap=0.1),
       type="l", aspect="xy", strip=FALSE,
       scales=list(relation = "sliced"),
       xlab="months")