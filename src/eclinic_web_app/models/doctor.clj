(ns eclinic-web-app.models.doctor
  (:refer-clojure :exclude [seqable? get update])
  (:require [clojure.java.jdbc :as jdbc]
            [clojure.edn :as edn]))

(def db (edn/read-string (slurp "config/db-config.edn")))

(defn allDoctor []
  (jdbc/query db ["SELECT clojureclinic.doctor.doctorid,
                  clojureclinic.doctor.email as email,
                  doctor.name as name,
                  clojureclinic.doctor.surname as surname,
                  clojureclinic.doctor.doctorpid as doctorpid,
                  clojureclinic.department.name as depname
                  FROM clojureclinic.doctor
                  JOIN clojureclinic.department ON clojureclinic.doctor.departmentid = clojureclinic.department.departmentid"]))

(defn addDoctor [parameters]
  (jdbc/insert! db :doctor parameters))

(defn deleteDoctor [id]
  (jdbc/delete! db :doctor ["doctorid = ?" id])
  )

(defn get [id]
  (first (jdbc/query db ["SELECT *
                          FROM doctor
                          WHERE doctorid = ?" id])))

(defn updateDoctor [id parameters]
  (jdbc/update! db :doctor parameters ["doctorid = ?" id]))