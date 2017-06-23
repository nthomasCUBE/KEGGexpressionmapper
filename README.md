# KEGGexpressionMapper v0.1, Last update: 22 June 2017
The KEGGexpressionMapper is bundled within a R package, allowing to visualize the expression of genes or abundances of proteins for any given species. The user need to provide a mapping to the expression (expression_mapping_file), a mapping to the KEGG orthologous (keg_to_gene_mapping_file), and a mapping of selected gene_candidate (gene_candidate_file). When a user has provided all these information, at first the KEGGexpressionMapper makes a lookup to find which pathways are associated with a KEGG ortholog, then for each pathway it visualizes the expression or protein abundancies by extracting the PNG visualisation and modifying them with the R-package PNG.
## How to run it and install it

Please copy the R package from: https://github.com/nthomasCUBE/KEGGexpressionmapper/files/1096508/KEGGexpressionMapper_v0.1.tar.gz 
or (Release option). Then, the R package can be easily installed with install.packages("KEGGexpressionMapper_v0.1.tar.gz")
which then allows to load the library (library("KEGGExpressionMapper")
and running the tool with
KEGGexpressionMapper(expression_mapping_file, kegg_to_gene_mapping_file, gene_candidate_file)

## Parameter explaination
### Expression_Mapping_file
Parameter: Expression_Mapping_file contains the genes in the first row, following by the expression of each conditions. The values per conditions are seperated by a “,”.

The file should have the following structure:
Gene1 1,3,5,10
Gene2 20,5,3,5
where gene1 and gene2 represent the gene identifier and 1 the expression in the first condition, 3 the expression in the second condition, 5 the expression in the third condition and 10 the expresion in the fourth condition.

### Kegg_to_gene_mapping_file
Parameter: Kegg_to_gene_mapping_file contains the mapping of genes to the KEGG orthologous.

The file should have the following structure:
Gene1 KO111
Gene2 KO22

where Gene has the KEGG orthologous gene assingment KO111 and Gene2 the KEGG orthologous gene KO22.

### Gene_candidate_file 
Parameter: gene_candidate_file contains the genes, that should be highlighted in the expression-informed visualisation.

The file should have the following structure
Gene1
Gene11
Gene55
Gene1, Gene11 and Gene55 are then highlighted in the expression-informed KEGG pathway visualisations.

## Example
We have chosen as example data from the endosymbiont of the bivalve Loripes orbiculatus where we previously have calculated KEGG orthologous - gene assignment with help of the KAAST server. 
All the three relevant files are stored in the example bin directory.

## Help line
Help:
For further requests and information, the following email can be used: thomas.nussbaumer@univie.ac.at .



