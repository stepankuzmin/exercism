(ns bob)

(defn is-upper-case [string]
  (let [letters (filter #(Character/isLetter %) string)]
    (if (> (count letters) 0)
      (every? #(Character/isUpperCase %) letters)
      false)))

(defn response-for [phrase]
  (cond
    (clojure.string/blank? phrase) "Fine. Be that way!"
    (is-upper-case phrase) "Whoa, chill out!"
    (= (last phrase) \?) "Sure."
    :else "Whatever."
  ))
