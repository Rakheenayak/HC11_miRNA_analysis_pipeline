library(DESeq2)
mir_data<-read.table("All_Combined_Prolactin_Primed.txt",sep="\t",header=TRUE)
countData3<-mir_data[,c(2:5)]
colData3<-read.table("Coldata_Prl_P.txt",header=TRUE)
colData3$Treatment<-as.factor(colData3$Treatment)
colData3$Batch<-as.factor(colData3$Batch)
ddsFull<-DESeqDataSetFromMatrix(countData=countData3,colData=colData3,design=~Batch+Treatment)
dds<-DESeq(ddsFull)
res<-results(dds)
res3<-cbind(mir_data[,1],res)
write.table(res3,file="Res_Prolactin_vs_Primed.txt",sep="\t")

