#############################
###DOWNLOAD TCGA-BRCA DATA###
#############################
### Load necessary packages
library("TCGAbiolinks")

# USE TCGAbiolinks package to download data from TCGA
# first identify what data to download
TCGAbiolinks:::getGDCprojects()$project_id
TCGAbiolinks:::getProjectSummary("TCGA-BRCA") # BREAST CANCER DATA ONLY

query <- GDCquery(project = "TCGA-BRCA", data.category = "Transcriptome Profiling", data.type = "Gene Expression Quantification", workflow.type = "HTSeq - FPKM-UQ", legacy = FALSE) # last version of gene exp data (FPKM-UQ)

# Download data, will take few minutes. It will be saved to your working directory
setwd("C:/Users/.../Desktop/Eoghan") # change working directory to whatever u want (better create a new one)
GDCdownload(query)

# prepare data and save it (so next time you dont need to donwload again, just load it). Will take a while (even more than download)
# more RAM, faster
data <- GDCprepare(query, save = TRUE, save.filename = "probando_Eoghan.rda", summarizedExperiment = TRUE)
