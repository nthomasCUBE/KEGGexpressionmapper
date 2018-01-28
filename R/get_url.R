get_url=function(gois){
                kegg_u=unique(gois[,2])
                url=""
                system("rm maps.txt; touch maps.txt")
                y=0
                for(x in 1:length(kegg_u)){
                        if(!is.na(kegg_u[x])){
                                if(nchar(url)>0){
                                        url=paste(url,"+","ko:",kegg_u[x],sep="")
                                }else{
                                        url=paste(url,"ko:",kegg_u[x],sep="")
                                }
                        }
                        if(y>10){
                                url=paste("http://www.genome.jp/dbget-bin/get_linkdb?-t+pathway+",url,sep="")
                                system(paste("wget ",url,sep=""))
                                system(paste("less get_linkdb* | grep -Po '(map.*)\"' | sed 's/\"//g' | sort | uniq >> maps.txt"))
                                y=0
                                url=""
                        }
                        y=y+1

                }
                url=paste("http://www.genome.jp/dbget-bin/get_linkdb?-t+pathway+",url,sep="")
                system(paste("wget ",url,sep=""))
                system(paste("less get_linkdb* | grep -Po '(map.*)\"' | sed 's/\"//g' | sort | uniq >> maps.txt"))
                system("rm get_linkdb*")
                system("tmp=$(mktemp); less maps.txt | sed 's/+/ /g' | cut -f 1 -d ' ' | sort | uniq > $tmp; mv $tmp maps.txt")

}


