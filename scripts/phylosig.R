

library(phytools)

arbre<-read.tree("arbrecollserola.txt")

database<-read.table("variablescollserola.txt", header=T)

attach(database)

phylosig(arbre, PER350, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())
phylosig(arbre, PER450, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())
phylosig(arbre, PER550, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())
phylosig(arbre, PER650, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())
phylosig(arbre, INT350, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())
phylosig(arbre, INT450, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())
phylosig(arbre, INT550, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())
phylosig(arbre, INT650, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())
phylosig(arbre, BRIGHTNESS, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())
phylosig(arbre, CHROMA, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())
phylosig(arbre, HUE, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())
phylosig(arbre, A, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())
phylosig(arbre, HOR, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())
phylosig(arbre, AVI, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())
phylosig(arbre, COL, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())
phylosig(arbre, DIP, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())
phylosig(arbre, LEP, method="K", test=TRUE, nsim=1000, se=NULL, start=NULL,control=list())


plotBranchbyTrait(arbre, DIP, mode=c("edges","tips","nodes"), palette="rainbow",legend=TRUE, xlims=NULL)
