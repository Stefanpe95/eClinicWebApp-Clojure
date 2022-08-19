(ns eclinic-web-app.controller.controller
  (:require
    [eclinic-web-app.models.department :as department]
    [eclinic-web-app.models.doctor :as doctor]
    [eclinic-web-app.models.patient :as patient]
    [eclinic-web-app.models.appointment :as appointment]
    [eclinic-web-app.models.bloodtype :as bloodtype]
    [eclinic-web-app.models.gender :as gender]
    [clostache.parser :as clostache]
    [clojure.java.io :as io]))

(defn read-template [template-name]
  (slurp (io/resource
           (str "views/" template-name ".mustache"))))

(defn render-template [template-file params]
  (clostache/render (read-template template-file) params))

(defn index []
  (render-template "index" {}))

(defn department []
  (render-template "department" {:department (department/allDepartment)}))

(defn doctor []
  (render-template "doctor" {:doctor (doctor/allDoctor)}))

(defn patient []
  (render-template "patient" {:patient (patient/allPatient)}))

(defn appointment []
  (render-template "appointment" {:appointment (appointment/allAppointment)}))

(defn createDepartment []
  (render-template "addDepartment" {}))

(defn createDoctor []
  (render-template "addDoctor" {:department (department/allDepartment)}))

(defn createPatient []
  (render-template "addPatient" {:bloodtype (bloodtype/allBloodtype)
                                 :gender    (gender/allGender)})
  )

(defn createAppointment []
  (render-template "addAppointment" {:doctor  (doctor/allDoctor)
                                     :patient (patient/allPatient)})
  )

(defn updateDoctor [id]
  (render-template "updateDoctor" {:doctor (doctor/get id)
                                   :department (department/allDepartment)}))

(defn updateDepartment [id]
  (render-template "updateDepartment" {:department (department/get id)}))

(defn updatePatient [id]
  (render-template "updatePatient" {:patient (patient/get id)
                                    :bloodtype (bloodtype/allBloodtype)
                                    :gender (gender/allGender)})
  )

(defn updateAppointment [id]
  (render-template "updateAppointment" {:appointment (appointment/get id)
                                        :patient (patient/allPatient)
                                        :doctor (doctor/allDoctor)})
  )




