(ns day-05.part-one
  (:require [day-05.core :refer [read-boarding-passes
                                 binary-to-number
                                 extract-boarding-pass]]))


(defn -to-binary [letter pass]
  "turn 'pass' into a list of 1 and 0 according to the 'letter' which matches with 1"
  (map #(if (= % letter) 1 0) pass))

(def front-back-binary (partial -to-binary \B))
(def left-right-binary (partial -to-binary \R))


(defn boarding-to-place-number [content]
  "turn a string boarding pass into a place number with :row and :column"
  (let [pass (extract-boarding-pass content)
        fb-digits (front-back-binary (:front-back pass))
        lr-digits (left-right-binary (:left-right pass))]
    {:row (binary-to-number fb-digits)
     :column (binary-to-number lr-digits)}))


(defn seat-id [place]
  "compute the sead ID from a place number (row and column)"
  (+ (* (:row place) 8) (:column place)))


(defn run [opts]
  "clj -X day-05.part-one/run"
  (let [passes (read-boarding-passes)
        places (map boarding-to-place-number passes)
        ids (map seat-id places)
        solution (reduce max ids)]
    (println ids)
    (println solution)))
