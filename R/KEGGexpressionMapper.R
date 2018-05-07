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

KEGGexpressionMapper=function(gene_desc="Use_case2/DEG.tab", gene_kegg="Use_case2/KEGG.tab", gene_expr="Use_case2/EXPRESSION.tab"){

        library(png)
        options(stringsAsFactors=FALSE)

        # ------------------------------------------------------------------------------
        cand=get_cand(gene_desc, gene_kegg)
        print(paste("We are integrating",length(cand),"KEGG orthologs"))

        # ------------------------------------------------------------------------------

        gois=read.csv(gene_kegg,sep="\t",header=T)
        print(paste("We are integrating",dim(gois)[1],"KEGG-gene assignments"))

        # ------------------------------------------------------------------------------

        get_url(gois)

        # ------------------------------------------------------------------------------

        maps=read.csv("maps.txt",sep="\t",header=F); maps=maps[,1]
        print(paste("We are analysing",length(maps),"KEGG pathways"))

        # ------------------------------------------------------------------------------

        data=read.csv(gene_expr,sep="\t",header=T);
        print(paste("We are analysing",dim(data)[1],"genes with expression"))

        # ------------------------------------------------------------------------------

        expr=data[,1:dim(data)[2]]

        # ------------------------------------------------------------------------------

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
                #exit
        }

        # ------------------------------------------------------------------------------

        write.table(pw_df,"content.txt")

        # ------------------------------------------------------------------------------
}
