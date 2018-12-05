
espectres <- read.table("espectres 2.txt", header=T)

attach(espectres)


### ESPECTRES BLANCS
a<-Orvu.pa
a1<-sum(a)
a2<-a*10000/a1


ff <- function(p) p[1]/(1+exp(p[2]*Wavelength+p[3]))
ff.min <- function(p) sum((a2-ff(p))^2)

p <- c(40,-.068,29)
out <- optim(p,ff.min,control=list(maxit=10000))
p<-out$par

plot(Wavelength,a2,ylim=c(0,100))

points(Wavelength,ff(p),pch="*")

out <- nls(a2 ~ b/(1+exp(-(c*Wavelength+d))),
           data = espectres,
           start=c(b=p[1],d=p[3],c=p[2])
)


inflec.logistic <- -p[3]/p[2]

inflec.logistic
