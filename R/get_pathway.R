get_pathway=function(id){
        options(stringsAsFactors=FALSE)

        thepage = readLines(paste('http://www.kegg.jp/pathway/',id,sep=""),warn=FALSE)
        ix=grep("<area",thepage)
        thepage=thepage[ix]
        df=data.frame()
        for(x in 1:length(thepage)){
                ids=strsplit(strsplit(strsplit(thepage[x],"www_bget\\?")[[1]][2],"\"\\ttitle")[[1]][1],"\\+")
                coords=strsplit(strsplit(strsplit(thepage[x],"shape=rect\tcoords=")[[1]][2],"\thref")[[1]][1],",")[[1]]
                for(y in 1:length(ids)){
                        c_e=ids[y][[1]]
                        for(z in 1:length(c_e)){
                                if(!is.na(c_e[z])){
                                        if(length(grep("map",c_e[z]))==0){
                                                arr=coords
                                                arr=c(arr,c_e[z])
                                                if(length(arr)==5){
                                                        df=rbind(df,t(arr))
                                                }
                                        }
                                }
                        }
                }
        }
        return(df)

}
