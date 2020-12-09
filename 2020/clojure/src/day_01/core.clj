(ns day-01.core
  (:require [clojure.string :as str]))


(defn read-expenses []
  "Read the input expenses and return a list of ints."
  (map #(Integer/parseInt %)
       (-> (slurp "src/day_01/input")
         (str/split #"\n"))))
