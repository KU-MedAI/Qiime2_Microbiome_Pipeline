#!/usr/bin/env bash

set -euo pipefail

NAME=Results

microbiome_analysis_dada2_main(){
    set_path
    qiime2_dada2
    qiime2_classification "dada2"
    qiime2_barplot "dada2"
}

set_path(){

   export RESULT_DIR=$(pwd)/${NAME}
   export INFORMATION_DIR=$(pwd)/info

}

qiime2_dada2(){

    . ./scripts/02_qiime2_dada2.sh

    cd -

}

qiime2_classification(){
    TARGET_DIR=$1
    export TARGET_DIR
    . ./scripts/023_qiime2_classification.sh
    
    cd -

}

qiime2_barplot(){
    TARGET_DIR=$1
    export TARGET_DIR
   . ./scripts/023_qiime2_barplot.sh

   cd -

}


microbiome_analysis_dada2_main