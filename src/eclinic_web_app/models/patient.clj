(ns eclinic-web-app.models.patient
  (:refer-clojure :exclude [seqable? get update])
  (:require [clojure.java.jdbc :as jdbc]
            [clojure.edn :as edn]))

(def db (edn/read-string (slurp "config/db-config.edn")))

(defn allPatient []
  (jdbc/query db ["SELECT patientid,
                          name,
                          surname,
                          email,
                          DOB,
                          clojureclinic.bloodtype.bloodtypelabel as bloodtype,
                          clojureclinic.gender.genderlabel as gender
                          FROM clojureclinic.patient
                          JOIN clojureclinic.bloodtype ON clojureclinic.patient.bloodtypeid = clojureclinic.bloodtype.bloodtypeid
                          JOIN clojureclinic.gender ON clojureclinic.patient.genderid = clojureclinic.gender.genderid"]))

(defn deletePatient [id]
  (jdbc/delete! db :patient ["patientid = ?" id])
  )

;(defn allBloodtype []
;  (jdbc/query db ["SELECT * FROM bloodtype"]))
;
;(defn allGender []
;  (jdbc/query db ["SELECT * FROM gender"]))

(defn addPatient [parameters]
  (jdbc/insert! db :patient parameters))

(defn get [id]
  (first (jdbc/query db ["SELECT *
                          FROM patient
                          WHERE patientid = ?" id]))
  )

(defn updatePatient [id parameters]
  (jdbc/update! db :patient parameters ["patientid = ?" id]))

