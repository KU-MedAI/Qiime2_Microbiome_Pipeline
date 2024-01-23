#!/usr/bin/env bash

# Visualization - barplot of microbiome abundance

barplot_main(){
	
	qiime2_barplot

}

qiime2_barplot(){

    if [ -d "${RESULT_DIR}/dada2" ]; then
        TARGET_DIR="dada2"
    else
        TARGET_DIR="deblur"
    fi

    cd ${RESULT_DIR}

    qiime taxa barplot \
    --i-table ${RESULT_DIR}/${TARGET_DIR}/table-${TARGET_DIR}.qza \
    --i-taxonomy ${RESULT_DIR}/${TARGET_DIR}/classification_output/taxonomy.qza \
    --o-visualization ${RESULT_DIR}/${TARGET_DIR}/barplots.qzv \
    --m-metadata-file  ${INFORMATION_DIR}/metadata.txt

}

barplot_main