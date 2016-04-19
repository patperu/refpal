split_names <- function(m) {
  stazione <- zz$stazione[which(str_detect(m, zz$stazione))]
  inq      <- zz$inq[which(str_detect(m, zz$inq))]
  tdm      <- zz$tdm[which(str_detect(m, zz$tdm))]
  out <- paste(stazione, inq, tdm, sep = "__")
  out
}


zz <- read.table(header = TRUE, sep = ";", text = "
stazione;inq;tdm
partinico;SO2;Max_orario
sasol;CO;Media_24_h
enna;NO2;Max_media_8h
ex_autoparco;O3;NA
trapani;Benzene;NA
termini;PM10;NA
cda_gabbia;PM2.5;NA
termica_milazzo;NA;NA
boccetta;NA;NA
misterbianco;NA;NA
megara;NA;NA
lab_mobile1;NA;NA
porto_empedocle;NA;NA
villa_augusta;NA;NA
parcheggio_agip;NA;NA
")
