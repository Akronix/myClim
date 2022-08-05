# Install

While installing from GitLab it is necessary to manually install dependencies first. 
```R
requiered_packages <- c("stringr", "lubridate", "tibble", "dplyr", "purrr", "ggplot2", "ggforce", "viridis", "runner", "rmarkdown", "knitr", "kableExtra", "tidyr")
missing_packages <- requiered_packages[!(requiered_packages %in% installed.packages()[,"Package"])]
if(length(missing_packages)) install.packages(missing_packages)
```

Following script will download myClim installation files and install the myClim library.  
It is necessary to **set the directory where to unzip installation files**. Is important only for installation. After installation the files are not needed any more. During installation also vignettes will be built. Depending on your environment may need additional libraries to build vignettes. Read warnings carefully.  

```R
# directory to unzip source files
setwd("C:/path/to/directory") # !!!! EDIT HERE !!!!

# === Install package ===
install.packages("http://labgis.ibot.cas.cz/myclim/myClim_latest.tar.gz", repos=NULL, build_vignettes=TRUE)

# === Download source and examples ===
zip_file <- "myClim.zip"
dir_name <- "myClim"
download.file("https://git.sorbus.ibot.cas.cz/api/v4/projects/microclimate_r%2Fmicroclim/repository/archive.zip?ref=main&private_token=2fmZB-Qg-fbiVvzz2-Lh", destfile=zip_file, mode="wb")
subdir <- unzip(zip_file, list=TRUE)$Name[1]
unzip(zip_file)
file.remove(zip_file)
unlink(dir_name, recursive=TRUE)
file.rename(subdir, dir_name)
setwd(dir_name)
```
# Documentation & user manual
* [functions documentation](http://labgis.ibot.cas.cz/myclim/index.html)   
* [vignette: user manual](http://labgis.ibot.cas.cz/myclim/articles/myclim-demo.html)

