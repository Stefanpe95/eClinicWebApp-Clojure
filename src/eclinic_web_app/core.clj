(ns eclinic-web-app.core)

(defn main
  "I don't do a whole lot."
  [x]
  (println x "Hello, World!"))

(def -app
  (hanlder/site app-routes))

(defn init []
  (j/db-do-commands {:connection-uri (format "jdbc:%s://%s?user=%s&password=%s"
                                             (db :adapter) (db :server-name)
                                             (db :user-name) (db :password))}
                    false
                    (format "CREATE DATABASE IF NOT EXISTS %s", (db :database-name)))
  (exec-sql-file))








