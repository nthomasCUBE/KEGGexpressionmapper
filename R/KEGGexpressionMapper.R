#' KEGGexpressionMapper
#'
#' This function allows compare expression of genes or protein abundancies to KEGG pathways
#' @param gene_desc gene description
#' @param gene_kegg kegg to gene mapping
#' @param gene_expr expression mapping to gene
#' @keywords keggexpressionmapper
#' @export
#' @examples
#' cat_function()

KEGGexpressionMapper=function(gene_desc="example/DEG.txt", gene_kegg="example/KEGG.txt", gene_expr="example/EXPRESSION.txt"){

        library(png)
        options(stringsAsFactors=FALSE)

        cand=get_cand(gene_desc, gene_kegg)
        gois=read.csv(gene_kegg,sep="\t",header=T)
        get_url(gois)

        maps=read.csv("maps.txt",sep="\t",header=F); maps=maps[,1]
        data=read.csv(gene_expr,sep="\t",header=T); expr=data[,1:dim(data)[2]]

        expr=read.csv(gene_expr,header=T,sep=" ",row.names=1)

        arr=c()
        system("rm map*png")
        pw_df=NA
        for(x in 1:length(maps)){
                id=maps[x]
                df=get_pathway(id)
                c_e=modifyPlot(id,df,gois,expr,cand)
                new_entry=t(c_e)
                names(new_entry)=c("A","B","C","D")
                if(is.null(dim(pw_df))){
                        pw_df=data.frame(new_entry)
                        colnames(pw_df)=c("A","B","C","D")
                }else{
                        colnames(new_entry)=c("A","B","C","D")
                        pw_df=rbind(pw_df,new_entry)
                }
        }
        write.table(pw_df,"content.txt")
}

