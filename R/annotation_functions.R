#' Misc. annotation files for converting gene names and numbers
#'
#' @description
#' A small set of functions to convert between gene names in Pseudomonas,
#' Particularly PAO1 numbers and PA14 number interconversion, but also compatible with other species/strains curated in pseudomonas.com
#'
#'

#New data files from www.pseudomonas.com, pgd db version 22, downloaded 2024-04-15

PA14_old_v_new <- read.csv("./data/PA14_old-v-new_loci.csv", stringsAsFactors = FALSE)

PAO1_orth <- read.csv('./data/Pseudomonas_aeruginosa_PAO1_107_orthologs.csv', stringsAsFactors = FALSE)

PA14_orth <- read.csv('./data/Pseudomonas_aeruginosa_UCBPP-PA14_109_orthologs.csv', stringsAsFactors = FALSE)

PA14_ann <- read.csv('./data/Pseudomonas_aeruginosa_UCBPP-PA14_109.csv', stringsAsFactors = FALSE)

PAO1_ann <- read.csv('./data/Pseudomonas_aeruginosa_PAO1_107.csv', stringsAsFactors = FALSE)


# functions

#' Convert from 3 or 4 letter P. aeruginosa gene name to PAO1 number syntax
#'
#' @param x A 3 or 4 letter gene name
#' @return The corresponding PAO1 number
#' @examples
#' name_to_PAO1('dnaA')
#' @export
name_to_PAO1 <- function(x){
  if(x==''){
    return(x)
  }
  out_num <- PAO1_ann$Locus.Tag[PAO1_ann$Gene.Name == x]
  if(identical(out_num, character(0))){
    return(x)
  }
  return(substring(out_num[1],1,6))
}


#' Convert from P. aeruginosa gene PAO1 number to 3 or 4 letter gene name
#'
#' @param x A  PAO1 number
#' @return The corresponding 3 or 4 letter gene name
#' @examples
#' PAO1_to_name('PA0001')
#' @export
PAO1_to_name <- function(x){
  if(x==''){
    return(x)
  }
  out_num <- PAO1_ann$Gene.Name[substring(PAO1_ann$Locus.Tag,1,6) == x]
  if(identical(out_num, character(0))){
    return(x)
  }
  if(out_num[1] == ''){
    return(x)
  }
  return(out_num[1])
}

#' Convert from 3 or 4 letter P. aeruginosa gene name to PA14 number syntax
#'
#' @param x A 3 or 4 letter gene name
#' @return The corresponding PA14 number
#' @examples
#' name_to_PA14('dnaA')
#' @export
name_to_PA14 <- function(x){
  if(x==''){
    return(x)
  }
  out_num <- PA14_ann$Locus.Tag[PA14_ann$Gene.Name == x]
  if(identical(out_num, character(0))){
    return(x)
  }
  return(substring(out_num[1],1,10))
}

#' Convert from P. aeruginosa gene PA14 number to 3 or 4 letter gene name
#'
#' @param x A PA14 number
#' @return The corresponding 3 or 4 letter gene name
#' @examples
#' PA14_to_name('PA14_00001')
#' PAO1_to_name(PA14_to_PAO1(PA14_to_name('PA14_0001')))
#' @export
PA14_to_name <- function(x){
  if(x==''){
    return(x)
  }
  out_num <- PA14_ann$Gene.Name[substring(PA14_ann$Locus.Tag,1,10) == x]
  if(identical(out_num, character(0))){
    return(x)
  }
  if(out_num == ''){
    return(x)
  }
  return(out_num)
}

#' Convert from P. aeruginosa gene PA14 number to PAO1 number
#'
#' @param x A PA14 number
#' @return The homologous PAO1 number
#' @examples
#' PA14_to_PAO1('PA14_00001')
#' @export
PA14_to_PAO1 <- function(x){
  if(x==''){
    return(x)
  }
  out_num <- PA14_orth$Locus.Tag.Hit.[PA14_orth$Locus.Tag.Query. == x & PA14_orth$Strain.Hit. == "Pseudomonas aeruginosa PAO1 (Stover et al., 2000)"]
  if(identical(out_num, character(0))){
    return(x)
  }
  return(out_num[1])
}

#' Convert from P. aeruginosa gene PAO1 number to PA14 number
#'
#' @param x A PAO1 number
#' @return The homologous PA14 number
#' @examples
#' PAO1_to_PA14('PA0001')
#' @export
PAO1_to_PA14 <- function(x){
  if(x==''){
    return(x)
  }
  out_num <- PAO1_orth$Locus.Tag.Hit.[PAO1_orth$Locus.Tag.Query. == x & PAO1_orth$Strain.Hit. == "Pseudomonas aeruginosa UCBPP-PA14 (Lee et al., 2006)"]
  if(identical(out_num, character(0))){
    return(x)
  }
  return(out_num[1])
}

#' Convert from P. aeruginosa gene PA14 number to Refseq UCBPP-PA14 genome gene number
#'
#' @param x A PA14 number
#' @return The homologous PA14 number in current (2024-04) RefSeq UCBPP-PA14 genome
#' @examples
#' PA14_to_PA14new('PA14_00001')
#' @export
PA14_to_PA14new <- function(x){
  if(x==''){
    return(x)
  }
  new_value <- PA14_old_v_new$locus_tag[ match(x, PA14_old_v_new$old_locus_tag)]
  return(new_value[1])
}

#' Convert from P. aeruginosa Refseq UCBPP-PA14 genome gene number to older PA14 gene number nomenclature
#'
#' @param x A PA14_RS number in the current (2024-04) Refseq UCBPP-PA14 genome
#' @return The homologous PA14 number in older PA14 format (used in all other functions in this package)
#' @examples
#' PA14new_to_PA14('PA14_RS00001')
#' @export
PA14new_to_PA14 <- function(x){
  if(x==''){
    return(x)
  }
  new_value <- PA14_old_v_new$old_locus_tag[ match(x, PA14_old_v_new$locus_tag)]
  return(new_value[1])
}



#' Convert from Pseudomonas strain gene number (any supported strain) to PAO1 number
#'
#' @param x A Pseudomonas strain's gene number
#' @param y A Pseudomonas strain name, among supported strains
#' @return The homologous PAO1 number
#' @examples
#' Strain_to_PAO1('PFL_0001', 'Pseudomonas protegens Pf-5')
#' @export
strain_to_PAO1 <- function(x,y){
  if(x==''){
    return(x)
  }
  out_num <- PAO1_orth$Locus.Tag.Query.[PAO1_orth$Locus.Tag.Hit. == x & PAO1_orth$Strain.Hit. == y]
  if(identical(out_num, character(0))){
    return(x)
  }
  return(out_num[1])
}

#' Convert from Pseudomonas strain gene number (any supported strain) to PA14 number
#'
#' @param x A Pseudomonas strain's gene number
#' @param y A Pseudomonas strain name, among supported strains
#' @return The homologous PA14 number
#' @examples
#' Strain_to_PA14('PFLU0001', 'Pseudomonas fluorescens SBW25')
#' @export
strain_to_PA14 <- function(x,y){
  if(x==''){
    return(x)
  }
  out_num <- PA14_orth$Locus.Tag.Query.[PA14_orth$Locus.Tag.Hit. == x & PA14_orth$Strain.Hit. == y]
  if(identical(out_num, character(0))){
    return(x)
  }
  return(out_num[1])
}
