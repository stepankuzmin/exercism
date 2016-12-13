(ns beer-song)

(defn bottles [n]
  (cond
    (> n 1) (str n " bottles")
    (= n 1) (str "1 bottle")
    (= n 0) (str "no more bottles")))

(defn one [n]
  (if (= n 1) "it" "one"))

(defn verse [n]
  (if (> n 0)
    (str (bottles n) " of beer on the wall, " (bottles n) " of beer.\n"
      "Take " (one n) " down and pass it around, " (bottles (dec n)) " of beer on the wall.\n")
    (str "No more bottles of beer on the wall, no more bottles of beer.\n"
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n")))

(defn song [n m]
  (->>
    (range n (dec m) -1)
    (map verse)
    (clojure.string/join "\n")))

(defn sing
  ([n] (song n 0))
  ([n m] (song n m)))
