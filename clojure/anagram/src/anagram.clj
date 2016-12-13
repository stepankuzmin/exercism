(ns anagram)

(defn is-anagram-for [word1]
  (let
    [
      word1-lower (clojure.string/lower-case word1)
      word1-freq (frequencies word1-lower)
    ]
    (fn [word2]
      (let [word2-lower (clojure.string/lower-case word2)]
        (and
          (not= word1-lower word2-lower)
          (= word1-freq (frequencies word2-lower)))))))

(defn anagrams-for [word lst]
  (filter (is-anagram-for word) lst))
