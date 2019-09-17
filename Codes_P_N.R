library(DESeq2)
mir_data<-read.table("All_Combined_Primed_Normal.txt",sep="\t",header=TRUE)
countData2<-mir_data[,c(2:5)]
colData2<-read.table("Coldata_P_N.txt",header=TRUE)
colData2$Treatment<-as.factor(colData2$Treatment)
colData2$Batch<-as.factor(colData2$Batch)
ddsFull<-DESeqDataSetFromMatrix(countData=countData2,colData=colData2,design=~Batch+Treatment)
dds<-DESeq(ddsFull)
res<-results(dds)
res2<-cbind(mir_data[,1],res)
write.table(res2,file="Res_Primed_vs_Normal.txt",sep="\t")

