#!/usr/bin/env bash

dada2_main(){
	
	qiime2_dada2
}

qiime2_dada2(){

    cd ${RESULT_DIR}
    mkdir -p ${RESULT_DIR}/dada2
    
    qiime dada2 denoise-paired \
    --i-demultiplexed-seqs ${RESULT_DIR}/import_data/demux.qza \
    --p-trim-left-f 0 \
    --p-trunc-len-f 290 \
    --p-trim-left-r 0 \
    --p-trunc-len-r 290 \
    --o-representative-sequences ${RESULT_DIR}/dada2/rep-seqs-dada2.qza \
    --o-table ${RESULT_DIR}/dada2/table-dada2.qza \
    --p-n-threads 0 \
    --p-chimera-method consensus \
    --o-denoising-stats ${RESULT_DIR}/dada2/dada2-stats.qza

}

dada2_main