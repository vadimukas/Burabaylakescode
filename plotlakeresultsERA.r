# 1. Read in the data of the ERA runs

#order of lakes: Ulken(1), Burabay(2), Shortandy(3)

# Where is DBVD? Add..! These KHM driven model outputs have been added so we can compare with ERA

meteo_names = c("Year","Doy","Month","Dim","DecYear","t2m_C","d2m_C","U10_m_s","ssrd_mj_m2","strd_mj_m2","T_water_Kaz_S","T_water_Kaz_B","T_water_Kaz_U","h_water_Kaz_S","h_water_Kaz_B","h_water_Kaz_U","aeroU_KHM","aeroB_KHM","aeroS_KHM","McJannetU_KHM","McJannetB_KHM","McJannetS_KHM","P_Burabay","P_Koks","P_Shu","P_Bur_old")


DBVDflux_names = c("Year","Doy","Month","Dim","DecYear","Ts_water_est_DBVD_U","Ts_water_est_DBVD_B","Ts_water_est_DBVD_S","Rn_water_DBVD_U","Rn_water_DBVD_B","Rn_water_DBVD_S","G_DBVD_U","G_DBVD_B","G_DBVD_S","Hlake_DBVD_U","Hlake_DBVD_B","Hlake_DBVD_S","Elake_DBVD_U","Elake_DBVD_B","Elake_DBVD_S","tau_DBVD_U","tau_DBVD_B","tau_DBVD_S","efromTdew","efromTdewVY","esat_Tw_U","esat_Tw_B","esat_Tw_S")

Elakedata_names = c("Year","Doy","Month","Dim","DecYear","Elake_DBVD_Umm","Elake_DBVD_Bmm","Elake_DBVD_Smm","Elake_aero_U","Elake_aero_B","Elake_aero_S","Elake_aeroHar_U","Elake_aeroHar_B","Elake_aeroHar_S","T_water_Kaz_S","T_water_Kaz_B","T_water_Kaz_U","aeroU_KHM","aeroB_KHM","aeroS_KHM","McJannetU_KHM","McJannetB_KHM","McJannetS_KHM")

#Elakedatamonthly_names = c("Year","Doy","Month","Dim","DecYear","Elake_DBVD_Umm","Elake_DBVD_Bmm","Elake_DBVD_Smm","Elake_aero_U","Elake_areo_B","Elake_aero_S","T_water_Kaz_S","T_water_Kaz_B","T_water_Kaz_U","aeroU_KHM","aeroB_KHM","aeroS_KHM","McJannetU_KHM","McJannetB_KHM","McJannetS_KHM")


meteodata <- read.table("/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/ERAdrivingdatapluslaketemps.txt",header=TRUE, sep="", col.names=meteo_names)


DBVDfluxdata <- read.table("/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/ERAdrivingDeBruinoutput.out",header=FALSE, sep="", col.names=DBVDflux_names)

Elakedata <- read.table("/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/ERAdrivingDeBruin&aero1output.out",header=FALSE, sep="", col.names=Elakedata_names)

#Elakedatamonthly <- read.table("/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/ERAdrivingDeBruin&aero1outputmonthlysums.out",header=FALSE, sep="", col.names=Elakedatamonthly_names)





require (zoo)
library(fields)
#library(openair)
#library(lubridate)

attach(meteodata)
attach(Elakedata)
attach(DBVDfluxdata)
#attach(Elakedatamonthly)

Year2008Meteo <- subset(meteodata, Year == 2008)
Year2009Meteo <- subset(meteodata, Year == 2009)
Year2010Meteo <- subset(meteodata, Year == 2010)
Year2011Meteo <- subset(meteodata, Year == 2011)
Year2012Meteo <- subset(meteodata, Year == 2012)
Year2013Meteo <- subset(meteodata, Year == 2013)
Year2014Meteo <- subset(meteodata, Year == 2014)
Year2015Meteo <- subset(meteodata, Year == 2015)
Year2016Meteo <- subset(meteodata, Year == 2016)

Year2008LakeE <- subset(Elakedata, Year == 2008)
Year2009LakeE <- subset(Elakedata, Year == 2009)
Year2010LakeE <- subset(Elakedata, Year == 2010)
Year2011LakeE <- subset(Elakedata, Year == 2011)
Year2012LakeE <- subset(Elakedata, Year == 2012)
Year2013LakeE <- subset(Elakedata, Year == 2013)
Year2014LakeE <- subset(Elakedata, Year == 2014)
Year2015LakeE <- subset(Elakedata, Year == 2015)
Year2016LakeE <- subset(Elakedata, Year == 2016)

Year2008DBVD <- subset(DBVDfluxdata, Year == 2008)
Year2009DBVD <- subset(DBVDfluxdata, Year == 2009)
Year2010DBVD <- subset(DBVDfluxdata, Year == 2010)
Year2011DBVD <- subset(DBVDfluxdata, Year == 2011)
Year2012DBVD <- subset(DBVDfluxdata, Year == 2012)
Year2013DBVD <- subset(DBVDfluxdata, Year == 2013)
Year2014DBVD <- subset(DBVDfluxdata, Year == 2014)
Year2015DBVD <- subset(DBVDfluxdata, Year == 2015)
Year2016DBVD <- subset(DBVDfluxdata, Year == 2016)

Year2008MeteoOW_U <- subset(meteodata, Year == 2008 & Doy>=92 & Doy <= 338)
Year2009MeteoOW_U <- subset(meteodata, Year == 2009 & Doy>=91 & Doy <= 340)
Year2010MeteoOW_U <- subset(meteodata, Year == 2010 & Doy>=94 & Doy <= 338)
Year2011MeteoOW_U <- subset(meteodata, Year == 2011 & Doy>=91 & Doy <= 317)
Year2012MeteoOW_U <- subset(meteodata, Year == 2012 & Doy>=83 & Doy <= 325)
Year2013MeteoOW_U <- subset(meteodata, Year == 2013 & Doy>=89 & Doy <= 344)
Year2014MeteoOW_U <- subset(meteodata, Year == 2014 & Doy>=91 & Doy <= 323)
Year2015MeteoOW_U <- subset(meteodata, Year == 2015 & Doy>=98 & Doy <= 317)
Year2016MeteoOW_U <- subset(meteodata, Year == 2016 & Doy>=92 & Doy <= 313)

Year2008MeteoOW_B <- subset(meteodata, Year == 2008 & Doy>=92 & Doy <= 335)
Year2009MeteoOW_B <- subset(meteodata, Year == 2009 & Doy>=91 & Doy <= 311)
Year2010MeteoOW_B <- subset(meteodata, Year == 2010 & Doy>=98 & Doy <= 327)
Year2011MeteoOW_B <- subset(meteodata, Year == 2011 & Doy>=96 & Doy <= 310)
Year2012MeteoOW_B <- subset(meteodata, Year == 2012 & Doy>=83 & Doy <= 313)
Year2013MeteoOW_B <- subset(meteodata, Year == 2013 & Doy>=94 & Doy <= 329)
Year2014MeteoOW_B <- subset(meteodata, Year == 2014 & Doy>=93 & Doy <= 298)
Year2015MeteoOW_B <- subset(meteodata, Year == 2015 & Doy>=98 & Doy <= 310)
Year2016MeteoOW_B <- subset(meteodata, Year == 2016 & Doy>=87 & Doy <= 305)

Year2008MeteoOW_S <- subset(meteodata, Year == 2008 & Doy>=103 & Doy <= 338)
Year2009MeteoOW_S <- subset(meteodata, Year == 2009 & Doy>=91 & Doy <= 319)
Year2010MeteoOW_S <- subset(meteodata, Year == 2010 & Doy>=104 & Doy <= 337)
Year2011MeteoOW_S <- subset(meteodata, Year == 2011 & Doy>=98 & Doy <= 319)
Year2012MeteoOW_S <- subset(meteodata, Year == 2012 & Doy>=89 & Doy <= 329)
Year2013MeteoOW_S <- subset(meteodata, Year == 2013 & Doy>=95 & Doy <= 331)
Year2014MeteoOW_S <- subset(meteodata, Year == 2014 & Doy>=91 & Doy <= 319)
Year2015MeteoOW_S <- subset(meteodata, Year == 2015 & Doy>=98 & Doy <= 317)
Year2016MeteoOW_S <- subset(meteodata, Year == 2016 & Doy>=92 & Doy <= 317)


Year2008DBVDOW_U <- subset(DBVDfluxdata, Year == 2008 & Doy>=92 & Doy <= 338)
Year2009DBVDOW_U <- subset(DBVDfluxdata, Year == 2009 & Doy>=91 & Doy <= 340)
Year2010DBVDOW_U <- subset(DBVDfluxdata, Year == 2010 & Doy>=94 & Doy <= 338)
Year2011DBVDOW_U <- subset(DBVDfluxdata, Year == 2011 & Doy>=91 & Doy <= 317)
Year2012DBVDOW_U <- subset(DBVDfluxdata, Year == 2012 & Doy>=83 & Doy <= 325)
Year2013DBVDOW_U <- subset(DBVDfluxdata, Year == 2013 & Doy>=89 & Doy <= 344)
Year2014DBVDOW_U <- subset(DBVDfluxdata, Year == 2014 & Doy>=91 & Doy <= 323)
Year2015DBVDOW_U <- subset(DBVDfluxdata, Year == 2015 & Doy>=98 & Doy <= 317)
Year2016DBVDOW_U <- subset(DBVDfluxdata, Year == 2016 & Doy>=92 & Doy <= 313)

Year2008DBVDOW_B <- subset(DBVDfluxdata, Year == 2008 & Doy>=92 & Doy <= 335)
Year2009DBVDOW_B <- subset(DBVDfluxdata, Year == 2009 & Doy>=91 & Doy <= 311)
Year2010DBVDOW_B <- subset(DBVDfluxdata, Year == 2010 & Doy>=98 & Doy <= 327)
Year2011DBVDOW_B <- subset(DBVDfluxdata, Year == 2011 & Doy>=96 & Doy <= 310)
Year2012DBVDOW_B <- subset(DBVDfluxdata, Year == 2012 & Doy>=83 & Doy <= 313)
Year2013DBVDOW_B <- subset(DBVDfluxdata, Year == 2013 & Doy>=94 & Doy <= 329)
Year2014DBVDOW_B <- subset(DBVDfluxdata, Year == 2014 & Doy>=93 & Doy <= 298)
Year2015DBVDOW_B <- subset(DBVDfluxdata, Year == 2015 & Doy>=98 & Doy <= 310)
Year2016DBVDOW_B <- subset(DBVDfluxdata, Year == 2016 & Doy>=87 & Doy <= 305)

Year2008DBVDOW_S <- subset(DBVDfluxdata, Year == 2008 & Doy>=103 & Doy <= 338)
Year2009DBVDOW_S <- subset(DBVDfluxdata, Year == 2009 & Doy>=91 & Doy <= 319)
Year2010DBVDOW_S <- subset(DBVDfluxdata, Year == 2010 & Doy>=104 & Doy <= 337)
Year2011DBVDOW_S <- subset(DBVDfluxdata, Year == 2011 & Doy>=98 & Doy <= 319)
Year2012DBVDOW_S <- subset(DBVDfluxdata, Year == 2012 & Doy>=89 & Doy <= 329)
Year2013DBVDOW_S <- subset(DBVDfluxdata, Year == 2013 & Doy>=95 & Doy <= 331)
Year2014DBVDOW_S <- subset(DBVDfluxdata, Year == 2014 & Doy>=91 & Doy <= 319)
Year2015DBVDOW_S <- subset(DBVDfluxdata, Year == 2015 & Doy>=98 & Doy <= 317)
Year2016DBVDOW_S <- subset(DBVDfluxdata, Year == 2016 & Doy>=92 & Doy <= 317)




DBVDfluxdata$VPDwaterair_U = DBVDfluxdata$esat_Tw_U - DBVDfluxdata$efromTdew
DBVDfluxdata$VPDwaterair_B = DBVDfluxdata$esat_Tw_B - DBVDfluxdata$efromTdew
DBVDfluxdata$VPDwaterair_S = DBVDfluxdata$esat_Tw_S - DBVDfluxdata$efromTdew

meteodata$Tdifwaterair_U = meteodata$T_water_Kaz_U - meteodata$t2m_C
meteodata$Tdifwaterair_B = meteodata$T_water_Kaz_B - meteodata$t2m_C
meteodata$Tdifwaterair_S = meteodata$T_water_Kaz_S - meteodata$t2m_C

meteodata$Tdifwater_UB = meteodata$T_water_Kaz_U - meteodata$T_water_Kaz_B
meteodata$Tdifwater_US = meteodata$T_water_Kaz_U - meteodata$T_water_Kaz_S
meteodata$Tdifwater_BS = meteodata$T_water_Kaz_B - meteodata$T_water_Kaz_S



eps = 0.95
sigma = 5.67e-8

# Daily Air temperature
matplot(Year2013Meteo$Doy,Year2013Meteo$t2m_C,type="p",pch=1, col=1,ylim = c(-50,50),xlim = c(0,365),xlab="Doy",ylab="Air temperature (deg C)")
matlines(Year2014Meteo$Doy,Year2014Meteo$t2m_C,type="p",pch=1, col=2)
matlines(Year2015Meteo$Doy,Year2015Meteo$t2m_C,type="p",pch=1, col=3)
matlines(Year2016Meteo$Doy,Year2016Meteo$t2m_C,type="p",pch=1, col=4)

box()

abline(h = 0)

legend(223.2, 50, c("2013","2014","2015","2016"),cex=0.6,pch=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/TairallyearsBurabay.pdf')
dev.off()

# Daily U10 rolling mean
matplot(rollmean(meteodata$DecYear,10),rollmean(meteodata$U10_m_s,10),type="l",lty=1, col=1,ylim = c(0,12),xlim = c(2008,2017),xlab="Decimal Day",ylab="ERA windspeed (m/s)")


box()

abline(v = 2008,col=16,lty=2)
abline(v = 2009,col=16,lty=2)
abline(v = 2010,col=16,lty=2)
abline(v = 2011,col=16,lty=2)
abline(v = 2012,col=16,lty=2)
abline(v = 2013,col=16,lty=2)
abline(v = 2014,col=16,lty=2)
abline(v = 2015,col=16,lty=2)
abline(v = 2016,col=16,lty=2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/U10rollingmeanallyearBurabay.pdf')
dev.off()

# Daily ERA Tair rolling mean
matplot(rollmean(meteodata$DecYear,10),rollmean(meteodata$t2m_C,10),type="l",lty=1, col=1,ylim = c(-30,30),xlim = c(2008,2017),xlab="Decimal Day",ylab="ERA 2m Air temperature (deg C)")


box()
abline(v = 2008,col=16,lty=2)
abline(v = 2009,col=16,lty=2)
abline(v = 2010,col=16,lty=2)
abline(v = 2011,col=16,lty=2)
abline(v = 2012,col=16,lty=2)
abline(v = 2013,col=16,lty=2)
abline(v = 2014,col=16,lty=2)
abline(v = 2015,col=16,lty=2)
abline(v = 2016,col=16,lty=2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/t2mCrollingmeanallyearBurabay.pdf')
dev.off()


# Daily ERA e_air rolling mean
matplot(rollmean(DBVDfluxdata$DecYear,10),rollmean(DBVDfluxdata$efromTdew,10),type="l",lty=1, col=1,ylim = c(0,2),xlim = c(2008,2017),xlab="Decimal Day",ylab="ERA 2m vapour pressure (kPa)")


box()
abline(v = 2008,col=16,lty=2)
abline(v = 2009,col=16,lty=2)
abline(v = 2010,col=16,lty=2)
abline(v = 2011,col=16,lty=2)
abline(v = 2012,col=16,lty=2)
abline(v = 2013,col=16,lty=2)
abline(v = 2014,col=16,lty=2)
abline(v = 2015,col=16,lty=2)
abline(v = 2016,col=16,lty=2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/vapourpressurerollingmeanallyearBurabay.pdf')
dev.off()

# Daily ERA ssrd_mj_m2 rolling mean
matplot(rollmean(meteodata$DecYear,10),rollmean(meteodata$ssrd_mj_m2,10),type="l",lty=1, col=1,ylim = c(0,30),xlim = c(2008,2017),xlab="Decimal Day",ylab="ERA Incoming shorwave radiation (MJ m-2)")


box()
abline(v = 2008,col=16,lty=2)
abline(v = 2009,col=16,lty=2)
abline(v = 2010,col=16,lty=2)
abline(v = 2011,col=16,lty=2)
abline(v = 2012,col=16,lty=2)
abline(v = 2013,col=16,lty=2)
abline(v = 2014,col=16,lty=2)
abline(v = 2015,col=16,lty=2)
abline(v = 2016,col=16,lty=2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/ERAssrd_mj_m2rollingmeanallyearBurabay.pdf')
dev.off()

# Daily ERA strd_mj_m2 rolling mean
matplot(rollmean(meteodata$DecYear,10),rollmean(meteodata$strd_mj_m2,10),type="l",lty=1, col=1,ylim = c(10,35),xlim = c(2008,2017),xlab="Decimal Day",ylab="ERA Incoming Longwave radiation (MJ m-2)")


box()
abline(v = 2008,col=16,lty=2)
abline(v = 2009,col=16,lty=2)
abline(v = 2010,col=16,lty=2)
abline(v = 2011,col=16,lty=2)
abline(v = 2012,col=16,lty=2)
abline(v = 2013,col=16,lty=2)
abline(v = 2014,col=16,lty=2)
abline(v = 2015,col=16,lty=2)
abline(v = 2016,col=16,lty=2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/ERAstrd_mj_m2rollingmeanallyearBurabay.pdf')
dev.off()


# Daily VPDwaterair rolling mean
matplot(rollmean(DBVDfluxdata$DecYear,10),rollmean(DBVDfluxdata$VPDwaterair_U,10),type="l",lty=1, col=1,ylim = c(0,2),xlim = c(2008,2017),xlab="Decimal Day",ylab="esat_lake-e_air (KPa)")
matlines(rollmean(DBVDfluxdata$DecYear,10),rollmean(DBVDfluxdata$VPDwaterair_B,10),type="l",lty=1, col=2,cex = 1.0)
matlines(rollmean(DBVDfluxdata$DecYear,10),rollmean(DBVDfluxdata$VPDwaterair_S,10),type="l",lty=1, col=3,cex = 1.0)

box()
legend(2015, 2.0, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1:1,col=1:2:3);
abline(v = 2008,col=16,lty=2)
abline(v = 2009,col=16,lty=2)
abline(v = 2010,col=16,lty=2)
abline(v = 2011,col=16,lty=2)
abline(v = 2012,col=16,lty=2)
abline(v = 2013,col=16,lty=2)
abline(v = 2014,col=16,lty=2)
abline(v = 2015,col=16,lty=2)
abline(v = 2016,col=16,lty=2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/VPDwaterairrollingmeanallyearsalllakes.pdf')
dev.off()

# Daily Twater-Tair rolling mean
matplot(rollmean(meteodata$DecYear,10),rollmean(meteodata$Tdifwaterair_U,10),type="l",lty=1, col=1,ylim = c(-10,10),xlim = c(2008,2017),xlab="Decimal Day",ylab="T_lake-T_air (deg C)")
matlines(rollmean(meteodata$DecYear,10),rollmean(meteodata$Tdifwaterair_B,10),type="l",lty=1, col=2,cex = 1.0)
matlines(rollmean(meteodata$DecYear,10),rollmean(meteodata$Tdifwaterair_S,10),type="l",lty=1, col=3,cex = 1.0)

box()
legend(2014, 10.0, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1:1,col=1:2:3);
abline(v = 2008,col=16,lty=2)
abline(v = 2009,col=16,lty=2)
abline(v = 2010,col=16,lty=2)
abline(v = 2011,col=16,lty=2)
abline(v = 2012,col=16,lty=2)
abline(v = 2013,col=16,lty=2)
abline(v = 2014,col=16,lty=2)
abline(v = 2015,col=16,lty=2)
abline(v = 2016,col=16,lty=2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/TwaterminusTairrollingmeanallyearsalllakes.pdf')
dev.off()

# Daily Twater-Twater rolling mean
matplot(rollmean(meteodata$DecYear,10),rollmean(meteodata$Tdifwater_UB,10),type="l",lty=1, col=1,ylim = c(-10,10),xlim = c(2008,2017),xlab="Decimal Day",ylab="T_lake-T_lake(deg C)")
matlines(rollmean(meteodata$DecYear,10),rollmean(meteodata$Tdifwater_US,10),type="l",lty=1, col=2,cex = 1.0)
matlines(rollmean(meteodata$DecYear,10),rollmean(meteodata$Tdifwater_BS,10),type="l",lty=1, col=3,cex = 1.0)

box()
legend(2014, 10.0, c("Ulken-Burabay","Ulken-Shortandy","Burabay-Shortandy"),cex=0.8,lty=1:1:1:1,col=1:2:3);
abline(v = 2008,col=16,lty=2)
abline(v = 2009,col=16,lty=2)
abline(v = 2010,col=16,lty=2)
abline(v = 2011,col=16,lty=2)
abline(v = 2012,col=16,lty=2)
abline(v = 2013,col=16,lty=2)
abline(v = 2014,col=16,lty=2)
abline(v = 2015,col=16,lty=2)
abline(v = 2016,col=16,lty=2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/TwaterUBS-UBSairrollingmeanallyearsalllakes.pdf')
dev.off()

# Daily ERA lake evaporation rolling mean
matplot(rollmean(DBVDfluxdata$DecYear,10),rollmean(DBVDfluxdata$Elake_DBVD_U,10),type="l",lty=1, col=1,ylim = c(0,300),xlim = c(2008,2017),xlab="Decimal Day",ylab="Lake evaporation flux (W m-2)")
matlines(rollmean(DBVDfluxdata$DecYear,10),rollmean(DBVDfluxdata$Elake_DBVD_B,10),type="l",lty=1, col=2)
matlines(rollmean(DBVDfluxdata$DecYear,10),rollmean(DBVDfluxdata$Elake_DBVD_S,10),type="l",lty=1, col=3)

legend(2014, 300.0, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1:1,col=1:2:3);

abline(h = 0,col=16,lty=1)

box()
abline(v = 2008,col=16,lty=2)
abline(v = 2009,col=16,lty=2)
abline(v = 2010,col=16,lty=2)
abline(v = 2011,col=16,lty=2)
abline(v = 2012,col=16,lty=2)
abline(v = 2013,col=16,lty=2)
abline(v = 2014,col=16,lty=2)
abline(v = 2015,col=16,lty=2)
abline(v = 2016,col=16,lty=2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/Lakeevvaporationrollingmean.pdf')
dev.off()

# Daily ERA lake evaporation rolling mean aero_ERA plus aero_KHM


matplot(rollmean(Elakedata$DecYear,10),rollmean(Elakedata$Elake_aero_U,10),type="l",lty=1, col=1,ylim = c(0,20),xlim = c(2013,2017),xlab="Decimal Day",ylab="Lake evaporation flux aero (W m-2)")
matlines(rollmean(Elakedata$DecYear,10),rollmean(Elakedata$aeroU_KHM,10),type="l",lty=2, col=1)
matlines(rollmean(Elakedata$DecYear,10),rollmean((Elakedata$Elake_aero_B)+7,10),type="l",lty=1, col=2)
matlines(rollmean(Elakedata$DecYear,10),rollmean((Elakedata$aeroB_KHM)+7,10),type="l",lty=2, col=2)
matlines(rollmean(Elakedata$DecYear,10),rollmean((Elakedata$Elake_aero_S)+14,10),type="l",lty=1, col=3)
matlines(rollmean(Elakedata$DecYear,10),rollmean((Elakedata$aeroS_KHM)+14,10),type="l",lty=2, col=3)

legend(2014, 20.5, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1,col=1:2:3);
legend(2016, 20.5, c("ERA","local"),cex=0.8,col=1,lty=1:2);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/ElakeaerorollingmeanERAvKHM.pdf')
dev.off()

# Daily ERA lake evaporation rolling mean aero_ERA plus aero_ERAHarbeck


matplot(rollmean(Elakedata$DecYear,10),rollmean(Elakedata$Elake_aeroHar_U,10),type="l",lty=1, col=1,ylim = c(0,20),xlim = c(2013,2017),xlab="Decimal Day",ylab="Lake evaporation flux aero (W m-2)")
matlines(rollmean(Elakedata$DecYear,10),rollmean(Elakedata$Elake_aero_U,10),type="l",lty=2, col=1)
matlines(rollmean(Elakedata$DecYear,10),rollmean((Elakedata$Elake_aeroHar_B)+7,10),type="l",lty=1, col=2)
matlines(rollmean(Elakedata$DecYear,10),rollmean((Elakedata$Elake_aero_B)+7,10),type="l",lty=2, col=2)
matlines(rollmean(Elakedata$DecYear,10),rollmean((Elakedata$Elake_aeroHar_S)+14,10),type="l",lty=1, col=3)
matlines(rollmean(Elakedata$DecYear,10),rollmean((Elakedata$Elake_aero_S)+14,10),type="l",lty=2, col=3)


legend(2014, 20.5, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1,col=1:2:3);
legend(2016, 20.5, c("ERA_Harbeck","ERA_aero"),cex=0.8,col=1,lty=1:2);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/ElakeaerorollingmeanERA_HarbeckvERA_aero.pdf')
dev.off()


# Daily ERA water heat storage rolling mean
matplot(rollmean(DBVDfluxdata$DecYear,10),rollmean(DBVDfluxdata$G_DBVD_U,10),type="l",lty=1, col=1,ylim = c(-300,300),xlim = c(2012,2017),xlab="Decimal Day",ylab="Lake heat storage flux (W m-2)")
matlines(rollmean(DBVDfluxdata$DecYear,10),rollmean(DBVDfluxdata$G_DBVD_B,10),type="l",lty=1, col=2)
matlines(rollmean(DBVDfluxdata$DecYear,10),rollmean(DBVDfluxdata$G_DBVD_S,10),type="l",lty=1, col=3)

legend(2014, 300.0, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1:1,col=1:2:3);

abline(h = 0,col=16,lty=1)
text(100,-300,"Equilibrium method DBVD",cex=1.0)

box()
abline(v = 2008,col=16,lty=2)
abline(v = 2009,col=16,lty=2)
abline(v = 2010,col=16,lty=2)
abline(v = 2011,col=16,lty=2)
abline(v = 2012,col=16,lty=2)
abline(v = 2013,col=16,lty=2)
abline(v = 2014,col=16,lty=2)
abline(v = 2015,col=16,lty=2)
abline(v = 2016,col=16,lty=2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/G_DBVDheatstoragerollingmean.pdf')
dev.off()


# Daily ERA lake evaporation rolling mean, Ulken, DBVD
matplot(rollmean(Year2008DBVD$Doy,10),rollmean(Year2008DBVD$Elake_DBVD_U,10),type="l",lty=1, col=1,ylim = c(-50,200),xlim = c(0,365),xlab="Decimal Day",ylab="Lake evaporation flux (W m-2)")
matlines(rollmean(Year2009DBVD$Doy,10),rollmean(Year2009DBVD$Elake_DBVD_U,10),type="l",lty=1, col=2)
matlines(rollmean(Year2010DBVD$Doy,10),rollmean(Year2010DBVD$Elake_DBVD_U,10),type="l",lty=1, col=3)
matlines(rollmean(Year2011DBVD$Doy,10),rollmean(Year2011DBVD$Elake_DBVD_U,10),type="l",lty=1, col=4)
matlines(rollmean(Year2012DBVD$Doy,10),rollmean(Year2012DBVD$Elake_DBVD_U,10),type="l",lty=1, col=5)
matlines(rollmean(Year2013DBVD$Doy,10),rollmean(Year2013DBVD$Elake_DBVD_U,10),type="l",lty=1, col=6)
matlines(rollmean(Year2014DBVD$Doy,10),rollmean(Year2014DBVD$Elake_DBVD_U,10),type="l",lty=1, col=7)
matlines(rollmean(Year2015DBVD$Doy,10),rollmean(Year2015DBVD$Elake_DBVD_U,10),type="l",lty=1, col=8)
matlines(rollmean(Year2016DBVD$Doy,10),rollmean(Year2016DBVD$Elake_DBVD_U,10),type="l",lty=2, col=9)

text(275,200,"Ulken Shabahkty",cex=1.0)
text(100,-50,"Equilibrium method DBVD",cex=1.0)

legend(0, 200.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);

abline(h = 0,col=16,lty=1)

box()

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/LakeevvaporationrollingmeanUlkenseasonalallyears.pdf')
dev.off()



# Daily ERA lake evaporation rolling mean, Burabay,DBVD
matplot(rollmean(Year2008DBVD$Doy,10),rollmean(Year2008DBVD$Elake_DBVD_B,10),type="l",lty=1, col=1,ylim = c(-50,200),xlim = c(0,365),xlab="Decimal Day",ylab="Lake evaporation flux (W m-2)")
matlines(rollmean(Year2009DBVD$Doy,10),rollmean(Year2009DBVD$Elake_DBVD_B,10),type="l",lty=1, col=2)
matlines(rollmean(Year2010DBVD$Doy,10),rollmean(Year2010DBVD$Elake_DBVD_B,10),type="l",lty=1, col=3)
matlines(rollmean(Year2011DBVD$Doy,10),rollmean(Year2011DBVD$Elake_DBVD_B,10),type="l",lty=1, col=4)
matlines(rollmean(Year2012DBVD$Doy,10),rollmean(Year2012DBVD$Elake_DBVD_B,10),type="l",lty=1, col=5)
matlines(rollmean(Year2013DBVD$Doy,10),rollmean(Year2013DBVD$Elake_DBVD_B,10),type="l",lty=1, col=6)
matlines(rollmean(Year2014DBVD$Doy,10),rollmean(Year2014DBVD$Elake_DBVD_B,10),type="l",lty=1, col=7)
matlines(rollmean(Year2015DBVD$Doy,10),rollmean(Year2015DBVD$Elake_DBVD_B,10),type="l",lty=1, col=8)
matlines(rollmean(Year2016DBVD$Doy,10),rollmean(Year2016DBVD$Elake_DBVD_B,10),type="l",lty=2, col=9)

text(275,200,"Burabay",cex=1.0)
text(100,-50,"Equilibrium method DBVD",cex=1.0)

legend(0, 200.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);

abline(h = 0,col=16,lty=1)

box()

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/LakeevvaporationrollingmeanBurabayseasonalallyears.pdf')
dev.off()

# Daily ERA lake evaporation rolling mean, Shortandy,DBVD
matplot(rollmean(Year2008DBVD$Doy,10),rollmean(Year2008DBVD$Elake_DBVD_S,10),type="l",lty=1, col=1,ylim = c(-50,200),xlim = c(0,365),xlab="Decimal Day",ylab="Lake evaporation flux (W m-2)")
matlines(rollmean(Year2009DBVD$Doy,10),rollmean(Year2009DBVD$Elake_DBVD_S,10),type="l",lty=1, col=2)
matlines(rollmean(Year2010DBVD$Doy,10),rollmean(Year2010DBVD$Elake_DBVD_S,10),type="l",lty=1, col=3)
matlines(rollmean(Year2011DBVD$Doy,10),rollmean(Year2011DBVD$Elake_DBVD_S,10),type="l",lty=1, col=4)
matlines(rollmean(Year2012DBVD$Doy,10),rollmean(Year2012DBVD$Elake_DBVD_S,10),type="l",lty=1, col=5)
matlines(rollmean(Year2013DBVD$Doy,10),rollmean(Year2013DBVD$Elake_DBVD_S,10),type="l",lty=1, col=6)
matlines(rollmean(Year2014DBVD$Doy,10),rollmean(Year2014DBVD$Elake_DBVD_S,10),type="l",lty=1, col=7)
matlines(rollmean(Year2015DBVD$Doy,10),rollmean(Year2015DBVD$Elake_DBVD_S,10),type="l",lty=1, col=8)
matlines(rollmean(Year2016DBVD$Doy,10),rollmean(Year2016DBVD$Elake_DBVD_S,10),type="l",lty=2, col=9)

text(275,200,"Shortandy",cex=1.0)
text(100,-50,"Equilibrium method DBVD",cex=1.0)

legend(0, 200.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);

abline(h = 0,col=16,lty=1)

box()

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/LakeevvaporationrollingmeanShortandyseasonalallyears.pdf')
dev.off()


# Daily ERA lake net radiation rolling mean, Ulken
matplot(rollmean(Year2008DBVD$Doy,10),rollmean(Year2008DBVD$Rn_water_DBVD_U,10),type="l",lty=1, col=1,ylim = c(-50,250),xlim = c(0,365),xlab="Decimal Day",ylab="Lake net radiation flux (W m-2)")
matlines(rollmean(Year2009DBVD$Doy,10),rollmean(Year2009DBVD$Rn_water_DBVD_U,10),type="l",lty=1, col=2)
matlines(rollmean(Year2010DBVD$Doy,10),rollmean(Year2010DBVD$Rn_water_DBVD_U,10),type="l",lty=1, col=3)
matlines(rollmean(Year2011DBVD$Doy,10),rollmean(Year2011DBVD$Rn_water_DBVD_U,10),type="l",lty=1, col=4)
matlines(rollmean(Year2012DBVD$Doy,10),rollmean(Year2012DBVD$Rn_water_DBVD_U,10),type="l",lty=1, col=5)
matlines(rollmean(Year2013DBVD$Doy,10),rollmean(Year2013DBVD$Rn_water_DBVD_U,10),type="l",lty=1, col=6)
matlines(rollmean(Year2014DBVD$Doy,10),rollmean(Year2014DBVD$Rn_water_DBVD_U,10),type="l",lty=1, col=7)
matlines(rollmean(Year2015DBVD$Doy,10),rollmean(Year2015DBVD$Rn_water_DBVD_U,10),type="l",lty=1, col=8)
matlines(rollmean(Year2016DBVD$Doy,10),rollmean(Year2016DBVD$Rn_water_DBVD_U,10),type="l",lty=2, col=9)

text(275,200,"Ulken Shabahkty",cex=1.0)
text(100,-50,"Equilibrium method DBVD",cex=1.0)

legend(0, 200.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);

abline(h = 0,col=16,lty=1)

box()

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/LakenetradiationrollingmeanUlkenseasonalallyears.pdf')
dev.off()


# Daily ERA lake net radiation rolling mean, Burabay
matplot(rollmean(Year2008DBVD$Doy,10),rollmean(Year2008DBVD$Rn_water_DBVD_B,10),type="l",lty=1, col=1,ylim = c(-50,250),xlim = c(0,365),xlab="Decimal Day",ylab="Lake net radiation flux (W m-2)")
matlines(rollmean(Year2009DBVD$Doy,10),rollmean(Year2009DBVD$Rn_water_DBVD_B,10),type="l",lty=1, col=2)
matlines(rollmean(Year2010DBVD$Doy,10),rollmean(Year2010DBVD$Rn_water_DBVD_B,10),type="l",lty=1, col=3)
matlines(rollmean(Year2011DBVD$Doy,10),rollmean(Year2011DBVD$Rn_water_DBVD_B,10),type="l",lty=1, col=4)
matlines(rollmean(Year2012DBVD$Doy,10),rollmean(Year2012DBVD$Rn_water_DBVD_B,10),type="l",lty=1, col=5)
matlines(rollmean(Year2013DBVD$Doy,10),rollmean(Year2013DBVD$Rn_water_DBVD_B,10),type="l",lty=1, col=6)
matlines(rollmean(Year2014DBVD$Doy,10),rollmean(Year2014DBVD$Rn_water_DBVD_B,10),type="l",lty=1, col=7)
matlines(rollmean(Year2015DBVD$Doy,10),rollmean(Year2015DBVD$Rn_water_DBVD_B,10),type="l",lty=1, col=8)
matlines(rollmean(Year2016DBVD$Doy,10),rollmean(Year2016DBVD$Rn_water_DBVD_B,10),type="l",lty=2, col=9)

text(275,200,"Burabay",cex=1.0)
text(100,-50,"Equilibrium method DBVD",cex=1.0)

legend(0, 200.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);

abline(h = 0,col=16,lty=1)

box()

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/LakenetradiationrollingmeanBurabayseasonalallyears.pdf')
dev.off()

# Daily ERA lake net radiation rolling mean, Shortandy
matplot(rollmean(Year2008DBVD$Doy,10),rollmean(Year2008DBVD$Rn_water_DBVD_S,10),type="l",lty=1, col=1,ylim = c(-50,250),xlim = c(0,365),xlab="Decimal Day",ylab="Lake net radiation flux (W m-2)")
matlines(rollmean(Year2009DBVD$Doy,10),rollmean(Year2009DBVD$Rn_water_DBVD_S,10),type="l",lty=1, col=2)
matlines(rollmean(Year2010DBVD$Doy,10),rollmean(Year2010DBVD$Rn_water_DBVD_S,10),type="l",lty=1, col=3)
matlines(rollmean(Year2011DBVD$Doy,10),rollmean(Year2011DBVD$Rn_water_DBVD_S,10),type="l",lty=1, col=4)
matlines(rollmean(Year2012DBVD$Doy,10),rollmean(Year2012DBVD$Rn_water_DBVD_S,10),type="l",lty=1, col=5)
matlines(rollmean(Year2013DBVD$Doy,10),rollmean(Year2013DBVD$Rn_water_DBVD_S,10),type="l",lty=1, col=6)
matlines(rollmean(Year2014DBVD$Doy,10),rollmean(Year2014DBVD$Rn_water_DBVD_S,10),type="l",lty=1, col=7)
matlines(rollmean(Year2015DBVD$Doy,10),rollmean(Year2015DBVD$Rn_water_DBVD_S,10),type="l",lty=1, col=8)
matlines(rollmean(Year2016DBVD$Doy,10),rollmean(Year2016DBVD$Rn_water_DBVD_S,10),type="l",lty=2, col=9)

text(275,200,"Shortandy",cex=1.0)
text(100,-50,"Equilibrium method DBVD",cex=1.0)

legend(0, 200.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);

abline(h = 0,col=16,lty=1)

box()

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/LakenetradiationrollingmeanShortandyseasonalallyears.pdf')
dev.off()


# Daily ERA lake heat storage rolling mean, Ulken
matplot(rollmean(Year2008DBVD$Doy,10),rollmean(Year2008DBVD$G_DBVD_U,10),type="l",lty=1, col=1,ylim = c(-200,300),xlim = c(0,365),xlab="Decimal Day",ylab="Lake heat storage flux (W m-2)")
matlines(rollmean(Year2009DBVD$Doy,10),rollmean(Year2009DBVD$G_DBVD_U,10),type="l",lty=1, col=2)
matlines(rollmean(Year2010DBVD$Doy,10),rollmean(Year2010DBVD$G_DBVD_U,10),type="l",lty=1, col=3)
matlines(rollmean(Year2011DBVD$Doy,10),rollmean(Year2011DBVD$G_DBVD_U,10),type="l",lty=1, col=4)
matlines(rollmean(Year2012DBVD$Doy,10),rollmean(Year2012DBVD$G_DBVD_U,10),type="l",lty=1, col=5)
matlines(rollmean(Year2013DBVD$Doy,10),rollmean(Year2013DBVD$G_DBVD_U,10),type="l",lty=1, col=6)
matlines(rollmean(Year2014DBVD$Doy,10),rollmean(Year2014DBVD$G_DBVD_U,10),type="l",lty=1, col=7)
matlines(rollmean(Year2015DBVD$Doy,10),rollmean(Year2015DBVD$G_DBVD_U,10),type="l",lty=1, col=8)
matlines(rollmean(Year2016DBVD$Doy,10),rollmean(Year2016DBVD$G_DBVD_U,10),type="l",lty=2, col=9)

text(275,200,"Ulken Shabahkty",cex=1.0)
text(100,-200,"Equilibrium method DBVD",cex=1.0)

legend(0, 200.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);

abline(h = 0,col=16,lty=1)

box()

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/LakeheatstoragerollingmeanUlkenseasonalallyears.pdf')
dev.off()


# Daily ERA lake heat storage rolling mean, Burabay
matplot(rollmean(Year2008DBVD$Doy,10),rollmean(Year2008DBVD$G_DBVD_B,10),type="l",lty=1, col=1,ylim = c(-200,300),xlim = c(0,365),xlab="Decimal Day",ylab="Lake heat storage flux (W m-2)")
matlines(rollmean(Year2009DBVD$Doy,10),rollmean(Year2009DBVD$G_DBVD_B,10),type="l",lty=1, col=2)
matlines(rollmean(Year2010DBVD$Doy,10),rollmean(Year2010DBVD$G_DBVD_B,10),type="l",lty=1, col=3)
matlines(rollmean(Year2011DBVD$Doy,10),rollmean(Year2011DBVD$G_DBVD_B,10),type="l",lty=1, col=4)
matlines(rollmean(Year2012DBVD$Doy,10),rollmean(Year2012DBVD$G_DBVD_B,10),type="l",lty=1, col=5)
matlines(rollmean(Year2013DBVD$Doy,10),rollmean(Year2013DBVD$G_DBVD_B,10),type="l",lty=1, col=6)
matlines(rollmean(Year2014DBVD$Doy,10),rollmean(Year2014DBVD$G_DBVD_B,10),type="l",lty=1, col=7)
matlines(rollmean(Year2015DBVD$Doy,10),rollmean(Year2015DBVD$G_DBVD_B,10),type="l",lty=1, col=8)
matlines(rollmean(Year2016DBVD$Doy,10),rollmean(Year2016DBVD$G_DBVD_B,10),type="l",lty=2, col=9)

text(275,200,"Burabay",cex=1.0)
text(100,-200,"Equilibrium method DBVD",cex=1.0)

legend(0, 200.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);

abline(h = 0,col=16,lty=1)

box()

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/LakeheatstoragerollingmeanBurabayseasonalallyears.pdf')
dev.off()


# Daily ERA lake heat storage rolling mean, Shortandy
matplot(rollmean(Year2008DBVD$Doy,10),rollmean(Year2008DBVD$G_DBVD_S,10),type="l",lty=1, col=1,ylim = c(-200,300),xlim = c(0,365),xlab="Decimal Day",ylab="Lake heat storage flux (W m-2)")
matlines(rollmean(Year2009DBVD$Doy,10),rollmean(Year2009DBVD$G_DBVD_S,10),type="l",lty=1, col=2)
matlines(rollmean(Year2010DBVD$Doy,10),rollmean(Year2010DBVD$G_DBVD_S,10),type="l",lty=1, col=3)
matlines(rollmean(Year2011DBVD$Doy,10),rollmean(Year2011DBVD$G_DBVD_S,10),type="l",lty=1, col=4)
matlines(rollmean(Year2012DBVD$Doy,10),rollmean(Year2012DBVD$G_DBVD_S,10),type="l",lty=1, col=5)
matlines(rollmean(Year2013DBVD$Doy,10),rollmean(Year2013DBVD$G_DBVD_S,10),type="l",lty=1, col=6)
matlines(rollmean(Year2014DBVD$Doy,10),rollmean(Year2014DBVD$G_DBVD_S,10),type="l",lty=1, col=7)
matlines(rollmean(Year2015DBVD$Doy,10),rollmean(Year2015DBVD$G_DBVD_S,10),type="l",lty=1, col=8)
matlines(rollmean(Year2016DBVD$Doy,10),rollmean(Year2016DBVD$G_DBVD_S,10),type="l",lty=2, col=9)

text(275,200,"Shortandy",cex=1.0)
text(100,-200,"Equilibrium method DBVD",cex=1.0)

legend(0, 200.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);

abline(h = 0,col=16,lty=1)

box()

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/LakeheatstoragerollingmeanShortandyseasonalallyears.pdf')
dev.off()


# Daily ERA lake sensible heat rolling mean, Ulken
matplot(rollmean(Year2008DBVD$Doy,10),rollmean(Year2008DBVD$Hlake_DBVD_U,10),type="l",lty=1, col=1,ylim = c(-100,100),xlim = c(0,365),xlab="Decimal Day",ylab="Lake sensible heat flux (W m-2)")
matlines(rollmean(Year2009DBVD$Doy,10),rollmean(Year2009DBVD$Hlake_DBVD_U,10),type="l",lty=1, col=2)
matlines(rollmean(Year2010DBVD$Doy,10),rollmean(Year2010DBVD$Hlake_DBVD_U,10),type="l",lty=1, col=3)
matlines(rollmean(Year2011DBVD$Doy,10),rollmean(Year2011DBVD$Hlake_DBVD_U,10),type="l",lty=1, col=4)
matlines(rollmean(Year2012DBVD$Doy,10),rollmean(Year2012DBVD$Hlake_DBVD_U,10),type="l",lty=1, col=5)
matlines(rollmean(Year2013DBVD$Doy,10),rollmean(Year2013DBVD$Hlake_DBVD_U,10),type="l",lty=1, col=6)
matlines(rollmean(Year2014DBVD$Doy,10),rollmean(Year2014DBVD$Hlake_DBVD_U,10),type="l",lty=1, col=7)
matlines(rollmean(Year2015DBVD$Doy,10),rollmean(Year2015DBVD$Hlake_DBVD_U,10),type="l",lty=1, col=8)
matlines(rollmean(Year2016DBVD$Doy,10),rollmean(Year2016DBVD$Hlake_DBVD_U,10),type="l",lty=2, col=9)

text(275,100,"Ulken Shabahkty",cex=1.0)
text(100,-100,"Equilibrium method DBVD",cex=1.0)

legend(0, 100.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);

abline(h = 0,col=16,lty=1)

box()

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/LakesensibleheatrollingmeanUlkenseasonalallyears.pdf')
dev.off()

# Daily ERA lake sensible heat rolling mean, Burabay
matplot(rollmean(Year2008DBVD$Doy,10),rollmean(Year2008DBVD$Hlake_DBVD_B,10),type="l",lty=1, col=1,ylim = c(-100,100),xlim = c(0,365),xlab="Decimal Day",ylab="Lake sensible heat flux (W m-2)")
matlines(rollmean(Year2009DBVD$Doy,10),rollmean(Year2009DBVD$Hlake_DBVD_B,10),type="l",lty=1, col=2)
matlines(rollmean(Year2010DBVD$Doy,10),rollmean(Year2010DBVD$Hlake_DBVD_B,10),type="l",lty=1, col=3)
matlines(rollmean(Year2011DBVD$Doy,10),rollmean(Year2011DBVD$Hlake_DBVD_B,10),type="l",lty=1, col=4)
matlines(rollmean(Year2012DBVD$Doy,10),rollmean(Year2012DBVD$Hlake_DBVD_B,10),type="l",lty=1, col=5)
matlines(rollmean(Year2013DBVD$Doy,10),rollmean(Year2013DBVD$Hlake_DBVD_B,10),type="l",lty=1, col=6)
matlines(rollmean(Year2014DBVD$Doy,10),rollmean(Year2014DBVD$Hlake_DBVD_B,10),type="l",lty=1, col=7)
matlines(rollmean(Year2015DBVD$Doy,10),rollmean(Year2015DBVD$Hlake_DBVD_B,10),type="l",lty=1, col=8)
matlines(rollmean(Year2016DBVD$Doy,10),rollmean(Year2016DBVD$Hlake_DBVD_B,10),type="l",lty=2, col=9)

text(275,100,"Burabay",cex=1.0)
text(100,-100,"Equilibrium method DBVD",cex=0.8)

legend(0, 100.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);

abline(h = 0,col=16,lty=1)

box()

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/LakesensibleheatrollingmeanBurabayseasonalallyears.pdf')
dev.off()

# Daily ERA lake sensible heat rolling mean, Shortandy
matplot(rollmean(Year2008DBVD$Doy,10),rollmean(Year2008DBVD$Hlake_DBVD_S,10),type="l",lty=1, col=1,ylim = c(-100,100),xlim = c(0,365),xlab="Decimal Day",ylab="Lake sensible heat flux (W m-2)")
matlines(rollmean(Year2009DBVD$Doy,10),rollmean(Year2009DBVD$Hlake_DBVD_S,10),type="l",lty=1, col=2)
matlines(rollmean(Year2010DBVD$Doy,10),rollmean(Year2010DBVD$Hlake_DBVD_S,10),type="l",lty=1, col=3)
matlines(rollmean(Year2011DBVD$Doy,10),rollmean(Year2011DBVD$Hlake_DBVD_S,10),type="l",lty=1, col=4)
matlines(rollmean(Year2012DBVD$Doy,10),rollmean(Year2012DBVD$Hlake_DBVD_S,10),type="l",lty=1, col=5)
matlines(rollmean(Year2013DBVD$Doy,10),rollmean(Year2013DBVD$Hlake_DBVD_S,10),type="l",lty=1, col=6)
matlines(rollmean(Year2014DBVD$Doy,10),rollmean(Year2014DBVD$Hlake_DBVD_S,10),type="l",lty=1, col=7)
matlines(rollmean(Year2015DBVD$Doy,10),rollmean(Year2015DBVD$Hlake_DBVD_S,10),type="l",lty=1, col=8)
matlines(rollmean(Year2016DBVD$Doy,10),rollmean(Year2016DBVD$Hlake_DBVD_S,10),type="l",lty=2, col=9)

text(275,100,"Shortandy",cex=1.0)
text(100,-100,"Equilibrium method DBVD",cex=0.8)

legend(0, 100.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);

abline(h = 0,col=16,lty=1)

box()

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/LakesensibleheatrollingmeanShortandyseasonalallyears.pdf')
dev.off()


# Daily cumulative rainfall per year: P_Burabay= Burabaynew = KHM on Ulken northerns shore?
Year2008Meteo$cumP_Burabay <- cumsum(Year2008Meteo$P_Burabay)
Year2009Meteo$cumP_Burabay <- cumsum(Year2009Meteo$P_Burabay)
Year2010Meteo$cumP_Burabay <- cumsum(Year2010Meteo$P_Burabay)
Year2011Meteo$cumP_Burabay <- cumsum(Year2011Meteo$P_Burabay)
Year2012Meteo$cumP_Burabay <- cumsum(Year2012Meteo$P_Burabay)
Year2013Meteo$cumP_Burabay <- cumsum(Year2013Meteo$P_Burabay)
Year2014Meteo$cumP_Burabay <- cumsum(Year2014Meteo$P_Burabay)
Year2015Meteo$cumP_Burabay <- cumsum(Year2015Meteo$P_Burabay)
Year2016Meteo$cumP_Burabay <- cumsum(Year2016Meteo$P_Burabay)

# Daily cumulative rainfall per year: P_Burabay OW period only, ULken OW period
Year2008MeteoOW_U$cumP_Burabay <- cumsum(Year2008MeteoOW_U$P_Burabay)
Year2009MeteoOW_U$cumP_Burabay <- cumsum(Year2009MeteoOW_U$P_Burabay)
Year2010MeteoOW_U$cumP_Burabay <- cumsum(Year2010MeteoOW_U$P_Burabay)
Year2011MeteoOW_U$cumP_Burabay <- cumsum(Year2011MeteoOW_U$P_Burabay)
Year2012MeteoOW_U$cumP_Burabay <- cumsum(Year2012MeteoOW_U$P_Burabay)
Year2013MeteoOW_U$cumP_Burabay <- cumsum(Year2013MeteoOW_U$P_Burabay)
Year2014MeteoOW_U$cumP_Burabay <- cumsum(Year2014MeteoOW_U$P_Burabay)
Year2015MeteoOW_U$cumP_Burabay <- cumsum(Year2015MeteoOW_U$P_Burabay)
Year2016MeteoOW_U$cumP_Burabay <- cumsum(Year2016MeteoOW_U$P_Burabay)


# Daily cumulative rainfall per year: P_Shushinsk
Year2008Meteo$cumP_Shu <- cumsum(Year2008Meteo$P_Shu)
Year2009Meteo$cumP_Shu <- cumsum(Year2009Meteo$P_Shu)
Year2010Meteo$cumP_Shu <- cumsum(Year2010Meteo$P_Shu)
Year2011Meteo$cumP_Shu <- cumsum(Year2011Meteo$P_Shu)
Year2012Meteo$cumP_Shu <- cumsum(Year2012Meteo$P_Shu)
Year2013Meteo$cumP_Shu <- cumsum(Year2013Meteo$P_Shu)
Year2014Meteo$cumP_Shu <- cumsum(Year2014Meteo$P_Shu)
Year2015Meteo$cumP_Shu <- cumsum(Year2015Meteo$P_Shu)
Year2016Meteo$cumP_Shu <- cumsum(Year2016Meteo$P_Shu)

# Daily cumulative rainfall per year: P_Shushinsk, OW period Burabay
Year2008MeteoOW_B$cumP_Shu <- cumsum(Year2008MeteoOW_B$P_Shu)
Year2009MeteoOW_B$cumP_Shu <- cumsum(Year2009MeteoOW_B$P_Shu)
Year2010MeteoOW_B$cumP_Shu <- cumsum(Year2010MeteoOW_B$P_Shu)
Year2011MeteoOW_B$cumP_Shu <- cumsum(Year2011MeteoOW_B$P_Shu)
Year2012MeteoOW_B$cumP_Shu <- cumsum(Year2012MeteoOW_B$P_Shu)
Year2013MeteoOW_B$cumP_Shu <- cumsum(Year2013MeteoOW_B$P_Shu)
Year2014MeteoOW_B$cumP_Shu <- cumsum(Year2014MeteoOW_B$P_Shu)
Year2015MeteoOW_B$cumP_Shu <- cumsum(Year2015MeteoOW_B$P_Shu)
Year2016MeteoOW_B$cumP_Shu <- cumsum(Year2016MeteoOW_B$P_Shu)

# Daily cumulative rainfall per year: P_Shushinsk, OW period Shortandy
Year2008MeteoOW_S$cumP_Shu <- cumsum(Year2008MeteoOW_S$P_Shu)
Year2009MeteoOW_S$cumP_Shu <- cumsum(Year2009MeteoOW_S$P_Shu)
Year2010MeteoOW_S$cumP_Shu <- cumsum(Year2010MeteoOW_S$P_Shu)
Year2011MeteoOW_S$cumP_Shu <- cumsum(Year2011MeteoOW_S$P_Shu)
Year2012MeteoOW_S$cumP_Shu <- cumsum(Year2012MeteoOW_S$P_Shu)
Year2013MeteoOW_S$cumP_Shu <- cumsum(Year2013MeteoOW_S$P_Shu)
Year2014MeteoOW_S$cumP_Shu <- cumsum(Year2014MeteoOW_S$P_Shu)
Year2015MeteoOW_S$cumP_Shu <- cumsum(Year2015MeteoOW_S$P_Shu)
Year2016MeteoOW_S$cumP_Shu <- cumsum(Year2016MeteoOW_S$P_Shu)

# Daily cumulative evaporation DBVD per year, Ulken in mm

Year2008DBVD$cumElake_DBVD_U <- cumsum(0.035*Year2008DBVD$Elake_DBVD_U)
Year2009DBVD$cumElake_DBVD_U <- cumsum(0.035*Year2009DBVD$Elake_DBVD_U)
Year2010DBVD$cumElake_DBVD_U <- cumsum(0.035*Year2010DBVD$Elake_DBVD_U)
Year2011DBVD$cumElake_DBVD_U <- cumsum(0.035*Year2011DBVD$Elake_DBVD_U)
Year2012DBVD$cumElake_DBVD_U <- cumsum(0.035*Year2012DBVD$Elake_DBVD_U)
Year2013DBVD$cumElake_DBVD_U <- cumsum(0.035*Year2013DBVD$Elake_DBVD_U)
Year2014DBVD$cumElake_DBVD_U <- cumsum(0.035*Year2014DBVD$Elake_DBVD_U)
Year2015DBVD$cumElake_DBVD_U <- cumsum(0.035*Year2015DBVD$Elake_DBVD_U)
Year2016DBVD$cumElake_DBVD_U <- cumsum(0.035*Year2016DBVD$Elake_DBVD_U)

# Daily cumulative evaporation DBVD per year, Burabay in mm

Year2008DBVD$cumElake_DBVD_B <- cumsum(0.035*Year2008DBVD$Elake_DBVD_B)
Year2009DBVD$cumElake_DBVD_B <- cumsum(0.035*Year2009DBVD$Elake_DBVD_B)
Year2010DBVD$cumElake_DBVD_B <- cumsum(0.035*Year2010DBVD$Elake_DBVD_B)
Year2011DBVD$cumElake_DBVD_B <- cumsum(0.035*Year2011DBVD$Elake_DBVD_B)
Year2012DBVD$cumElake_DBVD_B <- cumsum(0.035*Year2012DBVD$Elake_DBVD_B)
Year2013DBVD$cumElake_DBVD_B <- cumsum(0.035*Year2013DBVD$Elake_DBVD_B)
Year2014DBVD$cumElake_DBVD_B <- cumsum(0.035*Year2014DBVD$Elake_DBVD_B)
Year2015DBVD$cumElake_DBVD_B <- cumsum(0.035*Year2015DBVD$Elake_DBVD_B)
Year2016DBVD$cumElake_DBVD_B <- cumsum(0.035*Year2016DBVD$Elake_DBVD_B)

# Daily cumulative evaporation DBVD per year, Shortandy in mm

Year2008DBVD$cumElake_DBVD_S <- cumsum(0.035*Year2008DBVD$Elake_DBVD_S)
Year2009DBVD$cumElake_DBVD_S <- cumsum(0.035*Year2009DBVD$Elake_DBVD_S)
Year2010DBVD$cumElake_DBVD_S <- cumsum(0.035*Year2010DBVD$Elake_DBVD_S)
Year2011DBVD$cumElake_DBVD_S <- cumsum(0.035*Year2011DBVD$Elake_DBVD_S)
Year2012DBVD$cumElake_DBVD_S <- cumsum(0.035*Year2012DBVD$Elake_DBVD_S)
Year2013DBVD$cumElake_DBVD_S <- cumsum(0.035*Year2013DBVD$Elake_DBVD_S)
Year2014DBVD$cumElake_DBVD_S <- cumsum(0.035*Year2014DBVD$Elake_DBVD_S)
Year2015DBVD$cumElake_DBVD_S <- cumsum(0.035*Year2015DBVD$Elake_DBVD_S)
Year2016DBVD$cumElake_DBVD_S <- cumsum(0.035*Year2016DBVD$Elake_DBVD_S)

# Daily cumulative evaporation DBVD per year, Ulken in mm, OW period only

Year2008DBVDOW_U$cumElake_DBVD_U <- cumsum(0.035*Year2008DBVDOW_U$Elake_DBVD_U)
Year2009DBVDOW_U$cumElake_DBVD_U <- cumsum(0.035*Year2009DBVDOW_U$Elake_DBVD_U)
Year2010DBVDOW_U$cumElake_DBVD_U <- cumsum(0.035*Year2010DBVDOW_U$Elake_DBVD_U)
Year2011DBVDOW_U$cumElake_DBVD_U <- cumsum(0.035*Year2011DBVDOW_U$Elake_DBVD_U)
Year2012DBVDOW_U$cumElake_DBVD_U <- cumsum(0.035*Year2012DBVDOW_U$Elake_DBVD_U)
Year2013DBVDOW_U$cumElake_DBVD_U <- cumsum(0.035*Year2013DBVDOW_U$Elake_DBVD_U)
Year2014DBVDOW_U$cumElake_DBVD_U <- cumsum(0.035*Year2014DBVDOW_U$Elake_DBVD_U)
Year2015DBVDOW_U$cumElake_DBVD_U <- cumsum(0.035*Year2015DBVDOW_U$Elake_DBVD_U)
Year2016DBVDOW_U$cumElake_DBVD_U <- cumsum(0.035*Year2016DBVDOW_U$Elake_DBVD_U)

# Daily cumulative evaporation DBVD per year, Burabay in mm, OW period only

Year2008DBVDOW_B$cumElake_DBVD_B <- cumsum(0.035*Year2008DBVDOW_B$Elake_DBVD_B)
Year2009DBVDOW_B$cumElake_DBVD_B <- cumsum(0.035*Year2009DBVDOW_B$Elake_DBVD_B)
Year2010DBVDOW_B$cumElake_DBVD_B <- cumsum(0.035*Year2010DBVDOW_B$Elake_DBVD_B)
Year2011DBVDOW_B$cumElake_DBVD_B <- cumsum(0.035*Year2011DBVDOW_B$Elake_DBVD_B)
Year2012DBVDOW_B$cumElake_DBVD_B <- cumsum(0.035*Year2012DBVDOW_B$Elake_DBVD_B)
Year2013DBVDOW_B$cumElake_DBVD_B <- cumsum(0.035*Year2013DBVDOW_B$Elake_DBVD_B)
Year2014DBVDOW_B$cumElake_DBVD_B <- cumsum(0.035*Year2014DBVDOW_B$Elake_DBVD_B)
Year2015DBVDOW_B$cumElake_DBVD_B <- cumsum(0.035*Year2015DBVDOW_B$Elake_DBVD_B)
Year2016DBVDOW_B$cumElake_DBVD_B <- cumsum(0.035*Year2016DBVDOW_B$Elake_DBVD_B)

# Daily cumulative evaporation DBVD per year, Shortandy in mm, OW period only

Year2008DBVDOW_S$cumElake_DBVD_S <- cumsum(0.035*Year2008DBVDOW_S$Elake_DBVD_S)
Year2009DBVDOW_S$cumElake_DBVD_S <- cumsum(0.035*Year2009DBVDOW_S$Elake_DBVD_S)
Year2010DBVDOW_S$cumElake_DBVD_S <- cumsum(0.035*Year2010DBVDOW_S$Elake_DBVD_S)
Year2011DBVDOW_S$cumElake_DBVD_S <- cumsum(0.035*Year2011DBVDOW_S$Elake_DBVD_S)
Year2012DBVDOW_S$cumElake_DBVD_S <- cumsum(0.035*Year2012DBVDOW_S$Elake_DBVD_S)
Year2013DBVDOW_S$cumElake_DBVD_S <- cumsum(0.035*Year2013DBVDOW_S$Elake_DBVD_S)
Year2014DBVDOW_S$cumElake_DBVD_S <- cumsum(0.035*Year2014DBVDOW_S$Elake_DBVD_S)
Year2015DBVDOW_S$cumElake_DBVD_S <- cumsum(0.035*Year2015DBVDOW_S$Elake_DBVD_S)
Year2016DBVDOW_S$cumElake_DBVD_S <- cumsum(0.035*Year2016DBVDOW_S$Elake_DBVD_S)



# Daily cumulative P-E per year: P_Burabay= Burabaynew = KHM on Ulken northerns shore? Ulken
Year2008Meteo$cumPminusE_DBVD_U <- cumsum(Year2008Meteo$P_Burabay-0.035*Year2008DBVD$Elake_DBVD_U)
Year2009Meteo$cumPminusE_DBVD_U <- cumsum(Year2009Meteo$P_Burabay-0.035*Year2009DBVD$Elake_DBVD_U)
Year2010Meteo$cumPminusE_DBVD_U <- cumsum(Year2010Meteo$P_Burabay-0.035*Year2010DBVD$Elake_DBVD_U)
Year2011Meteo$cumPminusE_DBVD_U <- cumsum(Year2011Meteo$P_Burabay-0.035*Year2011DBVD$Elake_DBVD_U)
Year2012Meteo$cumPminusE_DBVD_U <- cumsum(Year2012Meteo$P_Burabay-0.035*Year2012DBVD$Elake_DBVD_U)
Year2013Meteo$cumPminusE_DBVD_U <- cumsum(Year2013Meteo$P_Burabay-0.035*Year2013DBVD$Elake_DBVD_U)
Year2014Meteo$cumPminusE_DBVD_U <- cumsum(Year2014Meteo$P_Burabay-0.035*Year2014DBVD$Elake_DBVD_U)
Year2015Meteo$cumPminusE_DBVD_U <- cumsum(Year2015Meteo$P_Burabay-0.035*Year2015DBVD$Elake_DBVD_U)
Year2016Meteo$cumPminusE_DBVD_U <- cumsum(Year2016Meteo$P_Burabay-0.035*Year2016DBVD$Elake_DBVD_U)

# Daily cumulative P-E per year: P_Burabay= Burabaynew = KHM on Ulken northerns shore? Ulken OW period only
Year2008MeteoOW_U$cumPminusE_DBVD_U <- cumsum(Year2008MeteoOW_U$P_Burabay-0.035*Year2008DBVDOW_U$Elake_DBVD_U)
Year2009MeteoOW_U$cumPminusE_DBVD_U <- cumsum(Year2009MeteoOW_U$P_Burabay-0.035*Year2009DBVDOW_U$Elake_DBVD_U)
Year2010MeteoOW_U$cumPminusE_DBVD_U <- cumsum(Year2010MeteoOW_U$P_Burabay-0.035*Year2010DBVDOW_U$Elake_DBVD_U)
Year2011MeteoOW_U$cumPminusE_DBVD_U <- cumsum(Year2011MeteoOW_U$P_Burabay-0.035*Year2011DBVDOW_U$Elake_DBVD_U)
Year2012MeteoOW_U$cumPminusE_DBVD_U <- cumsum(Year2012MeteoOW_U$P_Burabay-0.035*Year2012DBVDOW_U$Elake_DBVD_U)
Year2013MeteoOW_U$cumPminusE_DBVD_U <- cumsum(Year2013MeteoOW_U$P_Burabay-0.035*Year2013DBVDOW_U$Elake_DBVD_U)
Year2014MeteoOW_U$cumPminusE_DBVD_U <- cumsum(Year2014MeteoOW_U$P_Burabay-0.035*Year2014DBVDOW_U$Elake_DBVD_U)
Year2015MeteoOW_U$cumPminusE_DBVD_U <- cumsum(Year2015MeteoOW_U$P_Burabay-0.035*Year2015DBVDOW_U$Elake_DBVD_U)
Year2016MeteoOW_U$cumPminusE_DBVD_U <- cumsum(Year2016MeteoOW_U$P_Burabay-0.035*Year2016DBVDOW_U$Elake_DBVD_U)


# Daily cumulative P-E per year: using Shuschinsk rainfall, Burabay

Year2008Meteo$cumPminusE_DBVD_B <- cumsum(Year2008Meteo$P_Shu-0.035*Year2008DBVD$Elake_DBVD_B)
Year2009Meteo$cumPminusE_DBVD_B <- cumsum(Year2009Meteo$P_Shu-0.035*Year2009DBVD$Elake_DBVD_B)
Year2010Meteo$cumPminusE_DBVD_B <- cumsum(Year2010Meteo$P_Shu-0.035*Year2010DBVD$Elake_DBVD_B)
Year2011Meteo$cumPminusE_DBVD_B <- cumsum(Year2011Meteo$P_Shu-0.035*Year2011DBVD$Elake_DBVD_B)
Year2012Meteo$cumPminusE_DBVD_B <- cumsum(Year2012Meteo$P_Shu-0.035*Year2012DBVD$Elake_DBVD_B)
Year2013Meteo$cumPminusE_DBVD_B <- cumsum(Year2013Meteo$P_Shu-0.035*Year2013DBVD$Elake_DBVD_B)
Year2014Meteo$cumPminusE_DBVD_B <- cumsum(Year2014Meteo$P_Shu-0.035*Year2014DBVD$Elake_DBVD_B)
Year2015Meteo$cumPminusE_DBVD_B <- cumsum(Year2015Meteo$P_Shu-0.035*Year2015DBVD$Elake_DBVD_B)
Year2016Meteo$cumPminusE_DBVD_B <- cumsum(Year2016Meteo$P_Shu-0.035*Year2016DBVD$Elake_DBVD_B)

# Daily cumulative P-E per year: P_Shu  Burabay OW period only
Year2008MeteoOW_B$cumPminusE_DBVD_B <- cumsum(Year2008MeteoOW_B$P_Shu-0.035*Year2008DBVDOW_B$Elake_DBVD_B)
Year2009MeteoOW_B$cumPminusE_DBVD_B <- cumsum(Year2009MeteoOW_B$P_Shu-0.035*Year2009DBVDOW_B$Elake_DBVD_B)
Year2010MeteoOW_B$cumPminusE_DBVD_B <- cumsum(Year2010MeteoOW_B$P_Shu-0.035*Year2010DBVDOW_B$Elake_DBVD_B)
Year2011MeteoOW_B$cumPminusE_DBVD_B <- cumsum(Year2011MeteoOW_B$P_Shu-0.035*Year2011DBVDOW_B$Elake_DBVD_B)
Year2012MeteoOW_B$cumPminusE_DBVD_B <- cumsum(Year2012MeteoOW_B$P_Shu-0.035*Year2012DBVDOW_B$Elake_DBVD_B)
Year2013MeteoOW_B$cumPminusE_DBVD_B <- cumsum(Year2013MeteoOW_B$P_Shu-0.035*Year2013DBVDOW_B$Elake_DBVD_B)
Year2014MeteoOW_B$cumPminusE_DBVD_B <- cumsum(Year2014MeteoOW_B$P_Shu-0.035*Year2014DBVDOW_B$Elake_DBVD_B)
Year2015MeteoOW_B$cumPminusE_DBVD_B <- cumsum(Year2015MeteoOW_B$P_Shu-0.035*Year2015DBVDOW_B$Elake_DBVD_B)
Year2016MeteoOW_B$cumPminusE_DBVD_B <- cumsum(Year2016MeteoOW_B$P_Shu-0.035*Year2016DBVDOW_B$Elake_DBVD_B)

# Daily cumulative P-E per year: using Shuschinsk rainfall, Shortandy

Year2008Meteo$cumPminusE_DBVD_S <- cumsum(Year2008Meteo$P_Shu-0.035*Year2008DBVD$Elake_DBVD_S)
Year2009Meteo$cumPminusE_DBVD_S <- cumsum(Year2009Meteo$P_Shu-0.035*Year2009DBVD$Elake_DBVD_S)
Year2010Meteo$cumPminusE_DBVD_S <- cumsum(Year2010Meteo$P_Shu-0.035*Year2010DBVD$Elake_DBVD_S)
Year2011Meteo$cumPminusE_DBVD_S <- cumsum(Year2011Meteo$P_Shu-0.035*Year2011DBVD$Elake_DBVD_S)
Year2012Meteo$cumPminusE_DBVD_S <- cumsum(Year2012Meteo$P_Shu-0.035*Year2012DBVD$Elake_DBVD_S)
Year2013Meteo$cumPminusE_DBVD_S <- cumsum(Year2013Meteo$P_Shu-0.035*Year2013DBVD$Elake_DBVD_S)
Year2014Meteo$cumPminusE_DBVD_S <- cumsum(Year2014Meteo$P_Shu-0.035*Year2014DBVD$Elake_DBVD_S)
Year2015Meteo$cumPminusE_DBVD_S <- cumsum(Year2015Meteo$P_Shu-0.035*Year2015DBVD$Elake_DBVD_S)
Year2016Meteo$cumPminusE_DBVD_S <- cumsum(Year2016Meteo$P_Shu-0.035*Year2016DBVD$Elake_DBVD_S)

# Daily cumulative P-E per year: P_Shu Shortandy OW period only
Year2008MeteoOW_S$cumPminusE_DBVD_S <- cumsum(Year2008MeteoOW_S$P_Shu-0.035*Year2008DBVDOW_S$Elake_DBVD_S)
Year2009MeteoOW_S$cumPminusE_DBVD_S <- cumsum(Year2009MeteoOW_S$P_Shu-0.035*Year2009DBVDOW_S$Elake_DBVD_S)
Year2010MeteoOW_S$cumPminusE_DBVD_S <- cumsum(Year2010MeteoOW_S$P_Shu-0.035*Year2010DBVDOW_S$Elake_DBVD_S)
Year2011MeteoOW_S$cumPminusE_DBVD_S <- cumsum(Year2011MeteoOW_S$P_Shu-0.035*Year2011DBVDOW_S$Elake_DBVD_S)
Year2012MeteoOW_S$cumPminusE_DBVD_S <- cumsum(Year2012MeteoOW_S$P_Shu-0.035*Year2012DBVDOW_S$Elake_DBVD_S)
Year2013MeteoOW_S$cumPminusE_DBVD_S <- cumsum(Year2013MeteoOW_S$P_Shu-0.035*Year2013DBVDOW_S$Elake_DBVD_S)
Year2014MeteoOW_S$cumPminusE_DBVD_S <- cumsum(Year2014MeteoOW_S$P_Shu-0.035*Year2014DBVDOW_S$Elake_DBVD_S)
Year2015MeteoOW_S$cumPminusE_DBVD_S <- cumsum(Year2015MeteoOW_S$P_Shu-0.035*Year2015DBVDOW_S$Elake_DBVD_S)
Year2016MeteoOW_S$cumPminusE_DBVD_S <- cumsum(Year2016MeteoOW_S$P_Shu-0.035*Year2016DBVDOW_S$Elake_DBVD_S)

matplot(Year2008Meteo$Doy,Year2008Meteo$cumP_Burabay,type="l",lty=1, col=1,ylim = c(0,500),xlim = c(0,365),xlab="Doy",ylab=" Cumulative Precipitation (mm)")
matlines(Year2009Meteo$Doy,Year2009Meteo$cumP_Burabay,type="l",lty=1,col=2)
matlines(Year2010Meteo$Doy,Year2010Meteo$cumP_Burabay,type="l",lty=1,col=3)
matlines(Year2011Meteo$Doy,Year2011Meteo$cumP_Burabay,type="l",lty=1,col=4)
matlines(Year2012Meteo$Doy,Year2012Meteo$cumP_Burabay,type="l",lty=1,col=5)
matlines(Year2013Meteo$Doy,Year2013Meteo$cumP_Burabay,type="l",lty=1,col=6)
matlines(Year2014Meteo$Doy,Year2014Meteo$cumP_Burabay,type="l",lty=1,col=7)
matlines(Year2015Meteo$Doy,Year2015Meteo$cumP_Burabay,type="l",lty=1,col=8)
matlines(Year2016Meteo$Doy,Year2016Meteo$cumP_Burabay,type="l",lty=2,col=9)


text(200,0.0,"P_Burabay= Burabaynew = KHM on Ulken northerns shore? ",cex=0.8)


legend(0, 500.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);


dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/CumulativerainfallallyearsBurabaynewKHMgauge.pdf')
dev.off()

matplot(Year2008MeteoOW_U$Doy,Year2008MeteoOW_U$cumP_Burabay,type="l",lty=1, col=1,ylim = c(0,500),xlim = c(0,365),xlab="Doy",ylab=" Cumulative Precipitation (mm)")
matlines(Year2009MeteoOW_U$Doy,Year2009MeteoOW_U$cumP_Burabay,type="l",lty=1,col=2)
matlines(Year2010MeteoOW_U$Doy,Year2010MeteoOW_U$cumP_Burabay,type="l",lty=1,col=3)
matlines(Year2011MeteoOW_U$Doy,Year2011MeteoOW_U$cumP_Burabay,type="l",lty=1,col=4)
matlines(Year2012MeteoOW_U$Doy,Year2012MeteoOW_U$cumP_Burabay,type="l",lty=1,col=5)
matlines(Year2013MeteoOW_U$Doy,Year2013MeteoOW_U$cumP_Burabay,type="l",lty=1,col=6)
matlines(Year2014MeteoOW_U$Doy,Year2014MeteoOW_U$cumP_Burabay,type="l",lty=1,col=7)
matlines(Year2015MeteoOW_U$Doy,Year2015MeteoOW_U$cumP_Burabay,type="l",lty=1,col=8)
matlines(Year2016MeteoOW_U$Doy,Year2016MeteoOW_U$cumP_Burabay,type="l",lty=2,col=9)



text(200,500.0,"P_Burabay= Burabaynew = KHM on Ulken northerns shore? ",cex=0.8)
text(100,200.,"OW period",cex=0.8)



legend(0, 500.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);


dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/CumulativerainfallallyearsBurabaynewKHMgaugeOWperiod.pdf')
dev.off()


matplot(Year2008Meteo$Doy,Year2008Meteo$cumP_Shu,type="l",lty=1, col=1,ylim = c(0,500),xlim = c(0,365),xlab="Doy",ylab=" Cumulative Precipitation (mm)")
matlines(Year2009Meteo$Doy,Year2009Meteo$cumP_Shu,type="l",lty=1,col=2)
matlines(Year2010Meteo$Doy,Year2010Meteo$cumP_Shu,type="l",lty=1,col=3)
matlines(Year2011Meteo$Doy,Year2011Meteo$cumP_Shu,type="l",lty=1,col=4)
matlines(Year2012Meteo$Doy,Year2012Meteo$cumP_Shu,type="l",lty=1,col=5)
matlines(Year2013Meteo$Doy,Year2013Meteo$cumP_Shu,type="l",lty=1,col=6)
matlines(Year2014Meteo$Doy,Year2014Meteo$cumP_Shu,type="l",lty=1,col=7)
matlines(Year2015Meteo$Doy,Year2015Meteo$cumP_Shu,type="l",lty=1,col=8)
matlines(Year2016Meteo$Doy,Year2016Meteo$cumP_Shu,type="l",lty=2,col=9)

text(275,100,"P_Shu, 2016 missing ",cex=1.0)


legend(0, 500.0, c("2008","2009","2010","2011","2012","2013","2014","2015"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8);


dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/CumulativerainfallallyearsShuchinsk.pdf')
dev.off()

matplot(Year2008MeteoOW_B$Doy,Year2008MeteoOW_B$cumP_Shu,type="l",lty=1, col=1,ylim = c(0,500),xlim = c(0,365),xlab="Doy",ylab=" Cumulative Precipitation (mm)")
matlines(Year2009MeteoOW_B$Doy,Year2009MeteoOW_B$cumP_Shu,type="l",lty=1,col=2)
matlines(Year2010MeteoOW_B$Doy,Year2010MeteoOW_B$cumP_Shu,type="l",lty=1,col=3)
matlines(Year2011MeteoOW_B$Doy,Year2011MeteoOW_B$cumP_Shu,type="l",lty=1,col=4)
matlines(Year2012MeteoOW_B$Doy,Year2012MeteoOW_B$cumP_Shu,type="l",lty=1,col=5)
matlines(Year2013MeteoOW_B$Doy,Year2013MeteoOW_B$cumP_Shu,type="l",lty=1,col=6)
matlines(Year2014MeteoOW_B$Doy,Year2014MeteoOW_B$cumP_Shu,type="l",lty=1,col=7)
matlines(Year2015MeteoOW_B$Doy,Year2015MeteoOW_B$cumP_Shu,type="l",lty=1,col=8)
matlines(Year2016MeteoOW_B$Doy,Year2016MeteoOW_B$cumP_Shu,type="l",lty=2,col=9)

text(200,500,"P_Shu, 2016 missing, Burabay OW ",cex=1.0)


legend(0, 500.0, c("2008","2009","2010","2011","2012","2013","2014","2015"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8);


dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/CumulativerainfallallyearsShuchinskOWBurabay.pdf')
dev.off()

matplot(Year2008MeteoOW_S$Doy,Year2008MeteoOW_S$cumP_Shu,type="l",lty=1, col=1,ylim = c(0,500),xlim = c(0,365),xlab="Doy",ylab=" Cumulative Precipitation (mm)")
matlines(Year2009MeteoOW_S$Doy,Year2009MeteoOW_S$cumP_Shu,type="l",lty=1,col=2)
matlines(Year2010MeteoOW_S$Doy,Year2010MeteoOW_S$cumP_Shu,type="l",lty=1,col=3)
matlines(Year2011MeteoOW_S$Doy,Year2011MeteoOW_S$cumP_Shu,type="l",lty=1,col=4)
matlines(Year2012MeteoOW_S$Doy,Year2012MeteoOW_S$cumP_Shu,type="l",lty=1,col=5)
matlines(Year2013MeteoOW_S$Doy,Year2013MeteoOW_S$cumP_Shu,type="l",lty=1,col=6)
matlines(Year2014MeteoOW_S$Doy,Year2014MeteoOW_S$cumP_Shu,type="l",lty=1,col=7)
matlines(Year2015MeteoOW_S$Doy,Year2015MeteoOW_S$cumP_Shu,type="l",lty=1,col=8)
matlines(Year2016MeteoOW_S$Doy,Year2016MeteoOW_S$cumP_Shu,type="l",lty=2,col=9)

text(200,500,"P_Shu, 2016 missing, Shortandy OW ",cex=1.0)


legend(0, 500.0, c("2008","2009","2010","2011","2012","2013","2014","2015"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8);


dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/CumulativerainfallallyearsShuchinskOWShortandy.pdf')
dev.off()


matplot(Year2008Meteo$Doy,Year2008DBVD$cumElake_DBVD_U,type="l",lty=1, col=1,ylim = c(0,800),xlim = c(0,365),xlab="Doy",ylab=" Cumulative Evaporation DBVD (mm)")
matlines(Year2009Meteo$Doy,Year2009DBVD$cumElake_DBVD_U,type="l",lty=1,col=2)
matlines(Year2010Meteo$Doy,Year2010DBVD$cumElake_DBVD_U,type="l",lty=1,col=3)
matlines(Year2011Meteo$Doy,Year2011DBVD$cumElake_DBVD_U,type="l",lty=1,col=4)
matlines(Year2012Meteo$Doy,Year2012DBVD$cumElake_DBVD_U,type="l",lty=1,col=5)
matlines(Year2013Meteo$Doy,Year2013DBVD$cumElake_DBVD_U,type="l",lty=1,col=6)
matlines(Year2014Meteo$Doy,Year2014DBVD$cumElake_DBVD_U,type="l",lty=1,col=7)
matlines(Year2015Meteo$Doy,Year2015DBVD$cumElake_DBVD_U,type="l",lty=1,col=8)
matlines(Year2016Meteo$Doy,Year2016DBVD$cumElake_DBVD_U,type="l",lty=2,col=9)

text(275,100,"Ulken Shabahkty",cex=1.0)
text(200,0,"Equilibrium method DBVD",cex=0.8)

legend(0, 700.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);


dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/CumulativelakeevaporationDBVDUlkenallyears.pdf')
dev.off()


matplot(Year2008Meteo$Doy,Year2008DBVD$cumElake_DBVD_B,type="l",lty=1, col=1,ylim = c(0,800),xlim = c(0,365),xlab="Doy",ylab=" Cumulative Evaporation DBVD (mm)")
matlines(Year2009Meteo$Doy,Year2009DBVD$cumElake_DBVD_B,type="l",lty=1,col=2)
matlines(Year2010Meteo$Doy,Year2010DBVD$cumElake_DBVD_B,type="l",lty=1,col=3)
matlines(Year2011Meteo$Doy,Year2011DBVD$cumElake_DBVD_B,type="l",lty=1,col=4)
matlines(Year2012Meteo$Doy,Year2012DBVD$cumElake_DBVD_B,type="l",lty=1,col=5)
matlines(Year2013Meteo$Doy,Year2013DBVD$cumElake_DBVD_B,type="l",lty=1,col=6)
matlines(Year2014Meteo$Doy,Year2014DBVD$cumElake_DBVD_B,type="l",lty=1,col=7)
matlines(Year2015Meteo$Doy,Year2015DBVD$cumElake_DBVD_B,type="l",lty=1,col=8)
matlines(Year2016Meteo$Doy,Year2016DBVD$cumElake_DBVD_B,type="l",lty=2,col=9)

text(275,100,"Burabay",cex=1.0)
text(200,0,"Equilibrium method DBVD",cex=0.8)

legend(0, 700.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);


dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/CumulativelakeevaporationDBVDBurabayallyears.pdf')
dev.off()

matplot(Year2008Meteo$Doy,Year2008DBVD$cumElake_DBVD_S,type="l",lty=1, col=1,ylim = c(0,800),xlim = c(0,365),xlab="Doy",ylab=" Cumulative Evaporation DBVD (mm)")
matlines(Year2009Meteo$Doy,Year2009DBVD$cumElake_DBVD_S,type="l",lty=1,col=2)
matlines(Year2010Meteo$Doy,Year2010DBVD$cumElake_DBVD_S,type="l",lty=1,col=3)
matlines(Year2011Meteo$Doy,Year2011DBVD$cumElake_DBVD_S,type="l",lty=1,col=4)
matlines(Year2012Meteo$Doy,Year2012DBVD$cumElake_DBVD_S,type="l",lty=1,col=5)
matlines(Year2013Meteo$Doy,Year2013DBVD$cumElake_DBVD_S,type="l",lty=1,col=6)
matlines(Year2014Meteo$Doy,Year2014DBVD$cumElake_DBVD_S,type="l",lty=1,col=7)
matlines(Year2015Meteo$Doy,Year2015DBVD$cumElake_DBVD_S,type="l",lty=1,col=8)
matlines(Year2016Meteo$Doy,Year2016DBVD$cumElake_DBVD_S,type="l",lty=2,col=9)

text(275,100,"Shortandy",cex=1.0)
text(200,0,"Equilibrium method DBVD",cex=0.8)

legend(0, 700.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);


dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/CumulativelakeevaporationDBVDShortandyallyears.pdf')
dev.off()


matplot(Year2008Meteo$Doy,Year2008Meteo$cumPminusE_DBVD_U,type="l",lty=1, col=1,ylim = c(-500,150),xlim = c(0,365),xlab="Doy",ylab=" Cumulative Precipitation_KHM - Evaporation DBVD (mm)")
matlines(Year2009Meteo$Doy,Year2009Meteo$cumPminusE_DBVD_U,type="l",lty=1, col=2)
matlines(Year2010Meteo$Doy,Year2010Meteo$cumPminusE_DBVD_U,type="l",lty=1, col=3)
matlines(Year2011Meteo$Doy,Year2011Meteo$cumPminusE_DBVD_U,type="l",lty=1, col=4)
matlines(Year2012Meteo$Doy,Year2012Meteo$cumPminusE_DBVD_U,type="l",lty=1, col=5)
matlines(Year2013Meteo$Doy,Year2013Meteo$cumPminusE_DBVD_U,type="l",lty=1, col=6)
matlines(Year2014Meteo$Doy,Year2014Meteo$cumPminusE_DBVD_U,type="l",lty=1, col=7)
matlines(Year2015Meteo$Doy,Year2015Meteo$cumPminusE_DBVD_U,type="l",lty=1, col=8)
matlines(Year2016Meteo$Doy,Year2016Meteo$cumPminusE_DBVD_U,type="l",lty=2, col=9)

abline(h = 0,col=16,lty=1)

text(275,100,"Ulken",cex=1.0)
text(100,-450,"Equilibrium method DBVD",cex=0.8)

legend(0, -100.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/CumulativePKHMminusEDBVDUlkenallyears.pdf')
dev.off()

matplot(Year2008MeteoOW_U$Doy,Year2008MeteoOW_U$cumPminusE_DBVD_U,type="l",lty=1, col=1,ylim = c(-600,150),xlim = c(0,365),xlab="Doy",ylab=" Cumulative Precipitation_KHM - Evaporation DBVD (mm)")
matlines(Year2009MeteoOW_U$Doy,Year2009MeteoOW_U$cumPminusE_DBVD_U,type="l",lty=1, col=2)
matlines(Year2010MeteoOW_U$Doy,Year2010MeteoOW_U$cumPminusE_DBVD_U,type="l",lty=1, col=3)
matlines(Year2011MeteoOW_U$Doy,Year2011MeteoOW_U$cumPminusE_DBVD_U,type="l",lty=1, col=4)
matlines(Year2012MeteoOW_U$Doy,Year2012MeteoOW_U$cumPminusE_DBVD_U,type="l",lty=1, col=5)
matlines(Year2013MeteoOW_U$Doy,Year2013MeteoOW_U$cumPminusE_DBVD_U,type="l",lty=1, col=6)
matlines(Year2014MeteoOW_U$Doy,Year2014MeteoOW_U$cumPminusE_DBVD_U,type="l",lty=1, col=7)
matlines(Year2015MeteoOW_U$Doy,Year2015MeteoOW_U$cumPminusE_DBVD_U,type="l",lty=1, col=8)
matlines(Year2016MeteoOW_U$Doy,Year2016MeteoOW_U$cumPminusE_DBVD_U,type="l",lty=2, col=9)

abline(h = 0,col=16,lty=1)

text(275,100,"Ulken",cex=1.0)
text(100,-450,"Equilibrium method DBVD, OW period",cex=0.8)

legend(0, -100.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/CumulativePKHMminusEDBVDUlkenallyearsOWperiod.pdf')
dev.off()


matplot(Year2008Meteo$Doy,Year2008Meteo$cumPminusE_DBVD_B,type="l",lty=1, col=1,ylim = c(-500,150),xlim = c(0,365),xlab="Doy",ylab=" Cumulative Precipitation_Shu - Evaporation DBVD (mm)")
matlines(Year2009Meteo$Doy,Year2009Meteo$cumPminusE_DBVD_B,type="l",lty=1, col=2)
matlines(Year2010Meteo$Doy,Year2010Meteo$cumPminusE_DBVD_B,type="l",lty=1, col=3)
matlines(Year2011Meteo$Doy,Year2011Meteo$cumPminusE_DBVD_B,type="l",lty=1, col=4)
matlines(Year2012Meteo$Doy,Year2012Meteo$cumPminusE_DBVD_B,type="l",lty=1, col=5)
matlines(Year2013Meteo$Doy,Year2013Meteo$cumPminusE_DBVD_B,type="l",lty=1, col=6)
matlines(Year2014Meteo$Doy,Year2014Meteo$cumPminusE_DBVD_B,type="l",lty=1, col=7)
matlines(Year2015Meteo$Doy,Year2015Meteo$cumPminusE_DBVD_B,type="l",lty=1, col=8)
# matlines(Year2016Meteo$Doy,Year2016Meteo$cumPminusE_DBVD_B,type="l",lty=2, col=9)

abline(h = 0,col=16,lty=1)

text(275,100,"Burabay",cex=1.0)
text(100,-450,"Equilibrium method DBVD",cex=0.8)

#legend(0, -100.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);
legend(0, -100.0, c("2008","2009","2010","2011","2012","2013","2014","2015"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/CumulativePShuminusEDBVDBurabayallyears.pdf')
dev.off()

matplot(Year2008MeteoOW_B$Doy,Year2008MeteoOW_B$cumPminusE_DBVD_B,type="l",lty=1, col=1,ylim = c(-600,150),xlim = c(0,365),xlab="Doy",ylab=" Cumulative Precipitation_Shu - Evaporation DBVD (mm)")
matlines(Year2009MeteoOW_B$Doy,Year2009MeteoOW_B$cumPminusE_DBVD_B,type="l",lty=1, col=2)
matlines(Year2010MeteoOW_B$Doy,Year2010MeteoOW_B$cumPminusE_DBVD_B,type="l",lty=1, col=3)
matlines(Year2011MeteoOW_B$Doy,Year2011MeteoOW_B$cumPminusE_DBVD_B,type="l",lty=1, col=4)
matlines(Year2012MeteoOW_B$Doy,Year2012MeteoOW_B$cumPminusE_DBVD_B,type="l",lty=1, col=5)
matlines(Year2013MeteoOW_B$Doy,Year2013MeteoOW_B$cumPminusE_DBVD_B,type="l",lty=1, col=6)
matlines(Year2014MeteoOW_B$Doy,Year2014MeteoOW_B$cumPminusE_DBVD_B,type="l",lty=1, col=7)
matlines(Year2015MeteoOW_B$Doy,Year2015MeteoOW_B$cumPminusE_DBVD_B,type="l",lty=1, col=8)
matlines(Year2016MeteoOW_B$Doy,Year2016MeteoOW_B$cumPminusE_DBVD_B,type="l",lty=2, col=9)

# matlines(Year2016Meteo$Doy,Year2016Meteo$cumPminusE_DBVD_B,type="l",lty=2, col=9)

abline(h = 0,col=16,lty=1)

text(275,100,"Burabay",cex=1.0)
text(100,-450,"Equilibrium method DBVD, OW period",cex=0.8)

#legend(0, -100.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);
legend(0, -100.0, c("2008","2009","2010","2011","2012","2013","2014","2015"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/CumulativePShuminusEDBVDBurabayallyearsOWperiod.pdf')
dev.off()


matplot(Year2008Meteo$Doy,Year2008Meteo$cumPminusE_DBVD_S,type="l",lty=1, col=1,ylim = c(-500,150),xlim = c(0,365),xlab="Doy",ylab=" Cumulative Precipitation_Shu - Evaporation DBVD (mm)")
matlines(Year2009Meteo$Doy,Year2009Meteo$cumPminusE_DBVD_S,type="l",lty=1, col=2)
matlines(Year2010Meteo$Doy,Year2010Meteo$cumPminusE_DBVD_S,type="l",lty=1, col=3)
matlines(Year2011Meteo$Doy,Year2011Meteo$cumPminusE_DBVD_S,type="l",lty=1, col=4)
matlines(Year2012Meteo$Doy,Year2012Meteo$cumPminusE_DBVD_S,type="l",lty=1, col=5)
matlines(Year2013Meteo$Doy,Year2013Meteo$cumPminusE_DBVD_S,type="l",lty=1, col=6)
matlines(Year2014Meteo$Doy,Year2014Meteo$cumPminusE_DBVD_S,type="l",lty=1, col=7)
matlines(Year2015Meteo$Doy,Year2015Meteo$cumPminusE_DBVD_S,type="l",lty=1, col=8)
# matlines(Year2016Meteo$Doy,Year2016Meteo$cumPminusE_DBVD_B,type="l",lty=2, col=9)

abline(h = 0,col=16,lty=1)

text(275,100,"Shortandy",cex=1.0)
text(100,-450,"Equilibrium method DBVD",cex=0.8)

#legend(0, -100.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);
legend(0, -100.0, c("2008","2009","2010","2011","2012","2013","2014","2015"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/CumulativePShuminusEDBVDShortandyallyears.pdf')
dev.off()

matplot(Year2008MeteoOW_S$Doy,Year2008MeteoOW_S$cumPminusE_DBVD_S,type="l",lty=1, col=1,ylim = c(-600,150),xlim = c(0,365),xlab="Doy",ylab=" Cumulative Precipitation_Shu - Evaporation DBVD (mm)")
matlines(Year2009MeteoOW_S$Doy,Year2009MeteoOW_S$cumPminusE_DBVD_S,type="l",lty=1, col=2)
matlines(Year2010MeteoOW_S$Doy,Year2010MeteoOW_S$cumPminusE_DBVD_S,type="l",lty=1, col=3)
matlines(Year2011MeteoOW_S$Doy,Year2011MeteoOW_S$cumPminusE_DBVD_S,type="l",lty=1, col=4)
matlines(Year2012MeteoOW_S$Doy,Year2012MeteoOW_S$cumPminusE_DBVD_S,type="l",lty=1, col=5)
matlines(Year2013MeteoOW_S$Doy,Year2013MeteoOW_S$cumPminusE_DBVD_S,type="l",lty=1, col=6)
matlines(Year2014MeteoOW_S$Doy,Year2014MeteoOW_S$cumPminusE_DBVD_S,type="l",lty=1, col=7)
matlines(Year2015MeteoOW_S$Doy,Year2015MeteoOW_S$cumPminusE_DBVD_S,type="l",lty=1, col=8)
matlines(Year2016MeteoOW_S$Doy,Year2016MeteoOW_S$cumPminusE_DBVD_S,type="l",lty=2, col=9)

# matlines(Year2016Meteo$Doy,Year2016Meteo$cumPminusE_DBVD_B,type="l",lty=2, col=9)

abline(h = 0,col=16,lty=1)

text(275,100,"Shortandy",cex=1.0)
text(100,-450,"Equilibrium method DBVD, OW period",cex=0.8)

#legend(0, -100.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);
legend(0, -100.0, c("2008","2009","2010","2011","2012","2013","2014","2015"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/CumulativePShuminusEDBVDShortandyallyearsOWperiod.pdf')
dev.off()


matplot(Year2008MeteoOW_U$Doy,Year2008MeteoOW_U$h_water_Kaz_U,type="l",lty=1, col=1,ylim = c(700,1000),xlim = c(0,365),xlab="Doy",ylab=" Absolute water levels (cm)")
matlines(Year2009MeteoOW_U$Doy,Year2009MeteoOW_U$h_water_Kaz_U,type="l",lty=1, col=2)
matlines(Year2010MeteoOW_U$Doy,Year2010MeteoOW_U$h_water_Kaz_U,type="l",lty=1, col=3)
matlines(Year2011MeteoOW_U$Doy,Year2011MeteoOW_U$h_water_Kaz_U,type="l",lty=1, col=4)
matlines(Year2012MeteoOW_U$Doy,Year2012MeteoOW_U$h_water_Kaz_U,type="l",lty=1, col=5)
matlines(Year2013MeteoOW_U$Doy,Year2013MeteoOW_U$h_water_Kaz_U,type="l",lty=1, col=6)
matlines(Year2014MeteoOW_U$Doy,Year2014MeteoOW_U$h_water_Kaz_U,type="l",lty=1, col=7)
matlines(Year2015MeteoOW_U$Doy,Year2015MeteoOW_U$h_water_Kaz_U,type="l",lty=1, col=8)
matlines(Year2016MeteoOW_U$Doy,Year2016MeteoOW_U$h_water_Kaz_U,type="l",lty=2, col=9)

abline(h = 0,col=16,lty=1)

text(275,700,"Ulken",cex=1.0)
text(100,700,"OW period",cex=0.8)

legend(0, 1000.0, c("2008","2009","2010","2011","2012","2013","2014","2015","2016"),cex=0.8,lty=1:1:1:1:1:1:1:1:1,col=1:2:3:4:5:6:7:8:9);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR_ERA/WaterlevelsUlkenallyearsOWperiod.pdf')
dev.off()






