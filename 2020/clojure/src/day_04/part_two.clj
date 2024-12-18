(ns day-04.part-two
  (:require [clojure.string :as str]
            [day-04.core :refer [read-passports fields]]
            [day-04.part-one :refer [MANDATORY-FIELDS is-in? present?]]))

;; Eye Colors
(def COLORS '("amb" "blu" "brn" "gry" "grn" "hzl" "oth"))


(defn field-to-keyword [field]
  (let [[key value] (str/split field #":")]
    {(keyword key) value}))


(defn passport-to-arraymap [passport]
  "turn a string passport to an array map"
  (into {} (map field-to-keyword passport)))


(defn four-digits [field]
  (= (count field) 4))


(defn is-between [field low high]
  (let [value (Integer/parseInt field)]
    (and
     (>= value low)
     (<= value high))))


(defn -valid-year [low high field]
  "is the year valid?"
  (and
   (four-digits field)
   (is-between field low high)))


(defn -valid-height [low high field]
  "is the height valid?"
  (is-between (re-find #"[0-9]+" field) low high))


;; birth year between 1920 and 2002
(def birth-year (partial -valid-year 1920 2002))
;; issue year between 2010 and 2020
(def issue-year (partial -valid-year 2010 2020))
;; expiration-year year between 2020 and 2030
(def expiration-year (partial -valid-year 2020 2030))

;; height (cm) between 150 and 193
(def height-cm (partial -valid-height 150 193))
;; height (in) between 59 and 76
(def height-in (partial -valid-height 59 76))


(defn is-cm? [field]
  (str/ends-with? field "cm"))


(defn is-inch? [field]
  (str/ends-with? field "in"))


;; `hcl` (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
(defn hair-color [field]
  "is the hair color valid?"
  (and
   (str/starts-with? field "#")
   (= (count field) 7)
   (some? (re-matches #"\#[0-9-a-f]+" field))))


;; `ecl` (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
(defn eye-color [field]
  "is the eye color valid?"
  (is-in? COLORS field))


;; `pid` (Passport ID) - a nine-digit number, including leading zeroes.
(defn passport-id [field]
  "is the passport id valid"
  (and
   (= (count field) 9)
   (= (re-matches #"[0-9]+" field))))


(defn valid? [passport]
  "is a passport valid?"
  (let [byr (:byr passport)
        iyr (:iyr passport)
        eyr (:eyr passport)
        hgt (:hgt passport)
        hcl (:hcl passport)
        ecl (:ecl passport)
        pid (:pid passport)]
    (and
     (birth-year byr)
     (issue-year iyr)
     (expiration-year eyr)
     (cond
       (is-cm? hgt) (height-cm hgt)
       (is-inch? hgt) (height-in hgt))
     (hair-color hcl)
     (eye-color ecl)
     (passport-id pid))))


(defn run [opts]
  "clj -X day-04.part-two/run"
  (let [passports (read-passports)
        passports-present-fields (map passport-to-arraymap (filter present? passports))
        passports-valid (filter valid? passports-present-fields)
        solution (count passports-valid)]
    (println "solution:" solution)))
