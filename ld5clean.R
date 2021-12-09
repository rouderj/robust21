library('tidyverse')

ld5MakeClean=function(){
  link<-"https://raw.githubusercontent.com/PerceptionCognitionLab/data0/master/lexDec-dist5/ld5.all"
  dat<-read_table(url(link),col_names=FALSE)
  colnames(dat) <- c("sub","block","trial","stim","resp","rt","err")
  dat$rt<-as.numeric(dat$rt)
  dat$block<-as.numeric(dat$block)
  dat$trial<-as.numeric(dat$trial)
  dat$sub<-as.numeric(dat$sub)
  dig<-c(2,3,4,6,7,8)
  dat$digit<-dig[dat$stim+1]
  dat$totTrial <- dat$block*60+dat$trial+1
  clean <- dat %>% filter(!sub==34) %>% 
    filter(!sub==43) %>%
    filter(err==0) %>% 
    filter (rt>200) %>%
    filter (rt<2000) %>%
    filter (totTrial>20) %>%
    filter (trial!=0) %>%
    mutate (rt=rt/1000)
  return(clean)}