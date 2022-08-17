library(mixOmics)

# from csv file
data <- read.csv("heatmap_order16s.csv", row.names=1, header=TRUE)

X=data

#running PCA
MyResult.pca <- pca(X)
plotIndiv(MyResult.pca)
#plot variables of order
plotVar(MyResult.pca)

#select top 5 variables contributing to each of the two components in PCA
MyResult.spca <- spca(X, keepX=c(5,5)) 
plotIndiv(MyResult.spca)
plotVar(MyResult.spca)

MyResult.pca <- pca(X)     # 1 Run the method
plotIndiv(MyResult.pca)    # 2 Plot the samples
plotVar(MyResult.pca)  
plot(MyResult.pca)
MyResult.pca
plotLoadings(MyResult.pca)



X11()
cim(MyResult.pca, comp = 1)
cim(MyResult.pca, comp = 1, save = 'jpeg', name.save = 'PLScim')


#OKAY we are fitting the pca to the data
library(mixOmics)
# from csv file
data <- read.csv("heatmap_order16s.csv", row.names=1, header=TRUE)
X <- data

#tune PC plot the barcode of proportion
#tune.pca(X, ncomp = 10, center = TRUE, scale = FALSE)
#result <- pca(X, ncomp = 2, center = TRUE, scale = FALSE)
#result
#X11()
#cim(result, comp = 1)
#cim(result, comp = 1, save = 'jpeg', name.save = 'PLScim')


result<-pca(X,
    ncomp = 2,
    center = TRUE,
    scale = FALSE,
    max.iter = 1000,
    tol = 1e-09,
    logratio = 'none',  # one of ('none','CLR','ILR')
    ilr.offset = 0.001,
    V = NULL,
    multilevel = NULL)
X11()
cim(result, comp = 1)
cim(result, comp = 1, save = 'jpeg', name.save = 'PLScim')
