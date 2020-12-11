(ns day-06.part-two
  (:require
   [clojure.set]
   [clojure.string :as str]
   [day-06.core :refer [read-custom-declaration-forms]]))


(defn same-answers-by-group [forms]
  "group the same answers from a singel group"
  (letfn [(split [x] (map set (str/split x #"\n")))
          (uniq [x] (apply clojure.set/intersection (split x)))]
    (map uniq forms)))


(defn run [opts]
  "clj -X day-06.part-two/run"
  (let [forms (read-custom-declaration-forms)
        answers (same-answers-by-group forms)
        uniq (map count answers)
        solution (reduce + uniq)]
    (println "solution:" solution)))
