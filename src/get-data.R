# if doesnt exist create data folder
if (!file.exists("data")) {
  dir.create("data")
}

destfolder <- "./data/"
data_file <- "EPH_usu_2do_Trim_2022_txt.zip"

url <- paste0("https://www.indec.gob.ar/ftp/cuadros/menusuperior/eph/", data_file)
destfile <- paste0(destfolder, data_file)
download.file(url, destfile)

zipfile <- destfile # lets you choose a file and save its file path in R (at least for windows)
unzip(zipfile,exdir=destfolder)

unzipfiledir <- paste0(substr(zipfile, 1, unlist(gregexpr('.zip', destfile))[1] - 1), "/")
indfile <- list.files(unzipfiledir, pattern = "*ind*",  full.names = TRUE)
hogfile <- list.files(unzipfiledir, pattern = "*hog*",  full.names = TRUE)

