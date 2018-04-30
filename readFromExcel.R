# install.packages(XLConnect)
# sudo R CMD javareconf
options(java.parameters = "-Xmx1024m")

require(XLConnect)


createCSVFiles <- function(filesPath){
  files <- list.files(path=filesPath, pattern="*.xlsx")

  for(file in files){
    workbook <- loadWorkbook(paste(c(filesPath,file),collapse="/"))
    sheets = getSheets(workbook)
    for(sheet in sheets){
      data = readWorksheet(workbook,
                           sheet=sheet)

      write.csv(data,
                file=paste(filesPath,"/",tools::file_path_sans_ext(file),"-",sheet,".csv",sep=""),
                row.names=FALSE)
      rm(data)
    }
  }
}
