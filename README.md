## PAannotation

An R package developed for quick conversion between orthologs of Pseudomonas aeruginosa strains.

Installation will require devtools. In R:

install.packages("devtools")

library(devtools)

install_github("hoganlab-dartmouth/name-drop-pa")

library(PAannotation)





Originally developed:


##Name-Drop-Pa

# Georgia Doing 2020

These scripts are meant to help convert PAO1 and PA14 gene names to gene numbers (PAXXXX or PA14_XXXXX) and back, within and between strains.


Functions reply on annotations downloaded from www.pseudomonas.com :

Pseudomonas_aeruginosa_PAO1_107_orthologs.csv 		09-18-18

Pseudomonas_aeruginosa_PAO1_107.csv 				09-17-18

Pseudomonas_aeruginosa_UCBPP-PA14_109 				01-07-19

Pseudomonas_aeruginosa_UCBPP-PA14_109_orthologs 	07-09-18



Udpdated to:


##PAannotation

# Jay Goddard 2024

Updated scripts to utilize most recent version of annotations available from pseudomonas.com (update from Db 17 to Db 22)

New functions added for PA14 naming convention changes, and to enable conversion of gene IDs from strains other Pseudomonas aeruginosa PAO1 and Pseudomonas aeruginosa PA14


Currently supported Pseudomonas strains are:

Pseudomonas aeruginosa PAO1 (Stover et al., 2000)

Pseudomonas aeruginosa UCBPP-PA14 (Lee et al., 2006)

Pseudomonas aeruginosa LESB58 

Pseudomonas aeruginosa PA7

Pseudomonas fluorescens SBW25

Pseudomonas protegens Pf-5

Pseudomonas putida KT2440 (TIGR)

Pseudomonas savastanoi pv. phaseolicola 1448A

Pseudomonas stutzeri A1501

Pseudomonas syringae pv. tomato DC3000 (Buell et al., 2003)

