# KEGGexpressionMapper v0.1, Last update: 22 June 2017
The KEGGexpressionMapper is bundled within a R package, allowing to visualize the expression of genes or abundances of proteins for any given species. The user need to provide a mapping to the expression (expression_mapping_file), a mapping to the KEGG orthologous (keg_to_gene_mapping_file), and a mapping of selected gene_candidate (gene_candidate_file). When a user has provided all these information, at first the KEGGexpressionMapper makes a lookup to find which pathways are associated with a KEGG ortholog, then for each pathway it visualizes the expression or protein abundancies by extracting the PNG visualisation and modifying them with the R-package PNG.
## How to run it and install it
It can be started by invoking the method “KEGGexpressionMapper(expression_mapping_file, kegg_to_gene_mapping_file, gene_candidate_file). The R package can be installed by extracting the github project. 

Copy the zip directory of KEGGexpressionMapper.zip, unzip and run the following command in R:
> setwd("..")
> install("KEGGexpressionMapper")

## Parameter explaination
### Expression_Mapping_file
Parameter: Expression_Mapping_file contains the genes in the first row, following by the expression of each conditions. The values per conditions are seperated by a “,”.
### Kegg_to_gene_mapping_file
Parameter: Kegg_to_gene_mapping_file contains the mapping of genes to the KEGG orthologous.
### Gene_candidate_file 
Parameter: gene_candidate_file contains the genes, that should be highlighted in the expression-informed visualisation.
## Example
We have chosen as example data from the endosymbiont of the bivalve Loripes orbiculatus where we previously have calculated KEGG orthologous - gene assignment with help of the KAAST server. 
All the three relevant files are stored in the example bin directory.

## Help line
Help:
For further requests and information, the following email can be used: thomas.nussbaumer@univie.ac.at .



