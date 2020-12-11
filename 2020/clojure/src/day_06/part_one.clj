(ns day-06.part-one
  (:require [day-06.core :refer [read-custom-declaration-forms
                                 answers-by-group]]))


;; (def forms (read-custom-declaration-forms))
;; (def answers (answers-by-group forms))
;; (def groups (answers-by-group forms))
;; (def uniq (map count-unique-question groups))
;; (reduce +  uniq)

;; (set (nth answers 2))

;; (filter #(not= \newline %) (apply vector "ab\ncd"))


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
