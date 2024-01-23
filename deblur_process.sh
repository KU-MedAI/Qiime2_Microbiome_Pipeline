#!/usr/bin/env bash

## Microbiome Data Processing Pipeline - Deblur ##

microbiome_deblur_analysis_main(){
    qiime2_deblur
    qiime2_classification
    qiime2_barplot
}

microbiome_deblur_analysis_main