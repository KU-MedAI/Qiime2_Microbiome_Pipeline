#!/usr/bin/env bash

## Microbiome Data Processing Pipeline - Data Summary ##

NAME = 'Results'
RAWDATA = 'absolute_path_of_raw_data' # example: /home/jovyan/rawdata

microbiome_analysis_data_main(){
    create_dir
    set_path
    import_data
    qiime2_cutadapt
}

# 1. Creating folders for analysis
create_dir(){    
    for directory in info
    do
        mkdir -p ${NAME}
        mkdir -p ${directory}
    done
}

# 2. Setting path for analysis
set_path(){
    export RESULT_DIR = ${NAME}
    export INFORMATION_DIR = $(pwd)/info
    export RAWDATA_DIR = $(pwd)/rawdata

    ln -s -fs ${RAWDATA}/*.fastq.gz ${RAWDATA_DIR}
}

# 3. Import data (.qza)
import_data(){

    . ./scripts/import_data.sh

    echo "DONE import_data"
    cd -

}

# 4. Cut adapter - cutadapt plugin
qiime2_cutadapt(){

    . ./scripts/cutadapt.sh

    echo "DONE cutadapt"
    cd -

}


microbiome_analysis_data_main