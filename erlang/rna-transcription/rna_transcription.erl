-module(rna_transcription).
-export([to_rna/1]).
-define (Complements, #{$G => $C, $C => $G, $T => $A, $A => $U}).

complement(Nucleotide) ->
  maps:get(Nucleotide, ?Complements).

to_rna(Nucleotides) ->
  lists:map(fun complement/1, Nucleotides).
