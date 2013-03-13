##############################################################################
###
### Code to run SGP analyses for AOB
###
#############################################################################

### Load SGP Package

require(SGP)
options(error=recover)
#options(warn=2)


### Load data

load("Data/AOB_Data_LONG.Rdata")
#load("Data/AOB_SGP.Rdata")

### abcSGP

AOB_SGP <- abcSGP(
#		AOB_Data_LONG, 
		AOB_SGP, 
		steps=c("prepareSGP", "analyzeSGP", "combineSGP", "summarizeSGP", "visualizeSGP"),
		sgp.percentiles=TRUE,
		sgp.projections=TRUE,
		sgp.projections.lagged=TRUE,
		sgp.percentiles.baseline=FALSE,
		sgp.projections.baseline=FALSE,
		sgp.projections.lagged.baseline=FALSE,
		simulate.sgps=FALSE,
		save.intermediate.results=TRUE,
		plot.types="studentGrowthPlot")
#		sgPlot.demo.report=TRUE)

### Save result

save(AOB_SGP, file="Data/AOB_SGP.Rdata")




AOB_SGP <- analyzeSGP(
		AOB_SGP, 
		sgp.percentiles=TRUE,
		sgp.projections=TRUE,
		sgp.projections.lagged=TRUE,
		sgp.percentiles.baseline=FALSE,
		sgp.projections.baseline=FALSE,
		sgp.projections.lagged.baseline=FALSE,
		simulate.sgps=FALSE,
		sgp.use.my.coefficient.matrices=TRUE)

