(ns day-05.part-two
  (:require [day-05.core :refer [read-boarding-passes]]
            [day-05.part-one :refer [boarding-to-place-number seat-id]]))


(defn find-index [ids]
  "first element where the sum of (n-1)+1 is different of 1017. Suppose ids are sorted"
  (let [left (take (dec (count ids)) ids)
        right (drop 1 ids)
        diff (map (fn [[l r]] (- r l)) (map vector left right))
        index (first (filter #(not= 1 (second %)) (map-indexed vector diff)))]
     index))


(defn find-seat [ids]
  "find the missing seat id (sorted)"
  (let [index (find-index ids)]
    (inc (nth ids (first index)))))


(defn all-ids []
  "extract all seat ids and sort them"
  (let [passes (read-boarding-passes)
        places (map boarding-to-place-number passes)
        ids (map seat-id places)]
    (sort ids)))


(defn run [opts]
  "clj -X day-05.part-two/run"
  (let [sort-ids (all-ids)
        index (find-index sort-ids)
        solution (find-seat sort-ids)]
    (println index)
    (println "solution:" solution)))
