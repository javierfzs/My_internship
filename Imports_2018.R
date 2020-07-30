
tarciiu<- read_csv("~/Google Drive/Internship_WB_Summer/Edit/Github/Data_Expo/Tariffs_CIIU4.csv")
colnames(tarciiu)[1] <- "NABAN"



enero <- read_dta("~/Google Drive/Internship_WB_Summer/Edit/Github/Data_Impo/Impo_2018/Enero/Enero2.dta")
febrero <- read_dta("~/Google Drive/Internship_WB_Summer/Edit/Github/Data_Impo/Impo_2018/Febrero/Febrero2.dta")
marzo <- read_dta("~/Google Drive/Internship_WB_Summer/Edit/Github/Data_Impo/Impo_2018/Marzo/Marzo2.dta")
abril <- read_dta("~/Google Drive/Internship_WB_Summer/Edit/Github/Data_Impo/Impo_2018/Abril/Abril2.dta")
mayo <- read_dta("~/Google Drive/Internship_WB_Summer/Edit/Github/Data_Impo/Impo_2018/Mayo/Mayo2.dta")
junio <- read_dta("~/Google Drive/Internship_WB_Summer/Edit/Github/Data_Impo/Impo_2018/Junio/Junio2.dta")
julio <- read_dta("~/Google Drive/Internship_WB_Summer/Edit/Github/Data_Impo/Impo_2018/Julio/Julio2.dta")
agosto <- read_dta("~/Google Drive/Internship_WB_Summer/Edit/Github/Data_Impo/Impo_2018/Agosto/Agosto2.dta")
septiembre <- read_dta("~/Google Drive/Internship_WB_Summer/Edit/Github/Data_Impo/Impo_2018/Septiembre/Septiembre2.dta")
octubre <- read_dta("~/Google Drive/Internship_WB_Summer/Edit/Github/Data_Impo/Impo_2018/Octubre/Octubre2.dta")
noviembre <- read_dta("~/Google Drive/Internship_WB_Summer/Edit/Github/Data_Impo/Impo_2018/Noviembre/Noviembre2.dta")
diciembre <- read_dta("~/Google Drive/Internship_WB_Summer/Edit/Github/Data_Impo/Impo_2018/Diciembre/Diciembre2.dta")

impo2018<-rbind(enero,febrero,marzo,abril,mayo,junio,julio,agosto,septiembre,octubre,noviembre,diciembre)

impo2018<-merge(impo2018,tarciiu[ , c("NABAN","CIIU4")],by="NABAN",all.x =TRUE)
impo_china<-impo2018[(impo2018$PAISGEN=="215"),]

impo_china_ciiu4<-aggregate(list(impo_china$VACID), by=list(impo_china$CIIU4),FUN=sum,na.rm=TRUE) 
colnames(impo_china_ciiu4)[1] <- "CIIU4"
colnames(impo_china_ciiu4)[2] <- "VACID"

impo_2018_ciiu4<-aggregate(list(impo2018$VACID), by=list(impo2018$CIIU4),FUN=sum,na.rm=TRUE) 
colnames(impo_2018_ciiu4)[1] <- "CIIU4"
colnames(impo_2018_ciiu4)[2] <- "VACID"

impo_china_ciiu4<-merge(impo_china_ciiu4,impo_2018_ciiu4,by="CIIU4",all.x =TRUE)
colnames(impo_china_ciiu4)[2] <- "VACID_CHINA"
colnames(impo_china_ciiu4)[3] <- "VACID"

impo_china_ciiu4$chshare<-impo_china_ciiu4$VACID_CHINA/impo_china_ciiu4$VACID
summary(impo_china_ciiu4$chshare)
sum(impo_china_ciiu4$VACID_CHINA)
sum(impo_china_ciiu4$VACID)

write_dta(impo_china_ciiu4,"~/Google Drive/Internship_WB_Summer/Edit/Github/Data_Impo/Impo_2018/impo_china_ciiu4.dta")
