#!/usr/bin/env bash

### Deblur denoising

deblur_main(){
	
	qiime2_deblur
}

qiime2_deblur(){

cd ${RESULT_DIR}
mkdir -p ${RESULT_DIR}/deblur
 
qiime deblur denoise-16S \
  --i-demultiplexed-seqs ${RESULT_DIR}/QC_reads/QC_demux_trimmed-joined.qza \
  --p-trim-length 250  \
  --o-representative-sequences ${RESULT_DIR}/deblur/rep-seqs-deblur.qza \
  --o-table ${RESULT_DIR}/deblur/table-deblur.qza \
  --p-jobs-to-start 4 \
  --p-sample-stats \
  --o-stats ${RESULT_DIR}/deblur/deblur-stats.qza  

}

deblur_main