# 1. Read in the data

meteo_names = c("Year","Doy","Tair","Tmax","Tmin","RH","RHmin","VPD","VPDmax","VP","Shrs","CCTotal","CCLow","Umax10","Umean10","Wdir","Rain_night","Rain_day","Rain_total","Pair","Pair_sl","T_water_Kaz_U","h_water_Kaz_U","T_water_diver","h_water_diver","h_water_Kaz_S","T_water_Kaz_S","h_water_Kaz_B","T_water_Kaz_B","Ta_Shu","P_Shu","Ta_B_new","P_Burabay_new","Ta_B_old","P_Burabay_old","Tmean_Davis","Tmax_Davis","Tmin_Davis","RH_Davis","DewPoint_Davis","U3_Davis","PressureHg_Davis","Rainfall_Davis","Solar_Rad_Davis","Wdir_Davis","Tmean_EC","RHmean_EC","Solar_Rad_EC","RN_EC","U4_Sonic","ET_EC","H_EC")

#order of lakes: Ulken(1), Burabay(2), Shortandy(3)


# Fluxes in mm day-1

Elakedata1_names = c("Year","Doy","Elake_aero_U","Elake_aero_B","Elake_aero_S","Elake_McJ_U","Elake_McJ_B","Elake_McJ_S")

McJtemps_names = c("Year","Doy","Tair","Wdir","Ts_equi_U","Ts_equi_B","Ts_equi_S","tau_MacJ_U","tau_MacJ_B","tau_MacJ_S","Ts_water_est_U","Ts_water_est_B","Ts_water_est_S","Ts_water_U","Ts_water_B","Ts_water_S","VPDwaterair_U","VPDwaterair_B","VPDwaterair_S")

# Fluxes in mm day-1

McJflux_names = c("Year","Doy","Wdir","Rn_water_MacJ_estmm_U","Rn_water_MacJ_estmm_B","Rn_water_MacJ_estmm_S","Gw_MacJmm_U","Gw_MacJmm_B","Gw_MacJmm_S","Elake_McJmm_U","Elake_McJmm_B","Elake_McJmm_S","Hlake_McJmm_U","Hlake_McJmm_B","Hlake_McJmm_S")

# Fluxes in W m-2 day-1, to go to mm day-1 divide by 28.4. tau has been transformed from seconds to days.

DBVDflux_names = c("Year","Doy","Ts_water_est_DBVD_U","Ts_water_est_DBVD_B","Ts_water_est_DBVD_S","Rn_water_DBVD_U","Rn_water_DBVD_B","Rn_water_DBVD_S","G_DBVD_U","G_DBVD_B","G_DBVD_S","Hlake_DBVD_U","Hlake_DBVD_B","Hlake_DBVD_S","Elake_DBVD_U","Elake_DBVD_B","Elake_DBVD_S","tau_DBVD_U","tau_DBVD_B","tau_DBVD_S")

FHflux_names = c("Year","Doy","Rn_FH_U","Rn_FH_B","Rn_FH_S","G_FH_U","G_FH_B","G_FH_S","Elake_FH_U","Elake_FH_B","Elake_FH_S","Hlake_FH_U","Hlake_FH_B","Hlake_FH_S","tau_FH_U","tau_FH_B","tau_FH_S")

# Fluxes in MJ m-2 day-1, to go to mm day-1 divide by 11.6

McJradiation_names = c("Year","Doy","Rn_water_MacJ_U","Rn_water_MacJ_B","Rn_water_MacJ_S","Rs_water_MacJ_U","Rs_water_MacJ_B","Rs_water_MacJ_S","Rlin_MacJ_U","Rlin_MacJ_B","Rlin_MacJ_S","Rlout_MacJ_U","Rlout_MacJ_B","Rlout_MacJ_S","RsMJm2day")

ReconstructWB_names = c("Year","Doy","Rain_total","PminusEaero_U","PminusEaero_B","PminusEaero_S","PminusEMcJ_U","PminusEMcJ_B","PminusEMcJ_S","PminusEDBVD_U","PminusEDBVD_B","PminusEDBVD_S","PminusEFH_U","PminusEFH_B","PminusEFH_S","WLchange_U","WLchange_B","WLchange_S","FeedtermEaero_U","FeedtermEaero_B","FeedtermEaero_S","FeedtermEMcJ_U","FeedtermEMcJ_B","FeedtermEMcJ_S","FeedtermEDBVD_U","FeedtermEDBVD_B","FeedtermEDBVD_S","FeedtermEFH_U","FeedtermEFH_B","FeedtermEFH_S","switchOW_U","switchOW_B","switchOW_S")


meteodata <- read.table("/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/Inputfile20132016tocalculate3lakeEBfluxes2.txt",header=TRUE, sep="", col.names=meteo_names)

Elakedata1 <- read.table("/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/Elake_alllakesMcJannet&aero2013206.out",header=FALSE, sep="", col.names=Elakedata1_names)

McJtempsdata <- read.table("/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/Watertemps_alllakes201316.out",header=FALSE, sep="", col.names=McJtemps_names)

McJfluxdata <- read.table("/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/Energybalance_alllakes201316.out",header=FALSE, sep="", col.names=McJflux_names)
DBVDfluxdata <- read.table("/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/EbalDBVD_alllakesDBVD201316.out",header=FALSE, sep="", col.names=DBVDflux_names)
FHfluxdata <- read.table("/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/EbalFH_alllakesDBVD201316.out",header=FALSE, sep="", col.names=FHflux_names)

McJradiationdata <- read.table("/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/radiationbalance_alllakes201316.out",header=FALSE, sep="", col.names=McJradiation_names)
Lakelevelsdata <- read.table("/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/lakelevels_alllakes201316.out",header=FALSE, sep="", col.names=ReconstructWB_names)


require (zoo)
library(fields)
#library(openair)
#library(lubridate)

attach(meteodata)
attach(Elakedata1)
attach(McJtempsdata)
attach(McJfluxdata)
attach(McJradiationdata)
attach(DBVDfluxdata)
attach(FHfluxdata)
attach(Lakelevelsdata)

meteodataOW_U <- subset(meteodata, Lakelevelsdata$switchOW_U > 0)
meteodataOW_U_clean <- subset(meteodata, Lakelevelsdata$switchOW_U > 0 & Tair > -30 &  Ta_B_old > -30 &  Ta_Shu > -30)
Elakedata1OW_U <- subset(Elakedata1, Lakelevelsdata$switchOW_U > 0)
McJtempsdataOW_U <- subset(McJtempsdata, Lakelevelsdata$switchOW_U > 0)
McJfluxdataOW_U <- subset(McJfluxdata, Lakelevelsdata$switchOW_U > 0)

meteodataOW_B <- subset(meteodata, Lakelevelsdata$switchOW_B > 0)
Elakedata1OW_B <- subset(Elakedata1, Lakelevelsdata$switchOW_B > 0)
McJtempsdataOW_B <- subset(McJtempsdata, Lakelevelsdata$switchOW_B > 0)
McJfluxdataOW_B <- subset(McJfluxdata, Lakelevelsdata$switchOW_B > 0)

meteodataOW_S <- subset(meteodata, Lakelevelsdata$switchOW_S > 0)
Elakedata1OW_S <- subset(Elakedata1, Lakelevelsdata$switchOW_S > 0)
McJtempsdataOW_S <- subset(McJtempsdata, Lakelevelsdata$switchOW_S > 0)
McJfluxdataOW_S <- subset(McJfluxdata, Lakelevelsdata$switchOW_S > 0)

# wind direction
brk0<-seq(0, 360, by=30)
brk1<-seq(0, 360, by=22.5)



meteodata$deciYear= meteodata$Year + (meteodata$Doy/365)
Elakedata1$deciYear= Elakedata1$Year + (Elakedata1$Doy/365)
McJtempsdata$deciYear= McJtempsdata$Year + (McJtempsdata$Doy/365)
McJfluxdata$deciYear= McJfluxdata$Year + (McJfluxdata$Doy/365)
McJradiationdata$deciYear= McJfluxdata$Year + (McJfluxdata$Doy/365)
DBVDfluxdata$deciYear= DBVDfluxdata$Year + (DBVDfluxdata$Doy/365)
FHfluxdata$deciYear= FHfluxdata$Year + (FHfluxdata$Doy/365)
Lakelevelsdata$deciYear= Lakelevelsdata$Year + (Lakelevelsdata$Doy/365)

#okJTOT2 <- subset(mydata, JTOT2 > -250 & JTOT2 < 250)

#H from energy balance closure

McJfluxdata$Hlake_McJmm_EB_U = McJfluxdata$Rn_water_MacJ_estmm_U - McJfluxdata$Gw_MacJmm_U - McJfluxdata$Elake_McJmm_U
McJfluxdata$Hlake_McJmm_EB_B = McJfluxdata$Rn_water_MacJ_estmm_B - McJfluxdata$Gw_MacJmm_B - McJfluxdata$Elake_McJmm_B
McJfluxdata$Hlake_McJmm_EB_S = McJfluxdata$Rn_water_MacJ_estmm_S - McJfluxdata$Gw_MacJmm_S - McJfluxdata$Elake_McJmm_S



Year2013Meteo <- subset(meteodata, Year == 2013)
Year2014Meteo <- subset(meteodata, Year == 2014)
Year2015Meteo <- subset(meteodata, Year == 2015)
Year2016Meteo <- subset(meteodata, Year == 2016)

Year2013LakeE1 <- subset(Elakedata1, Year == 2013)
Year2014LakeE1 <- subset(Elakedata1, Year == 2014)
Year2015LakeE1 <- subset(Elakedata1, Year == 2015)
Year2016LakeE1 <- subset(Elakedata1, Year == 2016)

Year2013McJtemps <- subset(McJtempsdata, Year == 2013)
Year2014McJtemps <- subset(McJtempsdata, Year == 2014)
Year2015McJtemps <- subset(McJtempsdata, Year == 2015)
Year2016McJtemps <- subset(McJtempsdata, Year == 2016)



eps = 0.95
sigma = 5.67e-8

# Daily Air temperature
matplot(Year2013Meteo$Doy,Year2013Meteo$Tair,type="p",pch=1, col=1,ylim = c(-50,50),xlim = c(0,365),xlab="Doy",ylab="Air temperature (deg C)")
matlines(Year2014Meteo$Doy,Year2014Meteo$Tair,type="p",pch=1, col=2)
matlines(Year2015Meteo$Doy,Year2015Meteo$Tair,type="p",pch=1, col=3)
matlines(Year2016Meteo$Doy,Year2016Meteo$Tair,type="p",pch=1, col=4)

box()

abline(h = 0)

legend(223.2, 50, c("2013","2014","2015","2016"),cex=0.6,pch=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/TairallyearBurabay.pdf')
dev.off()

# Daily windspeeds
matplot(Year2013Meteo$Doy,Year2013Meteo$Umean10,type="p",pch=1, col=1,ylim = c(0,12),xlim = c(0,365),xlab="Doy",ylab="Wind speed (m/s)")
matlines(Year2014Meteo$Doy,Year2014Meteo$Umean10,type="p",pch=1, col=2)
matlines(Year2015Meteo$Doy,Year2015Meteo$Umean10,type="p",pch=1, col=3)
matlines(Year2016Meteo$Doy,Year2016Meteo$Umean10,type="p",pch=1, col=4)

box()

abline(h = 0)

legend(223.2, 10, c("2013","2014","2015","2016"),cex=0.6,pch=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/Umean10allyearBurabay.pdf')
dev.off()

# Daily windspeeds rolling mean
matplot(rollmean(meteodata$deciYear,10),rollmean(meteodata$Umean10,10),type="l",lty=1, col=1,ylim = c(0,12),xlim = c(2013,2017),xlab="Decimal Day",ylab="Windspeed (m/s)")
matlines(Lakelevelsdata$deciYear,(Lakelevelsdata$switchOW_S)-340,type="p",pch=1, col=5,cex = 0.7)
box()
abline(h = 0)
abline(v = 2014,col=16,lty=2)
abline(v = 2015,col=16,lty=2)
abline(v = 2016,col=16,lty=2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/UmeanrollingmeanallyearBurabay.pdf')
dev.off()

# Daily RH
matplot(Year2013Meteo$Doy,Year2013Meteo$RH,type="p",pch=1, col=1,ylim = c(0,100),xlim = c(0,365),xlab="Doy",ylab="Relative humidity (%)")
matlines(Year2014Meteo$Doy,Year2014Meteo$RH,type="p",pch=1, col=2)
matlines(Year2015Meteo$Doy,Year2015Meteo$RH,type="p",pch=1, col=3)
matlines(Year2016Meteo$Doy,Year2016Meteo$RH,type="p",pch=1, col=4)

box()

abline(h = 0)

legend(223.2, 100, c("2013","2014","2015","2016"),cex=0.6,pch=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/RHallyearBurabay.pdf')
dev.off()

# Daily RH rolling mean
matplot(rollmean(meteodata$deciYear,10),rollmean(meteodata$RH,10),type="l",lty=1, col=1,ylim = c(0,100),xlim = c(2013,2017),xlab="Decimal Day",ylab="Relative humidity (%)")
matlines(rollmean(meteodata$deciYear,10),rollmean(meteodata$RH_Davis,10),type="l",lty=1, col=2)
matlines(rollmean(meteodata$deciYear,10),rollmean(meteodata$RHmean_EC,10),type="l",lty=1, col=3)
matlines(Lakelevelsdata$deciYear,(Lakelevelsdata$switchOW_S)-250,type="p",pch=1, col=5,cex = 0.7)
box()

legend(2013, 30, c("Kazhydromet(Ulken)","Davis(Shortandy)","EC(Shortandy)"),cex=0.8,lty=1:1:1:1,col=1:2:3);
abline(v = 2014,col=16,lty=2)
abline(v = 2015,col=16,lty=2)
abline(v = 2016,col=16,lty=2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/RHrollingmeanallyearBurabay.pdf')
dev.off()

# Daily VPDwaterair rolling mean
matplot(rollmean(McJtempsdata$deciYear,10),rollmean(McJtempsdata$VPDwaterair_U,10),type="l",lty=1, col=1,ylim = c(0,2),xlim = c(2013,2017),xlab="Decimal Day",ylab="esat_lake-e_air (KPa)")
matlines(rollmean(McJtempsdata$deciYear,10),rollmean(McJtempsdata$VPDwaterair_B,10),type="l",lty=1, col=2,cex = 1.0)
matlines(rollmean(McJtempsdata$deciYear,10),rollmean(McJtempsdata$VPDwaterair_S,10),type="l",lty=1, col=3,cex = 1.0)
matlines(Lakelevelsdata$deciYear,(Lakelevelsdata$switchOW_S)-348,type="p",pch=1, col=5,cex = 0.7)
box()
legend(2016.45, 0.23, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1:1,col=1:2:3);
abline(v = 2014,col=16,lty=2)
abline(v = 2015,col=16,lty=2)
abline(v = 2016,col=16,lty=2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/VPDwaterairrollingmeanallyearalllakes.pdf')
dev.off()

# Daily Tswater-Tair rolling mean
matplot(rollmean(McJtempsdata$deciYear,10),rollmean(McJtempsdata$Ts_water_U-McJtempsdata$Tair,10),type="l",lty=1, col=1,ylim = c(-10,10),xlim = c(2013,2017),xlab="Decimal Day",ylab="Ts_lake-T_air (deg C)")
matlines(rollmean(McJtempsdata$deciYear,10),rollmean(McJtempsdata$Ts_water_B-McJtempsdata$Tair,10),type="l",lty=1, col=2,cex = 1.0)
matlines(rollmean(McJtempsdata$deciYear,10),rollmean(McJtempsdata$Ts_water_S-McJtempsdata$Tair,10),type="l",lty=1, col=3,cex = 1.0)
matlines(Lakelevelsdata$deciYear,(Lakelevelsdata$switchOW_S)-340,type="p",pch=1, col=5,cex = 0.7)
box()
abline(h = 0)
abline(v = 2014,col=16,lty=2)
abline(v = 2015,col=16,lty=2)
abline(v = 2016,col=16,lty=2)
legend(2013, 9, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1:1,col=1:2:3);
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/TswaterminusTairrollingmeanallyearalllakes.pdf')
dev.off()

# Windirection

matplot(rollmean(meteodata$deciYear,10),rollmean(meteodata$Wdir,10),type="l",lty=1, col=1,ylim = c(0,360),xlim = c(2013,2017),xlab="Decimal Day",ylab="Wind direction")
abline(v = 2014,col=16,lty=2)
abline(v = 2015,col=16,lty=2)
abline(v = 2016,col=16,lty=2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusDecitime.pdf')
dev.off()

look<- stats.bin(meteodata$Wdir,meteodata$Tair,N=12,breaks=brk0)
matplot(look$centers, look$stats["median",], type="p",pch=19, col=1,ylim = c(0,25),xlim = c(0,360),xlab="wind direction",ylab="Ta (deg C)")
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusTair12bins.pdf')
dev.off()
out<-look$stats
write.table(t(out),'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusTair12bins.out', col.names=TRUE,row.names=TRUE)

look<- stats.bin(meteodata$Wdir,meteodata$Tair,N=16,breaks=brk1)
matplot(look$centers, look$stats["median",], type="p",pch=19, col=1,ylim = c(-5,25),xlim = c(0,360),xlab="wind direction",ylab="Ta (deg C)")
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusTair16bins.pdf')
dev.off()
out<-look$stats
write.table(t(out),'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusTair16bins.out', col.names=TRUE,row.names=TRUE)


look<- stats.bin(meteodataOW_U$Wdir,meteodataOW_U$Tair,N=12,breaks=brk0)
matplot(look$centers, look$stats["median",], type="p",pch=19, col=1,ylim = c(0,15),xlim = c(0,360),xlab="wind direction",ylab="Ta (deg C)")
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusTairOW_ulken12bins.pdf')
dev.off()
out<-look$stats
write.table(t(out),'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusTairOW_Ulken12bins.out', col.names=TRUE,row.names=TRUE)

look<- stats.bin(meteodataOW_U$Wdir,meteodataOW_U$Tair,N=16,breaks=brk1)
matplot(look$centers, look$stats["median",], type="l",lty=1, col=1,ylim = c(0,20),xlim = c(0,360),xlab="wind direction",ylab="Tair (deg C)")
text(150,20,"This is 2013-2016, Kaz-Hydromet OW periods",cex=0.8)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusTairOW_ulken16binsBurabaynewonly.pdf')
dev.off()

look<- stats.bin(meteodataOW_U$Wdir,(meteodataOW_U$VP)/10.0,N=16,breaks=brk1)
matplot(look$centers, look$stats["median",], type="l",lty=1, col=1,ylim = c(0.5,1.5),xlim = c(0,360),xlab="wind direction",ylab="Vapour pressure (kPa)")
text(150,1.5,"This is 2013-2016, Kaz-Hydromet OW periods",cex=0.8)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusVPOW_ulken16binsBurabaynewonly.pdf')
dev.off()

look<- stats.bin(meteodataOW_U_clean$Wdir,meteodataOW_U_clean$Tair,N=16,breaks=brk1)
matplot(look$centers, look$stats["median",], type="l",lty=1, col=1,ylim = c(0,20),xlim = c(0,360),xlab="wind direction",ylab="Tair (deg C)")
out<-look$stats
write.table(t(out),'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusTairOW_Ulken16bins.out', col.names=TRUE,row.names=TRUE)
look<- stats.bin(meteodataOW_U_clean$Wdir,meteodataOW_U_clean$Ta_Shu,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=2)
look<- stats.bin(meteodataOW_U_clean$Wdir,meteodataOW_U_clean$Ta_B_old,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=3)
look<- stats.bin(meteodataOW_U$Wdir,meteodataOW_U$Tair,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=4)

text(150,20,"2016 was not available for Buraby old & Shu",cex=0.8)
legend(200, 5, c("Kaz-Hydromet","Shushinsk","Burabay old","Tair 2013-2016"),cex=0.8,lty=1:1:1:1,col=1:2:3:4);
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusTairOW_ulken16bins.pdf')
dev.off()


look<- stats.bin(meteodataOW_U$Wdir,meteodataOW_U$RH,N=16,breaks=brk1)
matplot(look$centers, look$stats["median",], type="l",lty=1, col=1,ylim = c(50,80),xlim = c(0,360),xlab="wind direction",ylab="Relative humidity (%)")
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusRHOW_ulken16bins.pdf')
dev.off()
out<-look$stats
write.table(t(out),'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusRHOW_Ulken16bins.out', col.names=TRUE,row.names=TRUE)

look<- stats.bin(meteodataOW_U$Wdir,meteodataOW_U$Umean10,N=16,breaks=brk1)
matplot(look$centers, look$stats["median",], type="l",lty=1, col=1,ylim = c(0,10),xlim = c(0,360),xlab="wind direction",ylab="Wind speed (m/s)")
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/Winddirversusumean10OW_ulken16bins.pdf')
dev.off()
out<-look$stats
write.table(t(out),'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusRHOW_Ulken16bins.out', col.names=TRUE,row.names=TRUE)

look<- stats.bin(meteodataOW_U$Wdir,Elakedata1OW_U$Elake_aero_U,N=16,breaks=brk1)
matplot(look$centers, look$stats["median",], type="p",pch=19, col=1,ylim = c(0,3),xlim = c(0,360),xlab="Wind direction bin",ylab="E_aero Ulken mm day-1")
matlines(look$centers, look$stats["mean",], type="p",pch=19, col=2)
legend(200, 0.5, c("Median","Mean"),cex=0.8,pch=16:16,col=1:2);
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusE_aeroOW_ulken16bins.pdf')
dev.off()
out<-look$stats
write.table(t(out),'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusEaeroOW_Ulken16bins.out', col.names=TRUE,row.names=TRUE)

look<- stats.bin(meteodataOW_B$Wdir,Elakedata1OW_B$Elake_aero_B,N=16,breaks=brk1)
matplot(look$centers, look$stats["median",], type="p",pch=19, col=1,ylim = c(0,3),xlim = c(0,360),xlab="Wind direction bin",ylab="E_aero Burabay mm day-1")
matlines(look$centers, look$stats["mean",], type="p",pch=19, col=2)
legend(200, 0.5, c("Median","Mean"),cex=0.8,pch=16:16,col=1:2);
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusE_aeroOW_Burabay16bins.pdf')
dev.off()
out<-look$stats
write.table(t(out),'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusEaeroOW_Burabay16bins.out', col.names=TRUE,row.names=TRUE)

look<- stats.bin(meteodataOW_S$Wdir,Elakedata1OW_S$Elake_aero_S,N=16,breaks=brk1)
matplot(look$centers, look$stats["median",], type="p",pch=19, col=1,ylim = c(0,3),xlim = c(0,360),xlab="Wind direction bin",ylab="E_aero Shortandy mm day-1")
matlines(look$centers, look$stats["mean",], type="p",pch=19, col=2)
legend(200, 0.5, c("Median","Mean"),cex=0.8,pch=16:16,col=1:2);
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusE_aeroOW_Shortandy16bins.pdf')
dev.off()
out<-look$stats
write.table(t(out),'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusEaeroOW_Shortandy16bins.out', col.names=TRUE,row.names=TRUE)

look<- stats.bin(meteodataOW_U$Wdir,Elakedata1OW_U$Elake_aero_U,N=16,breaks=brk1)
matplot(look$centers, look$stats["median",], type="l",lty=1, col=1,ylim = c(0,3),xlim = c(0,360),xlab="Wind direction bin",ylab="Elake aerodynamic (mm day-1)")
look<- stats.bin(meteodataOW_B$Wdir,Elakedata1OW_B$Elake_aero_B,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=2)
look<- stats.bin(meteodataOW_S$Wdir,Elakedata1OW_S$Elake_aero_S,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=3)
legend(200, 0.5, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1,col=1:2:3);
text(100,3,"Open water periods only",cex=1.2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusE_aeroOW_Alllakes16bins.pdf')
dev.off()

look<- stats.bin(meteodataOW_U$Wdir,Elakedata1OW_U$Elake_McJ_U,N=16,breaks=brk1)
matplot(look$centers, look$stats["median",], type="l",lty=1, col=1,ylim = c(0,5),xlim = c(0,360),xlab="Wind direction bin",ylab="Elake McJannet (mm day-1)")
look<- stats.bin(meteodataOW_B$Wdir,Elakedata1OW_B$Elake_McJ_B,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=2)
look<- stats.bin(meteodataOW_S$Wdir,Elakedata1OW_S$Elake_McJ_S,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=3)
legend(200, 0.5, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1,col=1:2:3);
text(100,5,"Open water periods only",cex=1.2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusE_McJannetOW_Alllakes16bins.pdf')
dev.off()

look<- stats.bin(meteodataOW_U$Wdir,meteodataOW_U$T_water_Kaz_U,N=16,breaks=brk1)
matplot(look$centers, look$stats["median",], type="l",lty=1, col=1,ylim = c(0,20),xlim = c(0,360),xlab="Wind direction bin",ylab="Measured water temps (deg C)")
look<- stats.bin(meteodataOW_B$Wdir,meteodataOW_B$T_water_Kaz_B,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=2)
look<- stats.bin(meteodataOW_S$Wdir,meteodataOW_S$T_water_Kaz_S,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=3)
look<- stats.bin(meteodataOW_U$Wdir,meteodataOW_U$Tair,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=4)

legend(280, 5, c("Ulken","Burabay","Shortandy","Tair"),cex=0.8,lty=1:1:1,col=1:2:3:4);
text(100,20,"Open water periods only",cex=1.2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusTswatermeasOW_Alllakes16bins.pdf')
dev.off()

look<- stats.bin(McJtempsdataOW_U$Wdir,McJtempsdataOW_U$VPDwaterair_U,N=16,breaks=brk1)
matplot(look$centers, look$stats["median",], type="l",lty=1, col=1,ylim = c(0,1),xlim = c(0,360),xlab="Wind direction bin",ylab="esat_lake-e_air (KPa)")
look<- stats.bin(McJtempsdataOW_B$Wdir,McJtempsdataOW_B$VPDwaterair_B,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=2)
look<- stats.bin(McJtempsdataOW_S$Wdir,McJtempsdataOW_S$VPDwaterair_S,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=3)
look<- stats.bin(meteodataOW_U$Wdir,(meteodataOW_U$VPD/10.0),N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=4)

legend(275, 0.2, c("Ulken","Burabay","Shortandy","VPD_air"),cex=0.8,lty=1:1:1,col=1:2:3:4);
text(100,0,"Open water periods only",cex=1.2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusVPDTslakeminusairOW_Alllakes16bins.pdf')
dev.off()


look<- stats.bin(McJtempsdataOW_U$Wdir,McJfluxdataOW_U$Rn_water_MacJ_estmm_U,N=16,breaks=brk1)
matplot(look$centers, look$stats["median",], type="l",lty=1, col=1,ylim = c(0,6),xlim = c(0,360),xlab="Wind direction bin",ylab="Lake net radiation (mm day-1) McJannet")
look<- stats.bin(McJtempsdataOW_B$Wdir,McJfluxdataOW_B$Rn_water_MacJ_estmm_B,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=2)
look<- stats.bin(McJtempsdataOW_S$Wdir,McJfluxdataOW_S$Rn_water_MacJ_estmm_S,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=3)

abline(h = 0)
legend(275, 3, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1,col=1:2:3);
text(100,2,"Open water periods only",cex=1.2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusRnlakeOW_Alllakes16bins.pdf')
dev.off()

look<- stats.bin(McJtempsdataOW_U$Wdir,McJfluxdataOW_U$Gw_MacJmm_U,N=16,breaks=brk1)
matplot(look$centers, look$stats["median",], type="l",lty=1, col=1,ylim = c(-2,4),xlim = c(0,360),xlab="Wind direction bin",ylab="Lake heat storage (mm day-1) McJannet")
look<- stats.bin(McJtempsdataOW_B$Wdir,McJfluxdataOW_B$Gw_MacJmm_B,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=2)
look<- stats.bin(McJtempsdataOW_S$Wdir,McJfluxdataOW_S$Gw_MacJmm_S,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=3)

abline(h = 0)


legend(150, 1, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1,col=1:2:3);
text(100,4,"Open water periods only",cex=1.2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusGstoragelakeOW_Alllakes16bins.pdf')
dev.off()

look<- stats.bin(McJtempsdataOW_U$Wdir,McJfluxdataOW_U$Hlake_McJmm_U,N=16,breaks=brk1)
matplot(look$centers, look$stats["median",], type="l",lty=1, col=1,ylim = c(-1,1.5),xlim = c(0,360),xlab="Wind direction bin",ylab="Lake sensible heat flux (mm day-1) McJannet")
look<- stats.bin(McJtempsdataOW_B$Wdir,McJfluxdataOW_B$Hlake_McJmm_B,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=2)
look<- stats.bin(McJtempsdataOW_S$Wdir,McJfluxdataOW_S$Hlake_McJmm_S,N=16,breaks=brk1)
matlines(look$centers, look$stats["median",], type="l",lty=1, col=3)

abline(h = 0)


legend(150, 1, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1,col=1:2:3);
text(100,-1,"Open water periods only",cex=1.2)
dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/WinddirversusHsenslakeOW_Alllakes16bins.pdf')
dev.off()


# Lake evaporation Ulken Shabahkty all years, aerodynamic method

matplot(Year2013LakeE1$Doy,Year2013LakeE1$Elake_aero_U,type="p",pch=1, col=1,ylim = c(-2,10),xlim = c(0,365),xlab="Doy",ylab="Lake evaporation (mm day-1) Arodynamic method")
matlines(Year2014LakeE1$Doy,Year2014LakeE1$Elake_aero_U,type="p",pch=1, col=2)
matlines(Year2015LakeE1$Doy,Year2015LakeE1$Elake_aero_U,type="p",pch=1, col=3)
matlines(Year2016LakeE1$Doy,Year2016LakeE1$Elake_aero_U,type="p",pch=1, col=4)

box()

abline(h = 0)

text(100,10,"Ulken Shabahkty",cex=1.2)

legend(300, 10, c("2013","2014","2015","2016"),cex=1.0,pch=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/Elakeaero_Ulkenallyears.pdf')
dev.off()

# Lake evaporation lake Burabay all years, aerodynamic method

matplot(Year2013LakeE1$Doy,Year2013LakeE1$Elake_aero_B,type="p",pch=1, col=1,ylim = c(-2,10),xlim = c(0,365),xlab="Doy",ylab="Lake evaporation (mm day-1) Aerodynamic method")
matlines(Year2014LakeE1$Doy,Year2014LakeE1$Elake_aero_B,type="p",pch=1, col=2)
matlines(Year2015LakeE1$Doy,Year2015LakeE1$Elake_aero_B,type="p",pch=1, col=3)
matlines(Year2016LakeE1$Doy,Year2016LakeE1$Elake_aero_B,type="p",pch=1, col=4)

box()

abline(h = 0)

text(100,10,"Burabay",cex=1.2)

legend(300, 10, c("2013","2014","2015","2016"),cex=1.0,pch=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/Elakeaero_Burabayallyears.pdf')
dev.off()

# Lake evaporation Lake Shortandy all years, aerodynamic method

matplot(Year2013LakeE1$Doy,Year2013LakeE1$Elake_aero_S,type="p",pch=1, col=1,ylim = c(-2,10),xlim = c(0,365),xlab="Doy",ylab="Lake evaporation (mm day-1) Aerodynamic method")
matlines(Year2014LakeE1$Doy,Year2014LakeE1$Elake_aero_S,type="p",pch=1, col=2)
matlines(Year2015LakeE1$Doy,Year2015LakeE1$Elake_aero_S,type="p",pch=1, col=3)
matlines(Year2016LakeE1$Doy,Year2016LakeE1$Elake_aero_S,type="p",pch=1, col=4)

box()

abline(h = 0)

text(100,10,"Shortandy",cex=1.2)

legend(300, 10, c("2013","2014","2015","2016"),cex=1.0,pch=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/Elakeaero_Shortandyallyears.pdf')
dev.off()

# Lake evaporation All Lakes 2013, aerodynamic method, note: los of sunshine hours missing. Were filled with zeros.. Also cloud-cover was missing

matplot(Year2013LakeE1$Doy,Year2013LakeE1$Elake_aero_U,type="p",pch=1, col=1,ylim = c(-2,10),xlim = c(0,365),xlab="Doy",ylab="Lake evaporation (mm day-1) Aerodynamic method")
matlines(Year2013LakeE1$Doy,Year2013LakeE1$Elake_aero_B,type="p",pch=1, col=2)
matlines(Year2013LakeE1$Doy,Year2013LakeE1$Elake_aero_S,type="p",pch=1, col=3)


box()

abline(h = 0)

text(100,10,"All lakes 2013",cex=1.2)

legend(300, 10, c("Ulken","Burabay","Shortandy"),cex=1.0,pch=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/Elakeaero_alllakesyear2013.pdf')
dev.off()



# Lake evaporation All Lakes 2014, aerodynamic method

matplot(Year2014LakeE1$Doy,Year2014LakeE1$Elake_aero_U,type="p",pch=1, col=1,ylim = c(-2,10),xlim = c(0,365),xlab="Doy",ylab="Lake evaporation (mm day-1) Aerodynamic method")
matlines(Year2014LakeE1$Doy,Year2014LakeE1$Elake_aero_B,type="p",pch=1, col=2)
matlines(Year2014LakeE1$Doy,Year2014LakeE1$Elake_aero_S,type="p",pch=1, col=3)


box()

abline(h = 0)

text(100,10,"All lakes 2014",cex=1.2)

legend(300, 10, c("Ulken","Burabay","Shortandy"),cex=1.0,pch=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/Elakeaero_alllakesyear2014.pdf')
dev.off()

# Lake evaporation All Lakes 2015, aerodynamic method

matplot(Year2015LakeE1$Doy,Year2015LakeE1$Elake_aero_U,type="p",pch=1, col=1,ylim = c(-2,10),xlim = c(0,365),xlab="Doy",ylab="Lake evaporation (mm day-1) Aerodynamic method")
matlines(Year2015LakeE1$Doy,Year2015LakeE1$Elake_aero_B,type="p",pch=1, col=2)
matlines(Year2015LakeE1$Doy,Year2015LakeE1$Elake_aero_S,type="p",pch=1, col=3)


box()

abline(h = 0)

text(100,10,"All lakes 2015",cex=1.2)

legend(300, 10, c("Ulken","Burabay","Shortandy"),cex=1.0,pch=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/Elakeaero_alllakesyear2015.pdf')
dev.off()

# Lake evaporation All Lakes 2016, aerodynamic method

matplot(Year2016LakeE1$Doy,Year2016LakeE1$Elake_aero_U,type="p",pch=1, col=1,ylim = c(-2,10),xlim = c(0,365),xlab="Doy",ylab="Lake evaporation (mm day-1) Aerodynamic method")
matlines(Year2016LakeE1$Doy,Year2016LakeE1$Elake_aero_B,type="p",pch=1, col=2)
matlines(Year2016LakeE1$Doy,Year2016LakeE1$Elake_aero_S,type="p",pch=1, col=3)


box()

abline(h = 0)

text(100,10,"All lakes 2016",cex=1.2)

legend(300, 10, c("Ulken","Burabay","Shortandy"),cex=1.0,pch=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/Elakeaero_alllakesyear2016.pdf')
dev.off()

# Measured lake temperatures Ulken Shabahkty all years

matplot(Year2013McJtemps$Doy,Year2013McJtemps$Ts_water_U,type="p",pch=1, col=1,ylim = c(-2,30),xlim = c(0,365),xlab="Doy",ylab="Measured lake temperatures(deg C)")
matlines(Year2014McJtemps$Doy,Year2014McJtemps$Ts_water_U,type="p",pch=1, col=2)
matlines(Year2015McJtemps$Doy,Year2015McJtemps$Ts_water_U,type="p",pch=1, col=3)
matlines(Year2016McJtemps$Doy,Year2016McJtemps$Ts_water_U,type="p",pch=1, col=4)

box()

abline(h = 0)

text(100,30,"Ulken Shabahkty",cex=1.2)

legend(300, 30, c("2013","2014","2015","2016"),cex=1.0,pch=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/TslakemeasuredUlkenallyears.pdf')
dev.off()

# Measured lake temperatures Burabay all years
matplot(Year2013McJtemps$Doy,Year2013McJtemps$Ts_water_B,type="p",pch=1, col=1,ylim = c(-2,30),xlim = c(0,365),xlab="Doy",ylab="Measured lake temperatures(deg C)")
matlines(Year2014McJtemps$Doy,Year2014McJtemps$Ts_water_B,type="p",pch=1, col=2)
matlines(Year2015McJtemps$Doy,Year2015McJtemps$Ts_water_B,type="p",pch=1, col=3)
matlines(Year2016McJtemps$Doy,Year2016McJtemps$Ts_water_B,type="p",pch=1, col=4)

box()

abline(h = 0)

text(100,30,"Burabay",cex=1.2)

legend(300, 30, c("2013","2014","2015","2016"),cex=1.0,pch=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/TslakemeasuredBurabayallyears.pdf')
dev.off()

# Measured lake temperatures Shortandy  all years

matplot(Year2013McJtemps$Doy,Year2013McJtemps$Ts_water_S,type="p",pch=1, col=1,ylim = c(-2,30),xlim = c(0,365),xlab="Doy",ylab="Measured lake temperatures(deg C)")
matlines(Year2014McJtemps$Doy,Year2014McJtemps$Ts_water_S,type="p",pch=1, col=2)
matlines(Year2015McJtemps$Doy,Year2015McJtemps$Ts_water_S,type="p",pch=1, col=3)
matlines(Year2016McJtemps$Doy,Year2016McJtemps$Ts_water_S,type="p",pch=1, col=4)

box()

abline(h = 0)

text(100,30,"Shortandy",cex=1.2)

legend(300, 30, c("2013","2014","2015","2016"),cex=1.0,pch=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/TslakemeasuredShortandyallyears.pdf')
dev.off()

# Estimated lake temperatures Ulken Shabahkty all years

matplot(Year2013McJtemps$Doy,Year2013McJtemps$Ts_water_est_U,type="p",pch=1, col=1,ylim = c(-2,30),xlim = c(0,365),xlab="Doy",ylab="Estimated lake temperatures(deg C)")
matlines(Year2014McJtemps$Doy,Year2014McJtemps$Ts_water_est_U,type="p",pch=1, col=2)
matlines(Year2015McJtemps$Doy,Year2015McJtemps$Ts_water_est_U,type="p",pch=1, col=3)
matlines(Year2016McJtemps$Doy,Year2016McJtemps$Ts_water_est_U,type="p",pch=1, col=4)

box()

abline(h = 0)

text(100,30,"Ulken Shabahkty",cex=1.2)

legend(300, 30, c("2013","2014","2015","2016"),cex=1.0,pch=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/TslakeestimatedUlkenallyears.pdf')
dev.off()

# Measured lake temperatures all lakes, 2013

matplot(Year2013McJtemps$Doy,Year2013McJtemps$Ts_water_U,type="p",pch=1, col=1,ylim = c(-2,30),xlim = c(0,365),xlab="Doy",ylab="Measured lake temperatures(deg C)")
matlines(Year2013McJtemps$Doy,Year2013McJtemps$Ts_water_B,type="p",pch=1, col=2)
matlines(Year2013McJtemps$Doy,Year2013McJtemps$Ts_water_S,type="p",pch=1, col=3)


box()

abline(h = 0)

text(100,30,"All lakes, 2013",cex=1.2)

legend(290, 30, c("Ulken","Burabay","Shortandy"),cex=1.0,pch=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/Tslakemeasuredalllakes2013.pdf')
dev.off()

# Measured lake temperatures all lakes, 2014

matplot(Year2014McJtemps$Doy,Year2014McJtemps$Ts_water_U,type="p",pch=1, col=1,ylim = c(-2,30),xlim = c(0,365),xlab="Doy",ylab="Measured lake temperatures(deg C)")
matlines(Year2014McJtemps$Doy,Year2014McJtemps$Ts_water_B,type="p",pch=1, col=2)
matlines(Year2014McJtemps$Doy,Year2014McJtemps$Ts_water_S,type="p",pch=1, col=3)


box()

abline(h = 0)

text(100,30,"All lakes, 2014",cex=1.2)

legend(290, 30, c("Ulken","Burabay","Shortandy"),cex=1.0,pch=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/Tslakemeasuredalllakes2014.pdf')
dev.off()

# Measured lake temperatures all lakes, 2015

matplot(Year2015McJtemps$Doy,Year2015McJtemps$Ts_water_U,type="p",pch=1, col=1,ylim = c(-2,30),xlim = c(0,365),xlab="Doy",ylab="Measured lake temperatures(deg C)")
matlines(Year2015McJtemps$Doy,Year2015McJtemps$Ts_water_B,type="p",pch=1, col=2)
matlines(Year2015McJtemps$Doy,Year2015McJtemps$Ts_water_S,type="p",pch=1, col=3)


box()

abline(h = 0)

text(100,30,"All lakes, 2015",cex=1.2)

legend(290, 30, c("Ulken","Burabay","Shortandy"),cex=1.0,pch=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/Tslakemeasuredalllakes2015.pdf')
dev.off()

# Measured lake temperatures all lakes, 2016

matplot(Year2016McJtemps$Doy,Year2016McJtemps$Ts_water_U,type="p",pch=1, col=1,ylim = c(-2,30),xlim = c(0,365),xlab="Doy",ylab="Measured lake temperatures(deg C)")
matlines(Year2016McJtemps$Doy,Year2016McJtemps$Ts_water_B,type="p",pch=1, col=2)
matlines(Year2016McJtemps$Doy,Year2016McJtemps$Ts_water_S,type="p",pch=1, col=3)


box()

abline(h = 0)

text(100,30,"All lakes, 2016",cex=1.2)

legend(290, 30, c("Ulken","Burabay","Shortandy"),cex=1.0,pch=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/Tslakemeasuredalllakes2016.pdf')
dev.off()

# Measured lake temperatures all lakes, all years

matplot(McJtempsdata$deciYear,McJtempsdata$Ts_water_U,type="p",pch=1, col=1,cex = 0.7,ylim = c(-2,30),xlim = c(2013,2017),xlab="Doy",ylab="Measured lake temperatures(deg C)")
matlines(McJtempsdata$deciYear,McJtempsdata$Ts_water_B,type="p",pch=1, col=2,cex = 0.7)
matlines(McJtempsdata$deciYear,McJtempsdata$Ts_water_S,type="p",pch=1, col=3,cex = 0.7)


box()

abline(h = 0)

text(2013.5,30,"All lakes, all years",cex=1.2)

legend(2015.3, 30, c("Ulken","Burabay","Shortandy"),cex=0.8,pch=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/Tslakemeasuredalllakesallyears.pdf')
dev.off()


# Measured lake temperatures all lakes, all years, 10-day rolling mean

matplot(rollmean(McJtempsdata$deciYear,7),rollmean(McJtempsdata$Ts_water_U,7),type="l",lty=1, col=1,cex = 0.7,ylim = c(-2,30),xlim = c(2013,2017),xlab="Doy",ylab="Measured lake temperatures(deg C)")
matlines(rollmean(McJtempsdata$deciYear,7),rollmean(McJtempsdata$Ts_water_B,7),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(McJtempsdata$deciYear,7),rollmean(McJtempsdata$Ts_water_S,7),type="l",lty=1, col=3,cex = 0.7)

box()

abline(h = 0)

text(2015,30,"All lakes, all years, rolling mean",cex=1.2)

legend(2015.3, 28.0, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/Tslakemeasuredalllakesallyears10dayrollingman.pdf')
dev.off()

# Measured lake levels all lakes, all years, 10-day rolling mean

matplot(rollmean(meteodata$deciYear,10),rollmean(meteodata$h_water_Kaz_U,10),type="l",lty=1, col=1,cex = 1.0,ylim = c(700,1000),xlim = c(2013,2017),xlab="Doy",ylab="Measured lake levels (cm)")
matlines(rollmean(meteodata$deciYear,10),rollmean(meteodata$h_water_Kaz_B,10),type="l",lty=1, col=2,cex = 1.0)
matlines(rollmean(meteodata$deciYear,10),rollmean(meteodata$h_water_Kaz_S,10),type="l",lty=1, col=3,cex = 1.0)

box()

abline(h = 0)

text(2015,1000,"All lakes, all years, rolling mean",cex=1.2)

legend(2015.3, 970, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/lakelevelmeasuredalllakesallyears10dayrollingman.pdf')
dev.off()

# Lake storage G, McJannet all lakes, all years, 10-day rolling mean

matplot(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Gw_MacJmm_U,10),type="p",pch=1, col=1,cex = 0.7,ylim = c(-5,10),xlim = c(2013,2017),xlab="Doy",ylab="Lake heat storage, McJannet (mm day-1)")
matlines(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Gw_MacJmm_B,10),type="p",pch=1, col=2,cex = 0.7)
matlines(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Gw_MacJmm_S,10),type="p",pch=1, col=3,cex = 0.7)

box()

abline(h = 0)

text(2015,10,"McJannet equilibrium model, rolling mean",cex=1.2)

legend(2013, -3, c("Ulken","Burabay","Shortandy"),cex=0.8,pch=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/lakestorageGMacJalllakesallyears10dayrollingman.pdf')
dev.off()

# Lake net radiation, McJannett all lakes, all years, 10-day rolling mean

matplot(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Rn_water_MacJ_estmm_U,10),type="p",pch=1, col=1,cex = 0.7,ylim = c(-5,10),xlim = c(2016,2017),xlab="Doy",ylab="Lake net radiation, McJannet (mm day-1)")
matlines(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Rn_water_MacJ_estmm_B,10),type="p",pch=1, col=2,cex = 0.7)
matlines(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Rn_water_MacJ_estmm_S,10),type="p",pch=1, col=3,cex = 0.7)
matlines(rollmean(meteodata$deciYear,10),(rollmean(meteodata$RN_EC,10))/28.4,type="p",pch=1, col=4,cex = 0.7)

box()

abline(h = 0)

text(2015,10,"McJannet equilibrium model, rolling mean",cex=1.2)

legend(2013, 0, c("Ulken","Burabay","Shortandy"),cex=0.8,pch=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/lakenetradiationMacJalllakesallyears10dayrollingman.pdf')
dev.off()

# Lake evaporation all lakes, McJannet all years, 10-day rolling mean

matplot(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Elake_McJmm_U,10),type="p",pch=1, col=1,cex = 0.7,ylim = c(-5,10),xlim = c(2013,2017),xlab="Doy",ylab="Lake evaporation, McJannet (mm day-1)")
matlines(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Elake_McJmm_B,10),type="p",pch=1, col=2,cex = 0.7)
matlines(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Elake_McJmm_S,10),type="p",pch=1, col=3,cex = 0.7)

box()

abline(h = 0)

text(2015,10,"McJannet equilibrium model, rolling mean",cex=1.2)

legend(2013, -2, c("Ulken","Burabay","Shortandy"),cex=0.8,pch=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/lakeevaporationMacJalllakesallyears10dayrollingman.pdf')
dev.off()

# Lake evaporation all lakes, McJannet all years, 10-day rolling mean, lines

matplot(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Elake_McJmm_U,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(-5,10),xlim = c(2013,2017),xlab="Doy",ylab="Lake evaporation, McJannet (mm day-1)")
matlines(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Elake_McJmm_B,10),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Elake_McJmm_S,10),type="l",lty=1, col=3,cex = 0.7)

box()

abline(h = 0)

text(2015,10,"McJannet equilibrium model, rolling mean",cex=1.2)

legend(2013.8, 9, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/lakeevaporationMacJalllakesallyears10dayrollingmanlines.pdf')
dev.off()

# Lake evaporation all lakes, McJannet & Aero all years, 10-day rolling mean, lines

matplot(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Elake_McJmm_U,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(-5,10),xlim = c(2013,2017),xlab="Doy",ylab="Lake evaporation, McJannet (mm day-1)")
matlines(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Elake_McJmm_B,10),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Elake_McJmm_S,10),type="l",lty=1, col=3,cex = 0.7)
matlines(rollmean(Elakedata1$deciYear,10),rollmean(Elakedata1$Elake_aero_U,10),type="l",lty=2, col=4,cex = 0.7)
matlines(rollmean(Elakedata1$deciYear,10),rollmean(Elakedata1$Elake_aero_B,10),type="l",lty=2, col=5,cex = 0.7)
matlines(rollmean(Elakedata1$deciYear,10),rollmean(Elakedata1$Elake_aero_S,10),type="l",lty=2, col=6,cex = 0.7)


box()

abline(h = 0)

text(2015,10,"McJannet equilibrium model, rolling mean",cex=1.2)

legend(2013.8, 9, c("Ulken McJ","Burabay McJ","Shortandy McJ"),cex=0.8,lty=1:1:1:1,col=1:2:3);

legend(2015.8, 9, c("Ulken Aero","Burabay Aero","Shortandy Aero"),cex=0.8,lty=2:2:1:2,col=4:5:6);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/lakeevaporationMacJallplusaerolakesallyears10dayrollingmanlines.pdf')
dev.off()



# Lake sensible heat flux, McJannet, all years, 10-day rolling mean

matplot(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Hlake_McJmm_U,10),type="p",pch=1, col=1,cex = 0.7,ylim = c(-5,10),xlim = c(2013,2017),xlab="Doy",ylab="Lake sensible heat flux, McJannet (mm day-1)")
matlines(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Hlake_McJmm_B,10),type="p",pch=1, col=2,cex = 0.7)
matlines(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Hlake_McJmm_S,10),type="p",pch=1, col=3,cex = 0.7)

box()

abline(h = 0)

text(2015,10,"McJannet equilibrium model, rolling mean",cex=1.2)
text(2015,8,"Hlake_McJannetmm = (rho_air*C_air*86400*(Ts_water_est-Tair)/ra_MacJ)/lambda", cex = 0.8)

legend(2013, 5, c("Ulken","Burabay","Shortandy"),cex=0.8,pch=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/lakesensibleheatfluxMacJalllakesallyears10dayrollingman.pdf')
dev.off()

# Lake sensible heat flux, McJannet, energy balance all years, 10-day rolling mean

matplot(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Hlake_McJmm_EB_U,10),type="p",pch=1, col=1,cex = 0.7,ylim = c(-5,10),xlim = c(2013,2017),xlab="Doy",ylab="Lake sensible heat flux, McJannet (mm day-1)")
matlines(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Hlake_McJmm_EB_B,10),type="p",pch=1, col=2,cex = 0.7)
matlines(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Hlake_McJmm_EB_S,10),type="p",pch=1, col=3,cex = 0.7)

box()

abline(h = 0)

text(2015,10,"McJannet equilibrium model, rolling mean",cex=1.2)
text(2015,8,"Hlake_McJ = Rn-G-E", cex = 0.8)

legend(2013, 5, c("Ulken","Burabay","Shortandy"),cex=0.8,pch=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/lakesensibleheatfluxMacJenbalalllakesallyears10dayrollingman.pdf')
dev.off()





# Tau Ulken Shabahkty all years

matplot(Year2013McJtemps$Doy,Year2013McJtemps$tau_MacJ_U,type="p",pch=1, col=1,ylim = c(0,70),xlim = c(0,365),xlab="Doy",ylab="Time constant, tau (days)")
matlines(Year2014McJtemps$Doy,Year2014McJtemps$tau_MacJ_U,type="p",pch=1, col=2)
matlines(Year2015McJtemps$Doy,Year2015McJtemps$tau_MacJ_U,type="p",pch=1, col=3)
matlines(Year2016McJtemps$Doy,Year2016McJtemps$tau_MacJ_U,type="p",pch=1, col=4)

box()

text(100,70,"Ulken Shabahkty",cex=1.2)

legend(310, 70, c("2013","2014","2015","2016"),cex=1.0,pch=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/TauMcJUlkenallyears.pdf')
dev.off()

# Tau Burabay all years

matplot(Year2013McJtemps$Doy,Year2013McJtemps$tau_MacJ_B,type="p",pch=1, col=1,ylim = c(0,70),xlim = c(0,365),xlab="Doy",ylab="Time constant, tau (days)")
matlines(Year2014McJtemps$Doy,Year2014McJtemps$tau_MacJ_B,type="p",pch=1, col=2)
matlines(Year2015McJtemps$Doy,Year2015McJtemps$tau_MacJ_B,type="p",pch=1, col=3)
matlines(Year2016McJtemps$Doy,Year2016McJtemps$tau_MacJ_B,type="p",pch=1, col=4)

box()

text(100,70,"Burabay",cex=1.2)

legend(300, 70, c("2013","2014","2015","2016"),cex=1.0,pch=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/TauMcJBurabayallyears.pdf')
dev.off()

# Tau Shortandy all years

matplot(Year2013McJtemps$Doy,Year2013McJtemps$tau_MacJ_S,type="p",pch=1, col=1,ylim = c(0,70),xlim = c(0,365),xlab="Doy",ylab="Time constant, tau (days)")
matlines(Year2014McJtemps$Doy,Year2014McJtemps$tau_MacJ_S,type="p",pch=1, col=2)
matlines(Year2015McJtemps$Doy,Year2015McJtemps$tau_MacJ_S,type="p",pch=1, col=3)
matlines(Year2016McJtemps$Doy,Year2016McJtemps$tau_MacJ_S,type="p",pch=1, col=4)

box()

text(100,70,"Shortandy",cex=1.2)

legend(300, 70, c("2013","2014","2015","2016"),cex=1.0,pch=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/TauMcJShortandyallyears.pdf')
dev.off()


# Tau all lakes, McJannet all years, 10-day rolling mean, lines

matplot(rollmean(McJtempsdata$deciYear,10),rollmean(McJtempsdata$tau_MacJ_U,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(0,50),xlim = c(2013,2017),xlab="Doy",ylab="Time constant, tau (days)")
matlines(rollmean(McJtempsdata$deciYear,10),rollmean(McJtempsdata$tau_MacJ_B,10),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(McJtempsdata$deciYear,10),rollmean(McJtempsdata$tau_MacJ_S,10),type="l",lty=1, col=3,cex = 0.7)

box()

abline(h = 0)

text(2015,50,"McJannet equilibrium model, rolling mean",cex=1.2)

legend(2013.8, 45, c("Ulken","Burabay","Shortandy"),cex=0.8,pch=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/TauMacJalllakesallyears10dayrollingmanlines.pdf')
dev.off()


# Measured air temperatures different stations, all years, 10-day rolling mean

matplot(rollmean(meteodata$deciYear,10),rollmean(meteodata$Tair,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(-30,30),xlim = c(2013,2017),xlab="Doy",ylab="Measured air temperatures(deg C)")
matlines(rollmean(meteodata$deciYear,10),rollmean(meteodata$Ta_Shu,10),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(meteodata$deciYear,10),rollmean(meteodata$Ta_B_old,10),type="l",lty=1, col=3,cex = 0.7)
matlines(rollmean(meteodata$deciYear,10),rollmean(meteodata$Tmean_Davis,10),type="l",lty=1, col=4,cex = 0.7)
matlines(rollmean(meteodata$deciYear,10),rollmean(meteodata$Tmean_EC,10),type="l",lty=1, col=5,cex = 0.7)


box()

abline(h = 0)

text(2014.5,30,"Air temperatures for different stations, 10-day RM",cex=1.2)
text(2014.5,28,"What happened in summer 2015? Tmean looked strange, replaced with Burabay-new for 2013-2015..",cex=0.6)
text(2014.5,26,"Don't have Sh/B data for 2016 to further compare.., missing too at end of 2015?",cex=0.6)

legend(2013, -20, c("Kaz-Hydromet","Shushinsk","Burabay old"),cex=0.8,lty=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/TairvariousWeatherstationsallyears10dayrollingman.pdf')
dev.off()

# Radiation balance Ulken, McJannet all years, 10-day rolling mean, lines, all in MJ m-2 day-1. Incoming fluxes and S_upare valid in winter, but not Rlin_out as there is no Ts_water. I have set it to zero..

matplot(rollmean(McJradiationdata$deciYear,10),rollmean(McJradiationdata$Rn_water_MacJ_U,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(-5,40),xlim = c(2013,2017),xlab="Doy",ylab="Radiation component, McJannet (MJ m-2 day-1)")
matlines(rollmean(McJradiationdata$deciYear,10),rollmean(McJradiationdata$Rs_water_MacJ_U,10),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(McJradiationdata$deciYear,10),rollmean(McJradiationdata$Rlin_MacJ_U,10),type="l",lty=1, col=3,cex = 0.7)
matlines(rollmean(McJradiationdata$deciYear,10),rollmean(McJradiationdata$Rlout_MacJ_U,10),type="l",lty=1, col=4,cex = 0.7)

box()

abline(h = 0)

text(2015,40,"McJannet equilibrium model, rolling mean",cex=1.2)

legend(2013.7,39, c("Rn","Rs","Rl_in","Rl_out"),cex=0.8,lty=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/RadiationbalanceMacJUlkenallyears10dayrollingmanlines.pdf')
dev.off()


# Energy balance Ulken, De Bruin & Van Dool all years, 10-day rolling mean, lines, all in W m-2 day-1

matplot(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Rn_water_DBVD_U,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(-200,300),xlim = c(2013,2017),xlab="Doy",ylab="EB component, De Bruin & Van Dool (W m-2 day-1)")
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$G_DBVD_U,10),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Elake_DBVD_U,10),type="l",lty=1, col=3,cex = 0.7)
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Hlake_DBVD_U,10),type="l",lty=1, col=4,cex = 0.7)

box()

abline(h = 0)

text(2015,300,"De Bruin & Van Dool equilibrium model, rolling mean, Ulken",cex=1.0)
text(2015,280,"Hlake from 'Dalton equation'",cex=0.8)

legend(2013.7,260, c("Rn","G","LE","H"),cex=0.8,lty=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/EnergybalanceDBVDallyears10dayrollingmanlinesUlken.pdf')
dev.off()

# Energy balance Burabay, De Bruin & Van Dool all years, 10-day rolling mean, lines, all in W m-2 day-1

matplot(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Rn_water_DBVD_B,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(-200,300),xlim = c(2013,2017),xlab="Doy",ylab="EB component, De Bruin & Van Dool (W m-2 day-1)")
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$G_DBVD_B,10),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Elake_DBVD_B,10),type="l",lty=1, col=3,cex = 0.7)
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Hlake_DBVD_B,10),type="l",lty=1, col=4,cex = 0.7)

box()

abline(h = 0)

text(2015,300,"De Bruin & Van Dool equilibrium model, rolling mean, Burabay",cex=1.0)
text(2015,280,"Hlake from 'Dalton' equation",cex=0.8)

legend(2013.7,260, c("Rn","G","LE","H"),cex=0.8,lty=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/EnergybalanceDBVDallyears10dayrollingmanlinesBurabay.pdf')
dev.off()


# Energy balance Shabahkty, De Bruin & Van Dool all years, 10-day rolling mean, lines, all in W m-2 day-1

matplot(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Rn_water_DBVD_S,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(-200,300),xlim = c(2013,2017),xlab="Doy",ylab="EB component, De Bruin & Van Dool (W m-2 day-1)")
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$G_DBVD_S,10),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Elake_DBVD_S,10),type="l",lty=1, col=3,cex = 0.7)
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Hlake_DBVD_S,10),type="l",lty=1, col=4,cex = 0.7)

box()

abline(h = 0)

text(2015,300,"De Bruin & Van Dool equilibrium model, rolling mean, Shabahkty",cex=1.0)
text(2015,280,"Hlake from 'Dalton' equation",cex=0.8)

legend(2013.7,260, c("Rn","G","LE","H"),cex=0.8,lty=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/EnergybalanceDBVDallyears10dayrollingmanlinesShabahkty.pdf')
dev.off()

# Energy balance Shabahkty, De Bruin & Van Dool all years, 10-day rolling mean, lines, all in W m-2 day-1

matplot(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Rn_water_DBVD_S,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(-200,300),xlim = c(2016,2017),xlab="Doy",ylab="EB component, De Bruin & Van Dool (W m-2 day-1)")
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$G_DBVD_S,10),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Elake_DBVD_S,10),type="l",lty=1, col=3,cex = 0.7)
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Hlake_DBVD_S,10),type="l",lty=1, col=4,cex = 0.7)
matlines(rollmean(meteodata$deciYear,10),rollmean(meteodata$RN_EC,10),type="p",pch=1, col=1,cex = 0.7)


box()

abline(h = 0)

text(2015,300,"De Bruin & Van Dool equilibrium model, rolling mean, Shabahkty",cex=1.0)
text(2015,280,"Hlake from 'Dalton' equation",cex=0.8)

legend(2016.7,260, c("Rn","G","LE","H"),cex=0.8,lty=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/EnergybalanceDBVDallyears10dayrollingmanlinesShabahktyplusmeasurements.pdf')
dev.off()

# Net radiation all lakes, De Bruin & Van Dool all years, 10-day rolling mean, lines, all in W m-2 day-1

matplot(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Rn_water_DBVD_U,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(-200,300),xlim = c(2013,2017),xlab="Doy",ylab="Net radiation, De Bruin & Van Dool (W m-2 day-1)")
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Rn_water_DBVD_B,10),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Rn_water_DBVD_S,10),type="l",lty=1, col=3,cex = 0.7)


box()

abline(h = 0)

text(2015,300,"De Bruin & Van Dool equilibrium model, rolling mean",cex=1.0)

legend(2013.0,290, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/NetradiationDBVDallyears10dayrollingmanlinesalllakes.pdf')
dev.off()

# Net radiation Shortandy, De Bruin & Van Dool all years, 10-day rolling mean, lines, plus net radiation measured and shortwave incoming measured modelled all in W m-2 day-1

matplot(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Rn_water_DBVD_S,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(-200,300),xlim = c(2015,2017),xlab="Doy",ylab="Net radiation, De Bruin & Van Dool (W m-2 day-1)")

matlines(rollmean(meteodata$deciYear,10),rollmean(meteodata$RN_EC,10),type="p",pch=1, col=1,cex = 0.7)
matlines(rollmean(McJradiationdata$deciYear,10),11.6*(rollmean(McJradiationdata$RsMJm2day,10)),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(meteodata$deciYear,10),rollmean(meteodata$Solar_Rad_Davis,10),type="p",pch=1, col=2,cex = 0.7)



box()

abline(h = 0)

text(2016.8,300,"De Bruin & Van Dool",cex=1.0)

legend(2016.4,-50, c("Shortandy Rn DBVD","Shortandy Rn measured","Rs modelled","Rs Davis"),cex=0.8,lty=1:1:1:1,col=1:2:1:2);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/MeasuremodelledradiationDBVDallyears10dayrollingmanlinesShortandy.pdf')
dev.off()


# Heat storage all lakes, De Bruin & Van Dool all years, 10-day rolling mean, lines, all in W m-2 day-1

matplot(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$G_DBVD_U,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(-200,300),xlim = c(2013,2017),xlab="Doy",ylab="Heat storage, De Bruin & Van Dool (W m-2 day-1)")
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$G_DBVD_B,10),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$G_DBVD_S,10),type="l",lty=1, col=3,cex = 0.7)


box()

abline(h = 0)

text(2015,300,"De Bruin & Van Dool equilibrium model, rolling mean",cex=1.0)

legend(2013.0,290, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/HeatstorageDBVDallyears10dayrollingmanlinesalllakes.pdf')
dev.off()

# Lake evaporation all lakes, De Bruin & Van Dool all years, 10-day rolling mean, lines, all in W m-2 day-1

matplot(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Elake_DBVD_U,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(-200,300),xlim = c(2013,2017),xlab="Doy",ylab="Lake Evaporation, De Bruin & Van Dool (W m-2 day-1)")
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Elake_DBVD_B,10),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Elake_DBVD_S,10),type="l",lty=1, col=3,cex = 0.7)


box()

abline(h = 0)

text(2015,300,"De Bruin & Van Dool equilibrium model, rolling mean",cex=1.0)

legend(2013.7,260, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/EvaporationDBVDallyears10dayrollingmanlinesalllakes.pdf')
dev.off()


# Lake evaporation all lakes, De Bruin & Van Dool all years, 10-day rolling mean, lines, all in mm day-1

matplot(rollmean(DBVDfluxdata$deciYear,10),(rollmean(DBVDfluxdata$Elake_DBVD_U,10)/28.4),type="l",lty=1, col=1,cex = 0.7,ylim = c(-1,10),xlim = c(2013,2017),xlab="Doy",ylab="Lake Evaporation, De Bruin & Van Dool (mm day-1)")
matlines(rollmean(DBVDfluxdata$deciYear,10),(rollmean(DBVDfluxdata$Elake_DBVD_B,10)/28.4),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(DBVDfluxdata$deciYear,10),(rollmean(DBVDfluxdata$Elake_DBVD_S,10)/28.4),type="l",lty=1, col=3,cex = 0.7)


box()

abline(h = 0)

text(2015,10,"De Bruin & Van Dool equilibrium model, rolling mean",cex=1.0)

legend(2013.7,7, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/EvaporationDBVDallyears10dayrollingmanlinesalllakesmmday.pdf')
dev.off()

# Lake evaporation Ulken, De Bruin & Van Dool, Finch & Hall, Aerodynamic and McJanet all years, 10-day rolling mean, lines, all in mm day-1

matplot(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Elake_McJmm_U,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(-1,10),xlim = c(2013,2017),xlab="Doy",ylab="Lake Evaporation, De Bruin & Van Dool (mm day-1)")
matlines(rollmean(DBVDfluxdata$deciYear,10),(rollmean(DBVDfluxdata$Elake_DBVD_U,10)/28.4),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(FHfluxdata$deciYear,10),(rollmean(FHfluxdata$Elake_FH_U,10)/28.4),type="l",lty=1, col=3,cex = 0.7)
matlines(rollmean(Elakedata1$deciYear,10),rollmean(Elakedata1$Elake_aero_U,10),type="l",lty=1, col=4,cex = 0.7)


box()

abline(h = 0)

text(2015,10,"De Bruin & Van Dool & McJannet & FH equilibrium model plus aerodynamic method",cex=0.9)
text(2015,9,"Rolling mean, Ulken Shabahkty lake",cex=0.9)

legend(2013.,8.0, c("McJannet","De Bruin & Van Dool","Finch & Hall","Aerodynamic method"),cex=0.8,lty=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/EvaporationMCJDBVDFHAeroallyears10dayrollingmanlinesUlkenmmday.pdf')
dev.off()



# Lake evaporation Burabay, De Bruin & Van Dool, Finch & Hall, Aerodynamic and McJanet all years, 10-day rolling mean, lines, all in mm day-1

matplot(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Elake_McJmm_B,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(-1,10),xlim = c(2013,2017),xlab="Doy",ylab="Lake Evaporation, De Bruin & Van Dool (mm day-1)")
matlines(rollmean(DBVDfluxdata$deciYear,10),(rollmean(DBVDfluxdata$Elake_DBVD_B,10)/28.4),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(FHfluxdata$deciYear,10),(rollmean(FHfluxdata$Elake_FH_B,10)/28.4),type="l",lty=1, col=3,cex = 0.7)
matlines(rollmean(Elakedata1$deciYear,10),rollmean(Elakedata1$Elake_aero_B,10),type="l",lty=1, col=4,cex = 0.7)


box()

abline(h = 0)

text(2015,10,"De Bruin & Van Dool & McJannet & FH equilibrium model plus aerodynamic method",cex=0.9)
text(2015,9,"Rolling mean, Burabay lake",cex=0.9)

legend(2015.7,8.3, c("McJannet","De Bruin & Van Dool","Finch & Hall","Aerodynamic method"),cex=0.8,lty=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/EvaporationMCJDBVDFHAeroallyears10dayrollingmanlinesBurabaymmday.pdf')
dev.off()

# Lake evaporation Shortandy, De Bruin & Van Dool, Finch & Hall, Aerodynamic and McJanet all years, 10-day rolling mean, lines, all in mm day-1

matplot(rollmean(McJfluxdata$deciYear,10),rollmean(McJfluxdata$Elake_McJmm_S,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(-1,10),xlim = c(2013,2017),xlab="Doy",ylab="Lake Evaporation, De Bruin & Van Dool (mm day-1)")
matlines(rollmean(DBVDfluxdata$deciYear,10),(rollmean(DBVDfluxdata$Elake_DBVD_S,10)/28.4),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(FHfluxdata$deciYear,10),(rollmean(FHfluxdata$Elake_FH_S,10)/28.4),type="l",lty=1, col=3,cex = 0.7)
matlines(rollmean(Elakedata1$deciYear,10),rollmean(Elakedata1$Elake_aero_S,10),type="l",lty=1, col=4,cex = 0.7)


box()

abline(h = 0)

text(2015,10,"De Bruin & Van Dool & McJannet & FH equilibrium model plus aerodynamic method",cex=0.9)
text(2015,9,"Rolling mean, Shortandy lake",cex=0.9)

legend(2013,8.3, c("McJannet","De Bruin & Van Dool","Finch & Hall","Aerodynamic method"),cex=0.8,lty=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/EvaporationMCJDBVDFHAeroallyears10dayrollingmanlinesShortandymmday.pdf')
dev.off()




# Sensible heat flux  all lakes, De Bruin & Van Dool all years, 10-day rolling mean, lines, all in W m-2 day-1

matplot(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Hlake_DBVD_U,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(-200,300),xlim = c(2013,2017),xlab="Doy",ylab="Lake Sensible heat flux, De Bruin & Van Dool (W m-2 day-1)")
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Hlake_DBVD_B,10),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$Hlake_DBVD_S,10),type="l",lty=1, col=3,cex = 0.7)


box()

abline(h = 0)

text(2015,300,"De Bruin & Van Dool equilibrium model, rolling mean",cex=1.0)
text(2015,280,"Hlake from 'Dalton' equation",cex=0.8)

legend(2013.7,260, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/SensibleheatfluxDBVDallyears10dayrollingmanlinesalllakes.pdf')
dev.off()


# Tau  all lakes, De Bruin & Van Dool all years, 10-day rolling mean, lines,

matplot(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$tau_DBVD_U,10),type="l",lty=1, col=1,cex = 0.7,ylim = c(0,50),xlim = c(2013,2017),xlab="Doy",ylab="Time constant, tau, De Bruin & Van Dool (days)")
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$tau_DBVD_B,10),type="l",lty=1, col=2,cex = 0.7)
matlines(rollmean(DBVDfluxdata$deciYear,10),rollmean(DBVDfluxdata$tau_DBVD_S,10),type="l",lty=1, col=3,cex = 0.7)


box()

abline(h = 0)

text(2015,50,"De Bruin & Van Dool equilibrium model, rolling mean",cex=1.0)


legend(2014,45, c("Ulken","Burabay","Shortandy"),cex=0.8,lty=1:1:1:1,col=1:2:3);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/TauDBVDallyears10dayrollingmanlinesalllakes.pdf')
dev.off()


# Lake E-P compared to change in waterlevels lake Ulken all years, aerodynamic & McJannet method

matplot(Lakelevelsdata$deciYear,Lakelevelsdata$PminusEaero_U,type="l",lty=1, col=1,ylim = c(-400,300),xlim = c(2013,2017),xlab="Doy",ylab="Cumulative P-E (mm day-1) &  Delta_WL")
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$PminusEMcJ_U,type="l",lty=1, col=2)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$PminusEDBVD_U,type="l",lty=1, col=3)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$PminusEFH_U,type="l",lty=1, col=4)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$WLchange_U,type="l",lty=1, col=5)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$switchOW_U,type="p",pch=1, col=6)

box()

abline(h = 0)

text(2015,300,"Lake Ulken",cex=1.0)


legend(2014,230, c("Aerodynamic","McJannet","De Bruin & Van Dool","Finch & Hall","Lake level variations"),cex=0.8,lty=1:1:1:1,col=1:2:3:4:5);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/PminusEplotUlken.pdf')
dev.off()

# Lake E-P compared to change in waterlevels lake Burabay all years, aerodynamic & McJannet method

matplot(Lakelevelsdata$deciYear,Lakelevelsdata$PminusEaero_B,type="l",lty=1, col=1,ylim = c(-400,500),xlim = c(2013,2017),xlab="Doy",ylab="Cumulative P-E (mm day-1) &  Delta_WL")
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$PminusEMcJ_B,type="l",lty=1, col=2)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$PminusEDBVD_B,type="l",lty=1, col=3)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$PminusEFH_B,type="l",lty=1, col=4)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$WLchange_B,type="l",lty=1, col=5)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$switchOW_B,type="p",pch=1, col=6)

box()

abline(h = 0)

text(2016,500,"Lake Burabay",cex=1.0)


legend(2014,500, c("Aerodynamic","McJannet","De Bruin & Van Dool","Finch & Hall","Lake level variations"),cex=0.8,lty=1:1:1:1,col=1:2:3:4:5);


dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/PminusEplotBurabay.pdf')
dev.off()

# Lake E-P compared to change in waterlevels lake Shortandy all years, aerodynamic & McJannet method

matplot(Lakelevelsdata$deciYear,Lakelevelsdata$PminusEaero_S,type="l",lty=1, col=1,ylim = c(-400,400),xlim = c(2013,2017),xlab="Doy",ylab="Cumulative P-E (mm day-1) &  Delta_WL")
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$PminusEMcJ_S,type="l",lty=1, col=2)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$PminusEDBVD_S,type="l",lty=1, col=3)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$PminusEFH_S,type="l",lty=1, col=4)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$WLchange_S,type="l",lty=1, col=5)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$switchOW_S,type="p",pch=1, col=6)

box()

abline(h = 0)

text(2015,300,"Lake Shortandy",cex=1.0)

legend(2014,230, c("Aerodynamic","McJannet","De Bruin & Van Dool","Finch & Hall","Lake level variations"),cex=0.8,lty=1:1:1:1,col=1:2:3:4:5);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/PminusEplotShortandy.pdf')
dev.off()

# Loss term from -((E-P) - waterlevels) for lake Ulken all years, aerodynamic & McJannet method

matplot(Lakelevelsdata$deciYear,Lakelevelsdata$FeedtermEaero_U,type="l",lty=1, col=1,ylim = c(-400,400),xlim = c(2013,2017),xlab="Doy",ylab="Cumulative 'loss' term required (mm day-1)")
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$FeedtermEMcJ_U,type="l",lty=1, col=2)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$FeedtermEDBVD_U,type="l",lty=1, col=3)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$FeedtermEFH_U,type="l",lty=1, col=4)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$switchOW_U,type="p",pch=1, col=5,cex = 0.7)

box()

abline(h = 0)

text(2015,400,"Lake Ulken",cex=1.0)

text(2015,300, "Positive represents need for another gain term..",cex=1.0)
text(2015,-250, "Negative represents need for another loss term..",cex=1.0)


legend(2014,230, c("Aerodynamic","McJannet","De Bruin & Van Dool","Finch & Hall"),cex=0.8,lty=1:1:1:1,col=1:2:3:4);


dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/FeedtermplotUlken.pdf')
dev.off()

# Loss term from -((E-P) - waterlevels) for lake Burabay all years, aerodynamic & McJannet method

matplot(Lakelevelsdata$deciYear,Lakelevelsdata$FeedtermEaero_B,type="l",lty=1, col=1,ylim = c(-400,800),xlim = c(2013,2017),xlab="Doy",ylab="Cumulative 'loss' term required (mm day-1) ")
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$FeedtermEMcJ_B,type="l",lty=1, col=2)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$FeedtermEDBVD_B,type="l",lty=1, col=3)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$FeedtermEFH_B,type="l",lty=1, col=4)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$switchOW_B,type="p",pch=1, col=5,cex = 0.7)

box()

abline(h = 0)

text(2015.5,800,"Lake Burabay",cex=1.0)

text(2015.5,400, "Positive represents need for another gain term..",cex=1.0)
text(2015.5,-400, "Negative represents need for another loss term..",cex=1.0)

legend(2015,-75, c("Aerodynamic","McJannet","De Bruin & Van Dool","Finch & Hall"),cex=0.8,lty=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/FeedtermplotBurabay.pdf')
dev.off()

# Loss term from -((E-P) - waterlevels) for lake Shortandy all years, aerodynamic & McJannet method

matplot(Lakelevelsdata$deciYear,Lakelevelsdata$FeedtermEaero_S,type="l",lty=1, col=1,ylim = c(-400,400),xlim = c(2013,2017),xlab="Doy",ylab="Cumulative 'loss' term required (mm day-1)")
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$FeedtermEMcJ_S,type="l",lty=1, col=2)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$FeedtermEDBVD_S,type="l",lty=1, col=3)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$FeedtermEFH_S,type="l",lty=1, col=4)
matlines(Lakelevelsdata$deciYear,Lakelevelsdata$switchOW_S,type="p",pch=1, col=5,cex = 0.7)

box()

abline(h = 0)

text(2015.5,400,"Lake Shortandy",cex=1.0)

text(2015.5,250, "Positive represents need for another gain term..",cex=1.0)
text(2015.5,-250, "Negative represents need for another loss term..",cex=1.0)

legend(2013.2,-75, c("Aerodynamic","McJannet","De Bruin & Van Dool","Finch & Hall"),cex=0.8,lty=1:1:1:1,col=1:2:3:4);

dev.copy(pdf,'/Users/anneverhoef/Documents/Kazahkstan/Burabaylakescode/LakeplotsR/FeedtermplotShortandy.pdf')
dev.off()

