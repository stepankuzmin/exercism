(ns word-count)

(defn word-count [string]
  (->> string
    (re-seq #"\w+")
    (map clojure.string/lower-case)
    (group-by identity)
    (map #(update % 1 count))
    (flatten)
    (apply hash-map)))
