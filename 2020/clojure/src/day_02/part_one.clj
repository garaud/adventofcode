(ns day-02.part-one
  (:require [day-02.core :refer [read-password-policy extract-content in-range?]]))


(defn char-to-keyword [c]
  "turn a char into a keyword such as backslash_s -> :s"
  (keyword (str c)))


(defn freq-letter [password]
  "Compute letter occurrences in a password. Returns {:b 4 :c 2}"
  (into {} (map (fn [[k v]] {(char-to-keyword k) v}) (frequencies password))))


(defn password-valid? [content]
  "is a password valid?"
  (let [freq (freq-letter (:password content))
        occurrence ((keyword (:letter content)) freq 0)]
    (in-range? occurrence (:bound content))))


(defn run [opts]
  "clj -X day-02.part-one/run"
  (let [policy (map extract-content (read-password-policy))
        predicates (map password-valid? policy)
        solution (reduce + (map #(if % 1 0) predicates))]
    (println "solution: " solution)))
