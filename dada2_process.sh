#!/usr/bin/env bash

## Microbiome Data Processing Pipeline - Dada2 ##

microbiome_dada2_analysis_main(){
    qiime2_dada2 # set threshold
    qiime2_classification
    qiime2_barplot
}

microbiome_dada2_analysis_main