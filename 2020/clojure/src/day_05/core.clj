(ns day-05.core
  (:require [clojure.string :as str]))

;; The first 7 characters: F(ront) / B(ack). 2^7 = 128 [0-127]
;; The last 3 letters, R(ight) / L(eft). 2^3 = 8.

(defn read-boarding-passes []
  "read the input"
  (-> (slurp "src/day_05/input")
    (str/split #"\n")))


(defn extract-boarding-pass [content]
  "extract boarding pass from a string"
  (let [front-back (apply str (take 7 content))
        left-right (apply str (take-last 3 content))]
    {:front-back front-back
     :left-right left-right}))


(defn binary-to-number [digits]
  "compute the number of a binary number (list of 1 and 0)"
  (let [exponents (reverse (range (count digits)))
        powers (map #(int (Math/pow 2 %)) exponents)
        products (map (fn [[x y]] (* x y)) (map vector digits powers))]
    (reduce + products)))
