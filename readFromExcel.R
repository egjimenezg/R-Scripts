# install.packages(XLConnect)
# sudo R CMD javareconf
require(XLConnect)

createCSVFiles <- function(path){
  files <- list.files(path=".", pattern="*.xlsx")

  for(file in files){
    workbook <- loadWorkbook(file)
    sheets = getSheets(workbook)
    for(sheet in sheets){
      data = readWorksheet(workbook,
                           sheet=sheet)

      write.csv(data,
                file=paste(tools::file_path_sans_ext(file),"-",sheet,".csv",sep=""),
                row.names=FALSE)
    }
  }
}

