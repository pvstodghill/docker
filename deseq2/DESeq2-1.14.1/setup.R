source("https://bioconductor.org/biocLite.R")
biocLite("DESeq2", ask=FALSE)
if (packageVersion("DESeq2") != Sys.getenv("VERSION")) {
    stop("Wrong version installed")
}
