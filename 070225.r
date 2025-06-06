#Download the file on https://www.dfxmodels.com/resources/070225.csv and do 'obs = read.csv(file)' 
##### Occupation #####
head(obs)
east <- obs$Dir == "E"
west <- obs$Dir == "W"
occup <- obs$Occupation != "-" #Each piece of data is originally a character
obsoccupy <- obs[]
occupeast <- as.numeric(obs[east&occup, ]$Occupation)
occupwest <- as.numeric(obs[west&occup, ]$Occupation)
mean(occupeast)
mean(occupwest)
urban <- c("63", "90", "145") # Urban lines
suburban <- c("312", "312A", "313", "326", "331", "332", "333", "334", "336", "337", "339", "341", "351", "352", "353") # Suburban lines
obsurban <- obs[obs$Line %in% urban, ]  # Filter files
obssuburban <- obs[obs$Line %in% suburban, ]
eu <- obsurban$Dir == "E"
wu <- obsurban$Dir == "W"
es <- obssuburban$Dir == "E"
ws <- obssuburban$Dir == "W"
ou <- obsurban$Occupation != "-"
os <- obssuburban$Occupation != "-"
occupeasturban <- as.numeric(obsurban[eu&ou, ]$Occupation)
occupwesturban <- as.numeric(obsurban[wu&ou, ]$Occupation)
occupeastsuburban <- as.numeric(obssuburban[es&os, ]$Occupation)
occupwestsuburban <- as.numeric(obssuburban[ws&os, ]$Occupation)
mean(occupeasturban)
mean(occupwesturban)
mean(occupeastsuburban)
mean(occupwestsuburban)
obsoccup <- obs[occup, ]
obsoccup$Occupation <- as.numeric(obsoccup$Occupation)

#####Frequencies#####
library(dplyr)
library(lubridate)
obsservice <- obs[obs$TypeS == "N",] #Frequences for services operating with passengers normally
obsservice$Time <- hms(obsservice$Time)
