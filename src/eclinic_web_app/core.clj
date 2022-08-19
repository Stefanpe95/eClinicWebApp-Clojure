(ns eclinic-web-app.core
  (:use compojure.core)
  (:require [clojure.java.jdbc :as j]
            [clojure.edn :as edn]
            [compojure.route :as route]
            [ring.middleware.basic-authentication :refer :all]
            [ring.util.response :as resp]
            [compojure.handler :as handler]
            [eclinic-web-app.models.department :as department]
            [eclinic-web-app.models.doctor :as doctor]
            [eclinic-web-app.models.patient :as patient]
            [eclinic-web-app.models.appointment :as appointment]
            [eclinic-web-app.controller.controller :as controller])

  )

;(defn main
;  "I don't do a whole lot."
;  [x]
;  (println x "Hello, World!"))


;(def db (edn/read-string (slurp "config/db-config-migration.edn")))

;(defn exec-sql-file []
;  (j/db-do-commands
;    {:connection-uri (format "jdbc:%s://%s/%s?user=%s&password=%s"
;                             (db :adapter) (db :server-name)
;                             (db :database-name) (db :user-name)
;                             (db :password))}
;    (read-string (slurp (format "src/eclinic_web_app/migration/%s"
;                                (db :migration-file-name))))))
;
;(defn init []
;  (j/db-do-commands {:connection-uri (format "jdbc:%s://%s?user=%s&password=%s"
;                                             (db :adapter) (db :server-name)
;                                             (db :user-name) (db :password))}
;                    false
;                    (format "CREATE DATABASE IF NOT EXISTS %s", (db :database-name)))
;  (exec-sql-file))

(defroutes public-routes

           (GET "/" [] (controller/index))
           (route/resources "/")

           (GET "/index" [] (controller/index))
           (route/resources "/")

           (GET "/department" [] (controller/department))
           (route/resources "/")

           (GET "/doctor" [] (controller/doctor))
           (route/resources "/")

           (GET "/patient" [] (controller/patient))
           (route/resources "/")

           (GET "/appointment" [] (controller/appointment))
           (route/resources "/")

           (GET "/models/department/create" [] (controller/createDepartment))
           (route/resources "/")

           (GET "/models/doctor/create" [] (controller/createDoctor))
           (route/resources "/")

           (GET "/models/patient/create" [] (controller/createPatient))
           (route/resources "/")

           (GET "/models/appointment/create" [] (controller/createAppointment))
           (route/resources "/")

           (POST "/models/department/insert" [& params]
             (do (department/addDepartment params)
                 (resp/redirect "/department")))

           (POST "/models/doctor/insert" [& params]
             (do (doctor/addDoctor params)
                 (resp/redirect "/doctor")))

           (POST "/models/patient/insert" [& params]
             (do (patient/addPatient params)
                 (resp/redirect "/patient")))

           (POST "/models/appointment/insert" [& params]
             (do (appointment/addAppointment params)
                 (resp/redirect "/appointment")))

           (GET "/models/department/:id/delete" [id]
             (do (department/deleteDepartment id)
                 (resp/redirect "/department")))

           (GET "/models/doctor/:id/delete" [id]
             (do (doctor/deleteDoctor id)
                 (resp/redirect "/doctor")))

           (GET "/models/patient/:id/delete" [id]
             (do (patient/deletePatient id)
                 (resp/redirect "/patient")))

           (GET "/models/appointment/:id/delete" [id]
             (do (appointment/deleteAppointment id)
                 (resp/redirect "/appointment")))

           (GET "/models/department/:id/update" [id] (controller/updateDepartment id))

           (GET "/models/doctor/:id/update" [id] (controller/updateDoctor id))

           (GET "/models/patient/:id/update" [id] (controller/updatePatient id))

           (GET "/models/appointment/:id/update" [id] (controller/updateAppointment id))

           (POST "/models/department/:departmentid/update" [& params]
             (do (department/updateDepartment (:departmentid params) params)
                 (resp/redirect "/department")))

           (POST "/models/doctor/:doctorid/update" [& params]
             (do (doctor/updateDoctor (:doctorid params) params)
                 (resp/redirect "/doctor")))

           (POST "/models/patient/:patientid/update" [& params]
             (do (patient/updatePatient (:patientid params) params)
                 (resp/redirect "/patient")))

           (POST "/models/appointment/:appointmentid/update" [& params]
             (do (appointment/updateAppointment (:appointmentid params) params)
                 (resp/redirect "/appointment")))


           )

(defroutes app-routes
           public-routes
           (route/not-found "404 Not Found"))

(def -app
  (handler/site app-routes))









