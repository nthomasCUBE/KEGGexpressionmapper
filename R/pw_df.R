pw_df=function(){
        data=read.csv("content.txt",sep=" ",header=T)
        my_map=c()
        my_pval=c()

        for(x in 1:dim(data)[1]){
                r1=data[x,3]
                r2=data[x,4]
                r1_s=sum(data[,3])
                r2_s=sum(data[,4])

                A=r2
                B=r1-r2
                C=r2_s-r2
                D=r1_s-A-B-C

                M=matrix(c(A,C,B,D),nrow=2)
                pval=fisher.test(M,alternative="greater")$p.value

                my_map=c(my_map,data[x,1])
                my_pval=c(my_pval,pval)

        }
        my_pval=p.adjust(my_pval,method="BH")
        for(x in 1:length(my_pval)){
                if(my_pval[x]<=0.05){
                        print(my_map[x])
                }
        }

}
