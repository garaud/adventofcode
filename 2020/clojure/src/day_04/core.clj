(ns day-04.core
  (:require [clojure.string :as str]))


(defn passport-block [passport]
  "trim, get rid of newline, return a list of fields 'key:value'"
  (-> passport
    str/trim
    (str/replace #"\n" " ")
    (str/split #" ")))


(defn read-passports []
  "read the input. Single blank line between password fields."
  (map passport-block
   (-> (slurp "src/day_04/input")
     (str/split #"\n\n"))))


(defn fields [passport]
  "extract fields from passport"
  (map (fn [x] (first (str/split x #":"))) passport))
