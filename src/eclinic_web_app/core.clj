(ns eclinic-web-app.core
  (:use compojure.core)
  (:require [clojure.java.jdbc :as j]
            [clojure.edn :as edn]
            [compojure.route :as route]
            [ring.middleware.basic-authentication :refer :all]
            [ring.util.response :as resp]
            [compojure.handler :as handler])

  )

;(defn main
;  "I don't do a whole lot."
;  [x]
;  (println x "Hello, World!"))


(def db (edn/read-string (slurp "config/db-config-migration.edn")))

(defn exec-sql-file []
  (j/db-do-commands
    {:connection-uri (format "jdbc:%s://%s/%s?user=%s&password=%s"
                             (db :adapter) (db :server-name)
                             (db :database-name) (db :user-name)
                             (db :password))}
    (read-string (slurp (format "src/eclinic_web_app/migration/%s"
                                (db :migration-file-name))))))

(defn init []
  (j/db-do-commands {:connection-uri (format "jdbc:%s://%s?user=%s&password=%s"
                                             (db :adapter) (db :server-name)
                                             (db :user-name) (db :password))}
                    false
                    (format "CREATE DATABASE IF NOT EXISTS %s", (db :database-name)))
  (exec-sql-file))

(defroutes app-routes
           public-routes
           (route/not-found "404 Not Found"))

(def -app
  (handler/site app-routes))









