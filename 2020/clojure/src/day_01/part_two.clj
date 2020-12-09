(ns day-01.part-two
  (:require [day-01.core :refer [read-expenses]]
            [day-01.part-one :as part-one]))


(defn find-sum [expenses target]
  "`expenses` is a sorted sequence"
  (let [current (first expenses)
        size (count expenses)
        left (rest expenses)
        right (sort > left)
        solution (part-one/find-sum left right (- target current))
        triplet (conj solution current)]
    (cond
      (= size 1) nil
      (= (reduce + triplet) target) triplet
      (nil? solution) (find-sum (rest expenses) target))))


(defn display-solution [solution]
  (let [[left middle right] solution]
    (println "Triplet where sum=2020: " (list left middle right))
    (println "Solution: " (* left middle right))
    (* left middle right)))


(defn run [opts]
  "clj -X day-01.part-two/run"
  (let [expenses (read-expenses)
        target 2020
        solution (find-sum (sort expenses) target)]
    (if
        (nil? solution) (println "no solution")
        (display-solution solution))))
