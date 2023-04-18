#!/usr/bin/env nextflow
nextflow.enable.dsl=2


//---------------------------------------------------------------
// Param Checking 
//---------------------------------------------------------------

if(!params.fastaSubsetSize) {
  throw new Exception("Missing params.fastaSubsetSize")
}

if(params.input) {
  seqs = Channel.fromPath(params.input).splitFasta( by:params.fastaSubsetSize, file:true  )
}
else {
  throw new Exception("Missing params.input")
}

//---------------------------------------------------------------
// Includes
//---------------------------------------------------------------

include { hmmer } from './modules/hmmer.nf'

//---------------------------------------------------------------
// Main Workflow
//---------------------------------------------------------------

workflow {
  hmmer(seqs)
}