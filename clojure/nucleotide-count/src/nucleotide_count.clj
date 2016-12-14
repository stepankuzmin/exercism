(ns nucleotide-count)

(defn count [nucleotide nucleotides]
  (if (contains? #{\A \C \G \T} nucleotide)
    (->>
      (char-array nucleotides)
      (reduce #(if (= %2 nucleotide) (inc %1) %1) 0))
    (assert false)))

(defn nucleotide-counts [nucleotides]
  (->>
    (frequencies nucleotides)
    (merge {\A 0, \T 0, \C 0, \G 0})))
