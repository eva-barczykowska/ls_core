;;Clojure
;; 1 + 2
;; + 1 2 2 3 4

(println (+ 1 2 3 4 5 6))

;; Programming to abstractions
;; Abstractions can be thought of as named collections of operations.
;; If you can perform all of an abstraction's operations on a project, then that object is an instance of the abstraction.
;; `map` doesn't care about how lists, vectors, sets and maps are implemented - it only cares whether it can perform sequence operations on them.

;; Treating Lists, Vectors, Sets and Maps as Sequences
;; The essential behavior of the `map` operation is to derive a new sequence `y` from from an existing sequence `x`  using a function `f`.
;; The term _sequence_ here refers to a collection of elements organized in linear order.
;; Clojure implements functions in terms of data structure abstractions, rather than relying on the specifics of any particular data structure (like a list vs a vector, I guess)
;; `map` is defined in terms of the sequence abstraction.
;; You would say that `map` _takes a sequence_.
;; If the core sequence functions `first`, `rest` and `cons` work on a data structure, you can say the data structure implements the sequence abstraction - and `map` can be used on it.

(defn titleize
  [topic]
  (str topic " for the Brave and True"))

;; ["Hamsters", "Ragnarok"].map(titleize)
(println (map titleize ["Hamsters" "Ragnarok"]))  ; vector
(println (map titleize '("Empathy" "Decorating"))) ; list
(println (map titleize #{"Elbows" "Soap Carving"})) ; set (hash-set)
(println (map #(titleize (second %)) {:uncomfortable-thing "Winking"}))
;; Last one will be explained soon.

;; `first`, `rest`, `cons`
;; First, look into JS to implement a linked list and three core functions.
;; After they're implemented, will show how to build `map` with them.
;; The point is to appreciate the distinction between the seq abstraction in Clojure and the concrete implementation of a linked list.
;; Because `map` is implemented in terms of `first`, `rest` and `cons`, so long as your data structure supports these three methods, you can also use `map`, because it just invokes the corresponding versions of `first`, `rest` and `cons`.
;; But how is a function like `first` able to work with different data structures when its implementation so far depends on the provided structure? We'd have to have different versions for `first`, `rest` and `cons` for every data structure!
;; Clojure is able to use a function like `first` with different data structures by using twoforms of a concept called indirection.
;; _Indirection_ is a generic term for the mechanisms a language employs so that one name can have multiple, related meanings.
;; _Polymorphism_ is one way that Clojure provides indirection.
;; It also creates indirection by doing a kind of light-weight type conversion.
;;
