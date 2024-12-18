(ns day-03.part-two
  (:require [day-03.core :refer [read-grid]]
             [day-03.part-one :refer [tree? where-i-am tree-at? tree-or-not]]))


(def TREE "#")
(def SLOPES [{:right 1 :down 1}
             {:right 3 :down 1}
             {:right 5 :down 1}
             {:right 7 :down 1}
             {:right 1 :down 2}])


(defn grid-lines [grid down]
  "Returns a list of lines according to `down`"
  (keep (fn [[n line]] (if (= (mod n down) 0) line)) (map-indexed vector grid)))


(defn trees [grid slope]
  "number of trees for a specific slope"
  (let [current-grid (grid-lines grid (:down slope))]
    (reduce + (tree-or-not current-grid (:right slope)))))


(defn run [opts]
  "clj -X day-03.part-two/run"
  (let [grid (read-grid)
        trees-by-slope (map (partial trees grid) SLOPES)
        solution (reduce * trees-by-slope)]
    (println "number of trees by slope:" trees-by-slope)
    (println "solution:" solution)))
