(defproject eclinic_web_app "0.1.0-SNAPSHOT"
  :description "eClinic for managing appointments in web clinic application"
  :url "https://github.com/Stefanpe95/eClinicWebApp-Clojure"
  :license {:name "EPL-2.0 OR GPL-2.0-or-later WITH Classpath-exception-2.0"
            :url "https://www.eclipse.org/legal/epl-2.0/"}
  :dependencies [[org.clojure/clojure "1.10.3"]
                 [org.clojure/core.incubator "0.1.4"]
                 [compojure "1.1.0"]
                 [org.clojure/java.jdbc "0.7.12"]
                 [mysql/mysql-connector-java "8.0.16"]
                 [ring "1.9.3"]
                 [ring-server "0.2.3"]
                 [ring-basic-authentication "1.1.0"]
                 [de.ubercode.clostache/clostache "1.4.0"]]
  :plugins [[lein-ring "0.12.0"]]
  :ring {:handler eclinic-web-app.core/-app
         :init eclinic-web-app.core/init
         :port 4200}
  :profiles {:dev {:dependencies [[javax.servlet/servlet-api "2.5"]
                                  [ring/ring-mock "0.4.0"]]}})
