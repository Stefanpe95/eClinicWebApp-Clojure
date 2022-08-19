(ns eclinic-web-app.models.appointment
  (:refer-clojure :exclude [seqable? get update])
  (:require [clojure.java.jdbc :as jdbc]
            [clojure.edn :as edn]))

(def db (edn/read-string (slurp "config/db-config.edn")))

(defn allAppointment []
  (jdbc/query db ["SELECT appointmentid,note,date,CONCAT(clojureclinic.doctor.doctorpid,' -- ',clojureclinic.doctor.name, ' ', clojureclinic.doctor.surname) as doctor,CONCAT(clojureclinic.patient.DOB,' -- ',clojureclinic.patient.name, ' ', clojureclinic.patient.surname) as patient
                  FROM clojureclinic.appointment
                  JOIN clojureclinic.doctor ON clojureclinic.appointment.doctorid = clojureclinic.doctor.doctorid
                  JOIN clojureclinic.patient ON clojureclinic.appointment.patientid  = clojureclinic.patient.patientid"]))

(defn deleteAppointment [id]
  (jdbc/delete! db :appointment ["appointmentid = ?" id])
  )

(defn addAppointment [parameters]
  (jdbc/insert! db :appointment parameters))

(defn get [id]
  (first (jdbc/query db ["SELECT *
                          FROM appointment
                          WHERE appointmentid = ?" id]))
  )

(defn updateAppointment [id parameters]
  (jdbc/update! db :appointment parameters ["appointmentid = ?" id]))

