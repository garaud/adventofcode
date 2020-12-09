(ns day-02.core
  (:require [clojure.string :as str]))


(defn extract-content [line]
  "extract some content from string"
  (let [[rules password] (str/split line #":")
        [range letter] (str/split rules #" ")
        min (-> range
              (str/split #"-")
              first
              Integer/parseInt)
        max (-> range
              (str/split #"-")
              second
              Integer/parseInt)
        ]
    {:letter letter
     :bound {:min min :max max}
     :password (str/trim password)}))


(defn in-range? [number bound]
  "is number included between [min max]"
  (and (>= number (bound :min))
      (<= number (bound :max))))


(defn read-password-policy []
  "read the input"
  (-> (slurp "src/day_02/input")
    (str/split #"\n")))
