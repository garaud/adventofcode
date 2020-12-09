(ns day-03.core
  (:require [clojure.string :as str]))


(defn read-grid []
  "read the input."
   (-> (slurp "src/day_03/input")
     (str/split #"\n")))
