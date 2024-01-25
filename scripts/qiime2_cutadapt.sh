#!/usr/bin/env bash

cutadapt_main(){
	
	qiim2_cutadapt
}

qiim2_cutadapt(){

cd ${RESULT_DIR}
mkdir -p ${RESULT_DIR}/cutadapt

qiime cutadapt trim-paired  \
 --i-demultiplexed-sequences ${RESULT_DIR}/import_data/demux.qza \
 --p-cores 4 \
 --p-adapter-f GACTCCTACGGGAGGCWGCAG \
 --p-adapter-r GACTACHVGGGTATCTAATCC \
 --o-trimmed-sequences ${RESULT_DIR}/cutadapt/cut_seq.qza

 qiime demux summarize --i-data ${RESULT_DIR}/cutadapt/cut_seq.qza --o-visualization ${RESULT_DIR}/cutadapt/cut_seq_vis.qzv

}

cutadapt_main