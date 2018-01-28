get_cand=function(gene_desc, gene_kegg){
                cand=read.csv(gene_desc,sep=" ",header=T)
                allowed_genes=c()
                for(x in 1:dim(cand)[1]){
                        cur_id=cand[x,1]
                        allowed_genes=c(allowed_genes,cur_id)
                }

                gois=read.csv(gene_kegg,sep="\t",header=T)
                arr=c()
                for(x in 1:dim(gois)[1]){
                        c_id=gois[x,1]
                        if(c_id %in% allowed_genes){
                                arr=c(arr,gois[x,2])
                        }
                }
                return(arr)
}

