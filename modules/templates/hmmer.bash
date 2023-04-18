#!/usr/bin/env bash

set -euo pipefail

hmmscan --tblout hmmer.tsv /opt/hmmer/data/*.hmm $subsetFasta

perl /usr/bin/cleanOutput.pl --input hmmer.tsv --output hmmer_out.tsv
