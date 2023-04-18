#!/usr/bin/env bash

set -euo pipefail

hmmsearch --tblout hmmer_out.tsv /opt/hmmer/data/*.hmm $subsetFasta
