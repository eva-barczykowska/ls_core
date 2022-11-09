;; (defn hello [times]
;;   (prn "Hello, World")
;;   (cond (> times 1) (hello (- times 1)))
;; )

;; (hello 5)



;; Lists, vectors, sets and maps
;; We're used to seeing lists as arrays.
;; Clojure doesn't really have arrays as we are familiar with them.
;; Their 'array' is a vector, meaning that vectors are used to represent data.
;; Lists are 'arrays' that are used to represent code.
;; When I say 'array' here, I mean an ordered collection.
;; [1, 2, 3, 10, 4]
(def numberVector [1 2 3 10 4 4])
;; (println numberVector)

;; Everything between parenthesis is a list. Lists are executed.
;; Lists are also ordered collections. You _can_ use lists to represent data
;; but it is not idomatic.
(def numberList '(1 2 3 10 4 4))
(println numberList numberVector)

;; Sets are vectors(?) that only contain unique values
(def numberSet #{1 2 3 10 4})
(println numberSet)

;; Maps are like hashes, they are sets of key-value pairs
(def numberMap {:darth-vader "obi wan" :luke "yoda"})
(println numberMap)

;; Data as code
;; A list is a data structure - but it is a data structure that Clojure evaluates as though it were code. Data treated as code.

;; functions and special forms (and macros)
;; A function is a peice of code that can be invoked and whose arguments will all be evaluated and passed in before the function is run.
;; A special form is like a function except its operands are not evaluated before execution and only some of its operands will be evaluated. Special forms cannot be defined by the programmer - they are built-in functionality for the Clojure language that functions cannot replicate.
(if (= 0 3) (println "true") (println "false"))
;; A macro is like a function but it is used to _extend the Clojure language_

;; sequences and lazy sequences
;; Macros and reader macros
