#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process Hmmer {

  input:
    path subsetFasta
    val appls

  output:
    path 'hmmer_out.tsv'
  script:
    template 'hmmer.bash'
}

workflow hmmer {
  take:
    seqs

  main:
    Hmmer(seqs,params.appls) \
        | collectFile(storeDir: params.outputDir, name: 'hmmer_out.tsv') 
}