<<<<<<< Updated upstream
# Qiime2_Microbiome_Pipeline
=======
# Qiime2_Microbiome_Analysis_Simple_Pipeline

## Environment

- x86_64 Linux OS
- [Conda](https://www.anaconda.com/download#downloads)
- [Qiime2-2023.5](https://data.qiime2.org/distro/core/qiime2-2023.5-py38-linux-conda.yml) version
- Illumina Demultiplexing Paired-end fastq.gz files (`rawdata` directory)

## Start
1. Install QIIME2 and activate the environment.
```
wget https://data.qiime2.org/distro/core/qiime2-2023.5-py38-linux-conda.yml
conda env create -n qiime2-2023.5 --file qiime2-2023.5-py38-linux-conda.yml
rm qiime2-2023.5-py38-linux-conda.yml
conda activate qiime2-2023.5
```

2. Clone our github repository:
```
git clone https://github.com/KU-MedAI/Qiime2_Microbiome_Pipeline.git \
cd Qiime2_Microbiome_Pipeline/
```

3. Download SILVA classifier and move into `info` directory:
```
wget --load-cookies ~/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies ~/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1kBWm8r6DRjnAqjfqj7DRTeDI_2a5igF0' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1kBWm8r6DRjnAqjfqj7DRTeDI_2a5igF0" -O silva-138.1-ssu-nr99-classifier.qza && rm -rf ~/cookies.txt
mv silva-138.1-ssu-nr99-classifier.qza info/
```

4. Create the `metadata.txt` in the `info` directory. 
The file names in the raw data should follow the format "*_L001_R1_001.fastq.gz", where * corresponds to the `sampleid` in the file name.

sampleid | label
---------|---------
"*" of *_L001_R1_001.fastq.gz | gut

- Error: Duplicate Sample IDs error

If you have the error, change `sampleid` column in `metadata.txt`. For example, If you have samples named "A1_01", "A1_02", "A1_03", then in your `metadata.txt`, the `sampleid` column should contain values "A101_01", "A102_02", "A103_03". It's important to ensure that the part of the string before the underscore in these sampleid is unique. Here's a breakdown of how the transformation works:

"A1_01" → "A101_01"
"A1_02" → "A102_02"
"A1_03" → "A103_03"

## Pipeline

1. Run the first file:
Import data and then upload the visualized `.qzv` file to [Qiime2 View](https://view.qiime2.org/). After reviewing the results displayed there, you can decide how to set the quality score and trimming length parameters.

```
./01_data_summary.sh
```

Output:
`import_data/demux.qza`
`import_data/demux_vis.qzv`
`cutadapt/cut_seq.qza`
`cutadapt/cut_seq_vis.qzv`

In our pipeline, the `.qza` files within the `import_data` directory are used by default (Since the downloaded data may have already had adapters removed or undergone Quality Control (QC)). If you have performed QC yourself, please change the path of the `--i-demultiplexed_seqs` parameter in `qiime2_dada2.sh` or `qiime2_deblur.sh` within the `scripts` directory to `${RESULT_DIR}/cutadapt/cut_seq.qza`.

2. Run the second file:

In many studies, `dada2` is commonly used for trimming, which is why our pipeline initially executes using `dada2` as the default method.

```
./02_dada2_pipline.sh
```

3. If this error continues to occur (even after changing the `trunc_len_f` or `_r` parameters), please execute the following file: `03_deblur_pipeline.sh`. Since *deblur* does not trim based on quality score (q score), it is expected to perform correctly.

- Error: No reads passed the filter. trunc_len_f (n) or trunc_len_r (n) may be individually longer than read lengths, or trunc_len_f + trunc_len_r may be shorter than the length of the amplicon + 12 nucleotides (the length of the overlap). Alternatively, other arguments (such as max_ee or trunc_q) may be preventing reads from passing the filter.
 
```
./03_deblur_pipeline.sh
```

## Output

If the pipeline has been executed successfully, a `barplot.qzv` file should have been created in the `Results/dada2` or `deblur` directory. To obtain the abundance matrix, follow these steps:

1. Download the `barplot.qzv` file.
2. Access [Qiime2 View](https://view.qiime2.org/) and upload the file.
3. Select the desired taxonomy level (Genus level: Level 6, Species level: Level 7).
4. Choose `CSV` under `Download` and download the abundance matrix.

**If the taxonomy is not as rich as expected:**
- The threshold (e.g. quality score, trunc_len, etc) set in `02_dada2_pipeline.sh` or `03_deblur_pipeline.sh` might be too high. Try lowering the threshold to the minimum and rerun the pipeline.
>>>>>>> Stashed changes
