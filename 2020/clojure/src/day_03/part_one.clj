(ns day-03.part-one
  (:require [day-03.core :refer [read-grid]]))


(def TREE "#")
;; slope (down 1, right 3)
(def RIGHT 3)


(defn tree? [location]
  "is there a tree?"
  (= (str location) TREE))


(defn where-i-am [line-no line]
  "extract the character given a specific line"
  (let [x-coord (mod (* line-no RIGHT) (count line))]
    (nth line x-coord)))


(defn tree-at? [line]
  "Is it a tree for a given line?"
  (let [[line-no line] line]
    (tree? (where-i-am line-no line))))


(defn tree-or-not [grid]
  "Return 1 or 0 if you encounter a tree"
  (let [fn (comp (fn [x] (if x 1 0)) tree-at?)]
    (map fn (map-indexed vector grid))))


(defn run [opts]
  "clj -X day-03.part-one/run"
  (let [grid (read-grid)
        solution (reduce + (tree-or-not grid))]
    (println "solution:" solution)
    solution))
