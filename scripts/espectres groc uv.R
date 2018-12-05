

espectres <- read.table("espectres 2.txt", header=T)

attach(espectres)



# 15:07:2015: Això és un comentari.

ff1 <- function(p) p[1]*exp((-(Wavelength-p[2])^2)/(2*p[3]^2))
ff2 <- function(p) p[1]/(1+exp(p[2]*Wavelength+p[3]))
ff <- function(p) ff1(p)+ff2(p[4:6])
ff.min <- function(p) sum((Bfru.ca-ff(p))^2)

p <- c(30,350,30,60,-.072,30)
out <- optim(p,ff.min,control=list(maxit=10000))
p <- out$par

plot(Wavelength,Bfru.ca,ylim=c(0,100))
# points(Wavelength,ff1(p[1:3]))
# points(Wavelength,ff2(p[1:3]))
points(Wavelength,ff(p),pch="*")

out <- nls(Bfru.ca ~ a*exp(-((Wavelength-xm)^2)/s)+b/(1+exp(-(c*Wavelength+d))),
           data = espectres,
           start=c(a=p[1],b=p[4],s=p[3],d=p[6],c=p[5],xm=p[2])
)

inflec.logistic <- -p[6]/p[5]
inflec.gaus.pos <- p[2]+p[3]*sqrt(2*log(2))
inflec.gaus.neg <- p[2]-p[3]*sqrt(2*log(2))

inflec.gaus.pos
inflec.logistic
inflec.gaus.neg
