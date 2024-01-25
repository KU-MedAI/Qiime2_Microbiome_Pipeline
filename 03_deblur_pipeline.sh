#!/usr/bin/env bash

set -euo pipefail

NAME=Results

microbiome_analysis_deblur_main(){
    set_path
    qiime2_deblur
    qiime2_classification "deblur"
    qiime2_barplot "deblur"
}

set_path(){

   export RESULT_DIR=$(pwd)/${NAME}
   export INFORMATION_DIR=$(pwd)/info
   
}

qiime2_deblur(){

    . ./scripts/qiime2_deblur.sh

    cd -

}

qiime2_classification(){
    TARGET_DIR=$1
    export TARGET_DIR
    . ./scripts/qiime2_classification.sh
    
    cd -

}

qiime2_barplot(){
    TARGET_DIR=$1
    export TARGET_DIR
   . ./scripts/qiime2_barplot.sh

   cd -

}


microbiome_analysis_deblur_main