(ns day-02.part-two
  (:require [day-02.core :refer [read-password-policy extract-content]]))


(defn char-to-keyword [c]
  "turn a char into a keyword such as backslash_s -> :s"
  (keyword (str c)))


(defn password-valid? [content]
  "is a password valid?"
  (let [password (:password content)
        ;; letter in password for the first and second position (given by :bound)
        letter-first (str (nth password (dec (get-in content [:bound :min]))))
        letter-second (str (nth password (dec (get-in content [:bound :max]))))
        letter (:letter content)]
    (or
     (and (= letter-first letter) (not= letter-second letter))
     (and (not= letter-first letter) (= letter-second letter)))))


(defn run [opts]
  "clj -X day-02.part-two/run"
  (let [policy (map extract-content (read-password-policy))
        predicates (map password-valid? policy)
        solution (reduce + (map #(if % 1 0) predicates))]
    (println "solution: " solution)))
