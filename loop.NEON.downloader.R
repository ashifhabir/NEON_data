
####### For loop for downloading data from 1 site at a time and looping through 
###### all of NEON sites one by one

library(neonUtilities)
library(dplyr)
library(tidyverse)
library(lubridate)

# home.path <- setwd("C:/OneDrive/OneDrive - USNH/Desktop/NEON_data/")
#Desktop.path <- setwd("C:/Ashif/OneDrive - USNH/Desktop/NEON_data/")
mac.path <- setwd("~/Library/CloudStorage/OneDrive-USNH/Desktop/NEON_data/")

#
terrsites = c(
  "ABBY", "BARR", "BART", "BLAN", "BONA", "CLBJ",
  "CPER", "DCFS", "DEJU", "DELA", "DSNY", "GRSM", 
  "GUAN", "HARV", "HEAL", "JERC", "JORN", "KONA", 
  "KONZ", "LAJA", "LENO", "MLBS", "MOAB", "NIWO", 
  "NOGP", "OAES", "ONAQ", "ORNL", "OSBS", #### PUUM site has no soil CO2 as of 12/30/2022
  "RMNP", "SCBI", "SERC", "SJER", "SOAP", "SRER", 
  "STEI", "STER", "TALL", "TEAK", "TOOL", "TREE",
  "UKFS", "UNDE", "WOOD", "WREF", "YELL"
)

terrsites <- str_sort(terrsites)



#************ Soil Temperature [30-min] ************************************
#************ Last Downloaded: 06/12/2023 *******************************

dataID.soiltemp = "DP1.00041.001"
tkn <- "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJhdWQiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnL2FwaS92MC8iLCJzdWIiOiJhc2hpZmhhc2FuLmFiaXJAdW5oLmVkdSIsInNjb3BlIjoicmF0ZTpwdWJsaWMiLCJpc3MiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnLyIsImV4cCI6MTgyMDIyNjQ2NSwiaWF0IjoxNjYyNTQ2NDY1LCJlbWFpbCI6ImFzaGlmaGFzYW4uYWJpckB1bmguZWR1In0.g7wvrb9QmJPG9tIUvnVHjLjIem-8NqFkZ4NEQXYG-SxlB5bUFWecc8PN3KsJ47bkQGt-JsFmhMDgPzK8JQFN4g"
for (i in 1:length(terrsites)) {
  siteID <- terrsites[i]
  Stemp <- loadByProduct(dpID=dataID.soiltemp, 
                         site=terrsites[i],
                         startdate = "2018-01",
                         enddate = "2023-05",
                         package="basic",
                         timeIndex = "30",
                         token = tkn,
                         check.size=F)
  write.csv(
    Stemp$ST_30_minute,
    paste0("LatestData/soil.temp/",
           "stemp.",siteID,
           ".csv"), 
    row.names = FALSE)
  
  rm(Stemp)
  rm(siteID)
}


#************ Soil CO2 Concentration [30-min] ******************************* 
#************ Last Downloaded: 06/14/2023 ************************************

dataIDco2= "DP1.00095.001"
tkn <- "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJhdWQiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnL2FwaS92MC8iLCJzdWIiOiJhc2hpZmhhc2FuLmFiaXJAdW5oLmVkdSIsInNjb3BlIjoicmF0ZTpwdWJsaWMiLCJpc3MiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnLyIsImV4cCI6MTgyMDIyNjQ2NSwiaWF0IjoxNjYyNTQ2NDY1LCJlbWFpbCI6ImFzaGlmaGFzYW4uYWJpckB1bmguZWR1In0.g7wvrb9QmJPG9tIUvnVHjLjIem-8NqFkZ4NEQXYG-SxlB5bUFWecc8PN3KsJ47bkQGt-JsFmhMDgPzK8JQFN4g"
for (i in 1:length(terrsites)) {
  siteID.sco2 <- terrsites[i]
  Sco2 <- loadByProduct(dpID=dataIDco2, 
                        site=terrsites[i],
                        startdate = "2018-01",
                        enddate = "2023-05",
                        package="basic",
                        timeIndex = "30",
                        token = tkn,
                        check.size=F)
  write.csv(
    Sco2$SCO2C_30_minute,
    paste0("LatestData/soil.co2/",
           "sco2.",siteID.sco2,
           ".csv"), 
    row.names = FALSE)
  
  rm(Sco2)
  rm(siteID.sco2)
  
}


#************** Soil water content [30-min] **********************
#************** Last Downloaded: 06/12/2023 **********************
dataIDswc= "DP1.00094.001"
tkn <- "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJhdWQiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnL2FwaS92MC8iLCJzdWIiOiJhc2hpZmhhc2FuLmFiaXJAdW5oLmVkdSIsInNjb3BlIjoicmF0ZTpwdWJsaWMiLCJpc3MiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnLyIsImV4cCI6MTgyMDIyNjQ2NSwiaWF0IjoxNjYyNTQ2NDY1LCJlbWFpbCI6ImFzaGlmaGFzYW4uYWJpckB1bmguZWR1In0.g7wvrb9QmJPG9tIUvnVHjLjIem-8NqFkZ4NEQXYG-SxlB5bUFWecc8PN3KsJ47bkQGt-JsFmhMDgPzK8JQFN4g"
for (i in 1:6) {
  siteID.swc <- terrsites[i]
  Swc <- loadByProduct(dpID=dataIDswc, 
                       site=terrsites[i],
                       startdate = "2018-01",
                       enddate = "2023-05",
                       package="basic",
                       timeIndex = "30",
                       token = tkn,
                       check.size=F)
  write.csv(
    Swc$SWS_30_minute,
    paste0("LatestData/soil.swc/",
           "swc.",siteID.swc,
           ".csv"), 
    row.names = FALSE)
  
  rm(Swc)
  rm(siteID.swc)
  
}


#*****************Air Temperature [ 30-min] ****************
#************Last Downloaded: 06/13/2023 ****************
dataIDatemp= "DP1.00003.001"   ### Air Temperature
tkn <- "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJhdWQiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnL2FwaS92MC8iLCJzdWIiOiJhc2hpZmhhc2FuLmFiaXJAdW5oLmVkdSIsInNjb3BlIjoicmF0ZTpwdWJsaWMiLCJpc3MiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnLyIsImV4cCI6MTgyMDIyNjQ2NSwiaWF0IjoxNjYyNTQ2NDY1LCJlbWFpbCI6ImFzaGlmaGFzYW4uYWJpckB1bmguZWR1In0.g7wvrb9QmJPG9tIUvnVHjLjIem-8NqFkZ4NEQXYG-SxlB5bUFWecc8PN3KsJ47bkQGt-JsFmhMDgPzK8JQFN4g"
for (i in 1:length(terrsites)) {
  siteID.airtemp <- terrsites[i]
  airtemp <- loadByProduct(dpID=dataIDatemp, 
                           site=terrsites[i],
                           startdate = "2018-01",
                           enddate = "2023-05",
                           package="basic",
                           timeIndex = "30",
                           token = tkn,
                           check.size=F)
  write.csv(
    airtemp$TAAT_30min,
    paste0("LatestData/air.temp/",
           "airtemp.",siteID.airtemp,
           ".csv"),
    row.names = FALSE)
  
  rm(airtemp)
  rm(siteID.airtemp)
}


#******* Stream Continuous Discharge [30-min] ****************
#******* Last Downloaded [06/26/2023] *********************
#******* Last Downloaded [08/21/2023] *********************
#******* Unit: Liter/sec ***********
#*Downloaded the "RELEASE-2023" Data from NEON, 2021 and 2022 is still provisional
aqsites = c(
  "ARIK", "BIGC", "BLDE", "BLUE", "BLWA",
  "CARI", "COMO", "CUPE", "FLNT", "GUIL",
  "HOPB", "KING", "LECO", "LEWI", "MART",
  "MAYF", "MCDI", "MCRA", "OKSR", "POSE",
  "PRIN", "REDB", "SYCA", "TECR", "TOMB",
  "TOOK", "WALK", "WLOU"
)

aqsites <- str_sort(aqsites)

dataID.discharge = "DP4.00130.001"   
tkn <- "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJhdWQiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnL2FwaS92MC8iLCJzdWIiOiJhc2hpZmhhc2FuLmFiaXJAdW5oLmVkdSIsInNjb3BlIjoicmF0ZTpwdWJsaWMiLCJpc3MiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnLyIsImV4cCI6MTgyMDIyNjQ2NSwiaWF0IjoxNjYyNTQ2NDY1LCJlbWFpbCI6ImFzaGlmaGFzYW4uYWJpckB1bmguZWR1In0.g7wvrb9QmJPG9tIUvnVHjLjIem-8NqFkZ4NEQXYG-SxlB5bUFWecc8PN3KsJ47bkQGt-JsFmhMDgPzK8JQFN4g"
for (i in 1:length(aqsites)) {
  siteID.discharge <- aqsites[i]
  discharge <- loadByProduct(dpID=dataID.discharge, 
                             site=siteID.discharge,
                             startdate = "2018-01",
                             enddate = "2022-12",
                             package="basic",
                             #timeIndex = "30",
                             nCores=6,
                             token = tkn,
                             release = "RELEASE-2023",
                             check.size=F)
  write.csv(
    discharge$csd_continuousDischarge,
    paste0("NEON.2023.Release/discharge.neon.main/",
           "discharge.",siteID.discharge,
           ".csv"), 
    row.names = FALSE)
  
  rm(siteID.discharge)
  rm(discharge)
  
}


#******* Barometric Pressure [30-min] ****************
#******* Last Downloaded [07/06/2023] *********************
#******* Unit: kilopascal ***********

terrsites = c(
  "ABBY", "BARR", "BART", "BLAN", "BONA", "CLBJ",
  "CPER", "DCFS", "DEJU", "DELA", "DSNY", "GRSM", 
  "GUAN", "HARV", "HEAL", "JERC", "JORN", "KONA", 
  "KONZ", "LAJA", "LENO", "MLBS", "MOAB", "NIWO", 
  "NOGP", "OAES", "ONAQ", "ORNL", "OSBS", #### PUUM site has no soil CO2 as of 12/30/2022
  "RMNP", "SCBI", "SERC", "SJER", "SOAP", "SRER", 
  "STEI", "STER", "TALL", "TEAK", "TOOL", "TREE",
  "UKFS", "UNDE", "WOOD", "WREF", "YELL"
)

terrsites <- str_sort(terrsites)


dataID.pressure= "DP1.00004.001"   ### Pressure
tkn <- "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJhdWQiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnL2FwaS92MC8iLCJzdWIiOiJhc2hpZmhhc2FuLmFiaXJAdW5oLmVkdSIsInNjb3BlIjoicmF0ZTpwdWJsaWMiLCJpc3MiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnLyIsImV4cCI6MTgyMDIyNjQ2NSwiaWF0IjoxNjYyNTQ2NDY1LCJlbWFpbCI6ImFzaGlmaGFzYW4uYWJpckB1bmguZWR1In0.g7wvrb9QmJPG9tIUvnVHjLjIem-8NqFkZ4NEQXYG-SxlB5bUFWecc8PN3KsJ47bkQGt-JsFmhMDgPzK8JQFN4g"
for (i in 1:length(terrsites)) {
  siteID.pressure <- terrsites[i]
  pressure <- loadByProduct(dpID=dataID.pressure, 
                            site= siteID.pressure,
                            startdate = "2019-01",
                            enddate = "2022-12",
                            package="basic",
                            timeIndex = "30",
                            token = tkn,
                            check.size=F)
  
  pressure.sensorpos <- pressure$sensor_positions_00004
  pressure.variables <- pressure$variables_00004
  pressure.data <- pressure$BP_30min
  
  write.csv(
    pressure.data,
    paste0("LatestData/bar.pressure/pressure.data/",
           "atm.pres.",siteID.pressure,
           ".csv"),
    row.names = FALSE)
  
  write.csv(
    pressure.sensorpos,
    paste0("LatestData/bar.pressure/pressure.sensor.position/",
           "atm.pres.sensporpos.",siteID.pressure,
           ".csv"),
    row.names = FALSE)
  
  write.csv(
    pressure.variables,
    paste0("LatestData/bar.pressure/pressure.variables/",
           "atm.pres.variables.",siteID.pressure,
           ".csv"),
    row.names = FALSE)
  
  rm(pressure)
  rm(pressure.data)
  rm(pressure.sensorpos)
  rm(pressure.variables)
  rm(siteID.pressure)
}



#### Soil Temperature sensor position
dataIDtemp= "DP1.00041.001"   ### Soil temperature
tkn <- "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJhdWQiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnL2FwaS92MC8iLCJzdWIiOiJhc2hpZmhhc2FuLmFiaXJAdW5oLmVkdSIsInNjb3BlIjoicmF0ZTpwdWJsaWMiLCJpc3MiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnLyIsImV4cCI6MTgyMDIyNjQ2NSwiaWF0IjoxNjYyNTQ2NDY1LCJlbWFpbCI6ImFzaGlmaGFzYW4uYWJpckB1bmguZWR1In0.g7wvrb9QmJPG9tIUvnVHjLjIem-8NqFkZ4NEQXYG-SxlB5bUFWecc8PN3KsJ47bkQGt-JsFmhMDgPzK8JQFN4g"
for (i in 1:length(terrsites)) {
  siteID <- terrsites[i]
  Stemp <- loadByProduct(dpID=dataIDtemp, 
                         site=terrsites[i],
                         startdate = "2022-01",
                         enddate = "2022-01",
                         package="expanded",
                         timeIndex = "30",
                         token = tkn,
                         check.size=F)
  write.csv(
    Stemp$sensor_positions_00041,
    paste0("C:/Ashif/OneDrive - USNH/Desktop/NEON_data/soil_temp/sensorpos/",
           "stempsensorpos.",terrsites[i],
           ".csv"), 
    row.names = FALSE)
  
}




#### Soil Co2 Concentration sensor position
dataIDco2= "DP1.00095.001"   ### Soil CO2 Concentration
tkn <- "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJhdWQiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnL2FwaS92MC8iLCJzdWIiOiJhc2hpZmhhc2FuLmFiaXJAdW5oLmVkdSIsInNjb3BlIjoicmF0ZTpwdWJsaWMiLCJpc3MiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnLyIsImV4cCI6MTgyMDIyNjQ2NSwiaWF0IjoxNjYyNTQ2NDY1LCJlbWFpbCI6ImFzaGlmaGFzYW4uYWJpckB1bmguZWR1In0.g7wvrb9QmJPG9tIUvnVHjLjIem-8NqFkZ4NEQXYG-SxlB5bUFWecc8PN3KsJ47bkQGt-JsFmhMDgPzK8JQFN4g"
for (i in 1:length(terrsites)) {
  siteID <- terrsites[i]
  Sco2 <- loadByProduct(dpID=dataIDco2, 
                        site=terrsites[i],
                        startdate = "2022-01",
                        enddate = "2022-01",
                        package="expanded",
                        timeIndex = "30",
                        token = tkn,
                        check.size=F)
  write.csv(
    Sco2$sensor_positions_00095,
    paste0("LatestData/soil.co2.sensorpos/",
           "sco2sensorpos.",terrsites[i],
           ".csv"), 
    row.names = FALSE)
  
}






#### Soil water content sensor position
dataIDswc= "DP1.00094.001"   ### Soil CO2 Concentration
tkn <- "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJhdWQiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnL2FwaS92MC8iLCJzdWIiOiJhc2hpZmhhc2FuLmFiaXJAdW5oLmVkdSIsInNjb3BlIjoicmF0ZTpwdWJsaWMiLCJpc3MiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnLyIsImV4cCI6MTgyMDIyNjQ2NSwiaWF0IjoxNjYyNTQ2NDY1LCJlbWFpbCI6ImFzaGlmaGFzYW4uYWJpckB1bmguZWR1In0.g7wvrb9QmJPG9tIUvnVHjLjIem-8NqFkZ4NEQXYG-SxlB5bUFWecc8PN3KsJ47bkQGt-JsFmhMDgPzK8JQFN4g"
for (i in 1:length(terrsites)) {
  siteID <- terrsites[i]
  swc <- loadByProduct(dpID=dataIDswc, 
                       site=terrsites[i],
                       startdate = "2022-01",
                       enddate = "2022-01",
                       package="basic",
                       timeIndex = "30",
                       token = tkn,
                       check.size=F)
  write.csv(
    swc$sensor_positions_00094,
    paste0("LatestData/soil.swc.sensorpos/",
           "swcsensorpos.",terrsites[i],
           ".csv"), 
    row.names = FALSE)
  
}


dd <- swc$SWS_30_minute






##### Precipitation
dataIDprecip= "DP1.00006.001"   ### Precipitation
tkn <- "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJhdWQiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnL2FwaS92MC8iLCJzdWIiOiJhc2hpZmhhc2FuLmFiaXJAdW5oLmVkdSIsInNjb3BlIjoicmF0ZTpwdWJsaWMiLCJpc3MiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnLyIsImV4cCI6MTgyMDIyNjQ2NSwiaWF0IjoxNjYyNTQ2NDY1LCJlbWFpbCI6ImFzaGlmaGFzYW4uYWJpckB1bmguZWR1In0.g7wvrb9QmJPG9tIUvnVHjLjIem-8NqFkZ4NEQXYG-SxlB5bUFWecc8PN3KsJ47bkQGt-JsFmhMDgPzK8JQFN4g"
for (i in 1:length(terrsites)) {
  siteID <- terrsites[i]
  precip <- loadByProduct(dpID=dataIDprecip, 
                          site=terrsites[i],
                          startdate = "2017-01",
                          enddate = "2022-12",
                          package="basic",
                          timeIndex = "30",
                          token = tkn,
                          check.size=F)
  write.csv(
    precip$PRIPRE_30min,
    paste0("LatestData/pri.precip/",
           "pri.precip.",terrsites[i],
           ".csv"), 
    row.names = FALSE)
  
  write.csv(
    precip$SECPRE_30min,
    paste0("LatestData/sec.precip/",
           "sec.precip.",terrsites[i],
           ".csv"), 
    row.names = FALSE)
  
  write.csv(
    precip$THRPRE_30min,
    paste0("LatestData/tf.precip/",
           "tf.precip.",terrsites[i],
           ".csv"), 
    row.names = FALSE)
  
}





#******* Groundwater Elevation [stream sites] ******
#******** Last Downloaded 06/07/2023 ************

aqsites.gwe = c(
  "ARIK", "BARC", "BIGC", "BLDE", "BLUE", 
  "BLWA", "COMO", "CRAM", "FLNT", "GUIL",   ### "CARI" doesnt have data
  "HOPB", "KING", "LEWI", "LIRO", "MART",
  "MAYF", "MCDI", "POSE", "PRIN", "PRLA",
  "PRPO", "REDB", "SUGG", "SYCA", "TOMB",
  "WALK", "WLOU"   )

aqsites <- str_sort(aqsites)

dataID = "DP1.20100.001"   
tkn <- "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJhdWQiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnL2FwaS92MC8iLCJzdWIiOiJhc2hpZmhhc2FuLmFiaXJAdW5oLmVkdSIsInNjb3BlIjoicmF0ZTpwdWJsaWMiLCJpc3MiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnLyIsImV4cCI6MTgyMDIyNjQ2NSwiaWF0IjoxNjYyNTQ2NDY1LCJlbWFpbCI6ImFzaGlmaGFzYW4uYWJpckB1bmguZWR1In0.g7wvrb9QmJPG9tIUvnVHjLjIem-8NqFkZ4NEQXYG-SxlB5bUFWecc8PN3KsJ47bkQGt-JsFmhMDgPzK8JQFN4g"
for (i in 1:length(aqsites.gwe)) {
  siteID <- aqsites.gwe[i]
  gwe <- loadByProduct(dpID=dataID, 
                       site=aqsites.gwe[i],
                       startdate = "2018-01",
                       enddate = "2022-12",
                       package="basic",
                       timeIndex = "30",
                       token = tkn,
                       check.size=F)
  write.csv(
    gwe$EOG_30_min,
    paste0("LatestData/gwe/",
           "gwe.",siteID,
           ".csv"), 
    row.names = FALSE)
  
}



###### Groundwater Elevation Info Files
aqsites = c(
  "ARIK", "BIGC", "BLDE", "BLUE", "BLWA",
  "COMO", "FLNT", "GUIL",   ### "CARI" doesnt have data
  "HOPB", "KING", "LEWI", "MART",
  "MAYF", "MCDI", "POSE",
  "PRIN", "REDB", "SYCA", "TOMB",
  "WALK", "WLOU"
)

aqsites <- str_sort(aqsites)

dataID = "DP1.20100.001"   
tkn <- "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiJ9.eyJhdWQiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnL2FwaS92MC8iLCJzdWIiOiJhc2hpZmhhc2FuLmFiaXJAdW5oLmVkdSIsInNjb3BlIjoicmF0ZTpwdWJsaWMiLCJpc3MiOiJodHRwczovL2RhdGEubmVvbnNjaWVuY2Uub3JnLyIsImV4cCI6MTgyMDIyNjQ2NSwiaWF0IjoxNjYyNTQ2NDY1LCJlbWFpbCI6ImFzaGlmaGFzYW4uYWJpckB1bmguZWR1In0.g7wvrb9QmJPG9tIUvnVHjLjIem-8NqFkZ4NEQXYG-SxlB5bUFWecc8PN3KsJ47bkQGt-JsFmhMDgPzK8JQFN4g"
for (i in 1:length(aqsites)) {
  siteID <- aqsites[i]
  gwe <- loadByProduct(dpID=dataID, 
                       site=aqsites[i],
                       startdate = "2017-01",
                       enddate = "2022-12",
                       package="basic",
                       timeIndex = "30",
                       token = tkn,
                       check.size=F)
  write.csv(
    gwe$sensor_positions,
    paste0("LatestData/gwe.info/",
           "gwe.sensorpos.",aqsites[i],
           ".csv"), 
    row.names = FALSE)
  
  write.csv(
    gwe$readme,
    paste0("LatestData/gwe.info/",
           "gwe.readme.",aqsites[i],
           ".csv"), 
    row.names = FALSE)
  
  write.csv(
    gwe$variables,
    paste0("LatestData/gwe.info/",
           "gwe.variables.",aqsites[i],
           ".csv"), 
    row.names = FALSE)
  
  
  
}
