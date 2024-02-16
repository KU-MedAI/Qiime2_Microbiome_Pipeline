#!/usr/bin/env bash

set -euo pipefail

NAME=Results
RAWDATA='/home/songhyeon/Research/Atopic/Qiime2_Microbiome_Pipeline/rawdata'

microbiome_analysis_data_main(){
   create_dir
   set_path
   import_data
   qiime2_cutadapt
}

create_dir(){

    mkdir -p ${NAME}

}

set_path(){

   export RESULT_DIR=$(pwd)/${NAME}
   export INFORMATION_DIR=$(pwd)/info
   export RAWDATA_DIR=${RAWDATA}
}

import_data(){

   . ./scripts/01_import_data.sh

   cd -

}


qiime2_cutadapt(){

   . ./scripts/01_qiime2_cutadapt.sh

   cd - 

}


microbiome_analysis_data_main