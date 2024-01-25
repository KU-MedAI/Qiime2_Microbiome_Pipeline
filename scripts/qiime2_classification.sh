#!/usr/bin/env bash

classification_main(){

	qiime2_classification

}

qiime2_classification(){

cd ${RESULT_DIR}
mkdir -p ${RESULT_DIR}/${TARGET_DIR}/classification_output

qiime feature-classifier classify-sklearn  \
 --i-classifier ${INFORMATION_DIR}/silva-138.1-ssu-nr99-classifier.qza \
 --i-reads ${RESULT_DIR}/${TARGET_DIR}/rep-seqs-${TARGET_DIR}.qza \
 --o-classification ${RESULT_DIR}/${TARGET_DIR}/classification_output/taxonomy.qza \
 --p-n-jobs -1 

}

classification_main