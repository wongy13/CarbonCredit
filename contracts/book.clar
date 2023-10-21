(define-data-var stored-number int 0) ;; defines a variable stored-number that will store a new number

;; #[allow(unchecked_data)]

(define-public (store-number (number int)) 
    (ok (var-set stored-number number)))

(define-public (get-number)
  (ok (var-get stored-number)))