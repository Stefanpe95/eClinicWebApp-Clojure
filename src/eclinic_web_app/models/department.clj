(ns eclinic-web-app.models.department
  (:refer-clojure :exclude [seqable? get update])
  (:require [clojure.java.jdbc :as jdbc]
            [clojure.edn :as edn])
  )

(def db (edn/read-string (slurp "config/db-config.edn")))

(defn allDepartment []
  (jdbc/query db ["SELECT * FROM clojureclinic.department"]))

(defn get [id]
  (first (jdbc/query db ["SELECT *
                          FROM department
                          WHERE departmentid = ?" id])))

(defn addDepartment [parameters]
  (jdbc/insert! db :department parameters))

(defn deleteDepartment [id]
  (jdbc/delete! db :department ["departmentid = ?" id]))

(defn updateDepartment [id parameters]
  (jdbc/update! db :department parameters ["departmentid = ?" id]))