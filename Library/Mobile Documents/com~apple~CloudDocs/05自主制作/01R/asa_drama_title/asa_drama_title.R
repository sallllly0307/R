install.packages("RMeCab", repos = "https://rmecab.jp/R", type = "source") 
library(RMeCab)
res <-RMeCabC("すもももももももものうち")
unlist(res)

install.packages("rvest")
library("rvest")
jobs <-read_html("https://www.nhk.or.jp/archives/asadora/chronology/broadcast.html")

install.packages("dplyr")
library(dplyr)
titles <-jobs %>% html_nodes("div[class='wrap']") %>% html_text()

install.packages("magrittr")
library(magrittr)
titles %>% extract(1)

library(RMeCab)
titles  %>% extract2(1) %>% RMeCabC() %>% unlist()

title <-jobs %>% html_nodes("h4[class='dramaTitle']") %>% html_text()
library(magrittr)
title %>% extract(1)

library(RMeCab)
title  %>% extract2(1) %>% RMeCabC() %>% unlist()

print(title,type="txt") #タイトルを一覧で確認する
write.csv(title, "C:title.csv") #タイトル一覧をcsv形式でダウンロードする

tit <- docDF("~/Library/Mobile Documents/com~apple~CloudDocs/05自主制作/01R/asa_drama_title/C:title.csv",type=1,pos=c("名詞","形容詞","動詞"))
write.csv(tit, "C:tit.csv")

tit %>% filter(POS1 == "動詞") %>% head(10)
tit %>% filter(POS1 == "形容詞") %>% head(10)
tit %>% filter(POS1 == "名詞",POS2 %in% c("一般")) %>% head(10)