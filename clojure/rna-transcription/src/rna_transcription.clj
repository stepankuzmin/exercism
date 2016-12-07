(ns rna-transcription)

(defn transcribe [nucleotide]
  (cond
    (= nucleotide \G) \C
    (= nucleotide \C) \G
    (= nucleotide \T) \A
    (= nucleotide \A) \U
    :else (assert false)
  ))

(defn to-rna [nucleotides]
  (->> nucleotides
    (map transcribe)
    (clojure.string/join "")))
