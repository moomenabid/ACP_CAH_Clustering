load("C:/Users/USER/Desktop/Projects/Datamining/poissons.rda")
poissons<-data
library('GGally')
library('ggplot2')
ggpairs(poissons[,5:10])

library(FactoMineR)
res <-PCA(poissons,quanti.sup=c(3:4),quali.sup=c(1:2))#,graph=FALSE)
round(res$eig,digit=2) 
barplot(res$eig[,1], main="Eigenvalues", names.arg=1:nrow(res$eig)) 
abline(h=1,col=2,lwd=2)       

# Graphiques des individus et des variables sur le plan factoriel 1-2
plot(res,axes=c(1,2),choix="var") 

# Il convient maintenant de projeter les individus 
plot(res,axes=c(1,2),choix="ind")

round(res$ind$cos2,digits=3)

round(res$ind$contrib, digits=1)

round(res$var$cos2,digits=3)

round(res$var$contrib,digits=1)

nouv=cbind(poissons[,1:4],log(poissons[,5:10]))
ggpairs(nouv[,5:10])

res2 <-PCA(nouv,quanti.sup=c(3:4),quali.sup=c(1:2))

plot(res2,habillage=2,invisible="quali",title="")

nouv2=cbind(poissons[,1:4],log(poissons[,6:10])-log(poissons[,5]))
res3 <-PCA(nouv2,quanti.sup=c(3:4),quali.sup=c(1:2))
plot(res3,habillage=2,invisible="quali",title="")

# Interprétation avec les variables quantitatives
nouvdes=nouv2[,c(2,5:9)]
des <- catdes(nouvdes, num.var=1)
print(des$quanti$'herbivores',digits=2)

nouv3=nouv2
#nouv3=nouv2[nouv2[,2]!="herbivores",]
res4 <-PCA(nouv3,quanti.sup=c(3:4),quali.sup=c(1:2))
res4$eig
plot(res4,axes=c(1,2),choix="var")
plot(res4,habillage=2,invisible="quali",title="")

library(zoo)
#on remplace les données manquantes par la moyenne de la colonne.
remplacer=nouv3
remplacer$INTE[is.na(remplacer$INTE)] <- mean(remplacer$INTE,na.rm=T)
remplacer$ESTO[is.na(remplacer$ESTO)] <- mean(remplacer$ESTO,na.rm=T)
remplacer$BRAN[is.na(remplacer$BRAN)] <- mean(remplacer$BRAN,na.rm=T)
remplacer$FOIE[is.na(remplacer$FOIE)] <- mean(remplacer$FOIE,na.rm=T)
remplacer$REIN[is.na(remplacer$REIN)] <- mean(remplacer$REIN,na.rm=T)
#clustering 
matclust=remplacer[,5:9]
apply(matclust, 2, sd) # écart-type différents
n <- nrow(matclust)
Z <- scale(matclust,center=TRUE,scale=TRUE)*sqrt(n/(n-1)) # on va donc centrer-réduire les données
# hclust avec Ward des données standardisées
d <- dist(Z) 
tree <- hclust(d^2/(2*n), method="ward.D") # ici les poids des individus sont 1/n
sum(tree$height) # on retrouve que l'inertie totale est égale à 5 (nombre de variables)
plot(tree, hang=-1, main="CAH de Ward", sub="", xlab="") 
# Partition en 4 classes 
rect.hclust(tree, 4, border = "blue3")
barplot(sort(tree$height, decreasing = TRUE), main="Hauteurs de l'arbre")
abline(h = 0.4, col="red")
K <- 4
part <- cutree(tree,k=K)
part <- as.factor(part)
levels(part) <- paste("cluster",1:K,sep="")
#Interprétation des classes obtenue en fonction des 5 variables 
#quantitatives utilisées et des variables qualitatives espèces 
#et régime alimentaire.
des <- catdes(data.frame(part,matclust), num.var=1)
print(des$quanti$'cluster1',digits=2) 
print(des$quanti$'cluster2',digits=2) 
print(des$quanti$'cluster3',digits=2) 
print(des$quanti$'cluster4',digits=2) 

des2 <- catdes(data.frame(part,remplacer[,1]), num.var=1)
print(des2$category$'cluster1',digits=2) 
print(des2$category$'cluster2',digits=2) 
print(des2$category$'cluster3',digits=2)
print(des2$category$'cluster4',digits=2)

des3 <- catdes(data.frame(part,remplacer[,2]), num.var=1)
print(des3$category$'cluster1',digits=2) 
print(des3$category$'cluster2',digits=2) 
print(des3$category$'cluster3',digits=2) 
print(des3$category$'cluster4',digits=2) 

# library('missMDA')
# donnee_imput=nouv3[,5:9]
# ncomp <- estim_ncpPCA(donnee_imput)
# res.imp <- imputePCA(donnee_imput, ncp = ncomp$ncp)
# #imputation et qualité
# res.comp<-MIPCA(donnee_imput,ncp = ncomp$ncp,nboot=10)
# plot(res.comp)
