(ns day-06.core
  (:require [clojure.string :as str]))


(defn read-custom-declaration-forms []
  "read the input by group"
  (-> (slurp "src/day_06/input")
    (str/split #"\n\n")))


(defn answers-by-group [forms]
  "the answers by group (vector of list of chars)"
  (letfn [(split [x] (filter #(not= \newline %) (apply vector x)))]
    (into [] (map split forms))))
