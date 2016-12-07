(ns hello-world)

(defn hello [& [name]]
  (if (nil? name)
    "Hello, World!"
    (str "Hello, " name "!")))
