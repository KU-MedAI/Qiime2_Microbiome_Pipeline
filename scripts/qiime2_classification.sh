#!/usr/bin/env bash

### Classification Using Pre-trained Classifier 

classification_main(){

	qiime2_classification

}

qiime2_classification(){

    if [ -d "${RESULT_DIR}/dada2" ]; then
        TARGET_DIR="dada2"
    else
        TARGET_DIR="deblur"
    fi

    cd ${RESULT_DIR}
    mkdir -p ${RESULT_DIR}/${TARGET_DIR}/classification_output

    qiime feature-classifier classify-sklearn  \
    --i-classifier ${INFORMATION_DIR}/silva-138-99-nb-classifier.qza \
    --i-reads ${RESULT_DIR}/${TARGET_DIR}/rep-seqs-${TARGET_DIR}.qza \
    --o-classification ${RESULT_DIR}/${TARGET_DIR}/classification_output/taxonomy.qza \
    --p-n-jobs -1

}

classification_main