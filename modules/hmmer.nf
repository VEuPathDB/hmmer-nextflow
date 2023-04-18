#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process Hmmer {

  input:
    path subsetFasta

  output:
    path 'hmmer_out.tsv'
  script:
    template 'hmmer.bash'
}

workflow hmmer {
  take:
    seqs

  main:
    Hmmer(seqs) \
        | collectFile(storeDir: params.outputDir, name: 'hmmer_out.tsv') 
}