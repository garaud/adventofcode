(ns day_01.core
  (:require [clojure.string :as str]))


(defn read-expenses []
  "Read the input expenses and return a list of ints."
  (map #(Integer/parseInt %)
       (-> (slurp "src/day_01/input")
         (str/split #"\n"))))


(defn find-sum [left right]
  "Find the the pair where the sum is equal to 2020. Suppose left and right are sorted"
  (let [minv (first left)
        maxv (first right)
        sum (+ minv maxv)]
    (cond
      (= sum 2020) (list minv maxv)
      (< sum 2020) (find-sum (rest left) right)
      (> sum 2020) (find-sum left (rest right))
      )))


(defn run [opts]
  "clj -X day_01.core/run"
  (let [expenses (read-expenses)
        asc (sort < expenses)
        desc (sort > expenses)
        [left right] (find-sum asc desc)]
    (println "Pair where sum=2020: " (list left right))
    (println "Solution: " (* left right))))
