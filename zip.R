# 压缩所有的文件夹
library(tidyverse)
library(fs)
for(i in dir_ls('code-data')){
  j = str_remove(i, "code-data/")
  if(!file_exists(paste0("code-data-zip/", j, ".zip"))){
    zip(paste0("code-data-zip/", j, ".zip"), i) 
  }
}

dir_ls('code-data-zip') %>% 
  as.character() %>% 
  str_remove("code-data-zip/") %>% 
  str_remove(".zip") %>% 
  as_tibble() %>% 
  mutate(下载链接 = paste0("https://r-stata.github.io/stata-highmaps/code-data-zip/", value, ".zip")) %>% 
  mutate(下载链接 = paste0("<a href='", basename(下载链接), "'>", value, "</a>")) %>% 
  knitr::kable()
