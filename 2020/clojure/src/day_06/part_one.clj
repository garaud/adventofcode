(ns day-06.part-one
  (:require [day-06.core :refer [read-custom-declaration-forms
                                 answers-by-group]]))


(defn count-unique-question [group]
  "count the number of unique question for a single group"
  (count (set group)))


(defn run [opts]
  "clj -X day-06.part-one/run"
  (let [forms (read-custom-declaration-forms)
        groups (answers-by-group forms)
        uniq (map count-unique-question groups)
        solution (reduce + uniq)]
    (println "solution:" solution)))
