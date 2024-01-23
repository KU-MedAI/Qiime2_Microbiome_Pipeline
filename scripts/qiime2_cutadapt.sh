#!/usr/bin/env bash

# Cutadapt plugin
# Requirements: Setting cutadapt parameters

cutadapt_main(){
	
	qiime2_cutadapt
}

qiime2_cutadapt(){

    cd ${RESULT_DIR}
    mkdir -p ${RESULT_DIR}/cutadapt

    qiime cutadapt trim-paired  \
    --i-demultiplexed-sequences ${RESULT_DIR}/import_data/demux.qza \
    --p-cores 4 \
    --p-adapter-f CCTACGGGNGGCWGCAG \
    --p-adapter-r GACTACHVGGGTATCTAATCC \
    --o-trimmed-sequences ${RESULT_DIR}/cutadapt/cut_demux.qza

    qiime demux summarize --i-data ${RESULT_DIR}/cutadapt/cut_demux.qza --o-visualization ${RESULT_DIR}/cutadapt/demux_vis.qzv

}

cutadapt_main