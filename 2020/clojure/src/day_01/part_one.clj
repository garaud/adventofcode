(ns day-01.part-one
  (:require [day-01.core :refer [read-expenses]]))


(defn find-sum [left right target]
  "Find the the pair where the sum is equal to `target`. Suppose left and right are sorted"
  (let [minv (first left)
        maxv (first right)
        minsize (min (count left) (count right))
        sum (+ minv maxv)]
    (cond
      (or (= minsize 1) (= minv maxv)) nil
      (= sum target) (list minv maxv)
      (< sum target) (find-sum (rest left) right target)
      (> sum target) (find-sum left (rest right) target))))


(defn display-solution [solution]
  (let [[left right] solution]
    (println "Pair where sum=2020: " (list left right))
    (println "Solution: " (* left right))
    (* left right)))


(defn run [opts]
  "clj -X day-01.part-one/run"
  (let [expenses (read-expenses)
        target 2020
        asc (sort < expenses)
        desc (sort > expenses)
        solution (find-sum asc desc target)]
    (if
        (nil? solution) (println "no solution")
        (display-solution solution))))
