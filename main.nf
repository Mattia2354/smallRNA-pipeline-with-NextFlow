#!/usr/bin/env nexflow

/*
* Insert the default parameters
*/

params.reads = "${baseDir}/toy_data/*.fastq.gz"

/*
* Perform the fastqc
*/

process fastqc {

  input:
  path read

  script:
  """
  # echo "Percorso del file di input: ${read}" > "${baseDir}/results/prova.txt"
  fastqc ${read} --outdir="${baseDir}/results"
  """
}

workflow {
  reads_ch = Channel.fromPath(params.reads)
  fastqc_results = fastqc(reads_ch)
}
