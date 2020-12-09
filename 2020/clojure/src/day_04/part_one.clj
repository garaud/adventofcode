(ns day-04.part-one
  (:require [clojure.string :as str]
            [day-04.core :refer [read-passports fields]]))


;; passport mandatory fields (all but cid)
(def MANDATORY-FIELDS
  '("byr"
    "iyr"
    "eyr"
    "hgt"
    "hcl"
    "ecl"
    "pid"))


(defn is-in? [coll item]
  "return true if item is in coll"
  (some #(= item %) coll))


(defn valid?
  "is a passport valid?"
  ([passport] (valid? passport MANDATORY-FIELDS))
  ([passport mandatory-fields]
   (let [pfields (fields passport) ;; list of fields
         ;; list of (true true nil true) if mandatory fields is in passport fields
         mask (map #(is-in? pfields %) mandatory-fields)]
     (not (is-in? mask nil)))))


(defn run [opts]
  "clj -X day-04.part-one/run"
  (let [passports (read-passports)
        valids (map (comp #(if % 1 0) valid?) passports)
        solution (reduce + valids)]
    (println "solution:" solution)))
