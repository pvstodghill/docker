source("https://bioconductor.org/biocLite.R")
biocLite("goseq", ask=FALSE)
if (packageVersion("goseq") != Sys.getenv("VERSION")) {
    stop("Wrong version installed")
}
