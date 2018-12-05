

espectres <- read.table("espectres 2.txt", header=T)

attach(espectres)


### ESPECTRES GROCS

ff <- function(p) p[1]/(1+exp(p[2]*Wavelength+p[3]))
ff.min <- function(p) sum((Eseg.ca-ff(p))^2)

p <- c(80,-.068,32.5)
out <- optim(p,ff.min,control=list(maxit=10000))
p<-out$par

plot(Wavelength,Eseg.ca,ylim=c(0,100))

points(Wavelength,ff(p),pch="*")

out <- nls(Aint.ca ~ b/(1+exp(-(c*Wavelength+d))),
           data = espectres,
           start=c(b=p[1],d=p[3],c=p[2])
)

cc <- coef(out)
summary(out)
inflec.logistic <- -p[3]/p[2]


 