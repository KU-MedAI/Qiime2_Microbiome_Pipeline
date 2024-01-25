#!/usr/bin/env bash

input_main(){
	
	import_data

}

import_data(){

cd ${RESULT_DIR}
mkdir -p ${RESULT_DIR}/import_data

qiime tools import --input-format CasavaOneEightSingleLanePerSampleDirFmt --type 'SampleData[PairedEndSequencesWithQuality]' --input-path ${RAWDATA_DIR} --output-path ${RESULT_DIR}/import_data/demux.qza 

qiime demux summarize --i-data ${RESULT_DIR}/import_data/demux.qza --o-visualization ${RESULT_DIR}/import_data/demux_vis.qzv

}

input_main