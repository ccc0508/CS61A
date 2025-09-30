(define (ascending? s) (cond ((null? s) true) ((null? (cdr s)) true) ((> (car s) (car (cdr s))) false) (else (ascending? (cdr s)))))

(define (my-filter pred s) (cond ((null? s) s) ((pred (car s)) (cons (car s) (my-filter pred (cdr s)))) (else (my-filter pred (cdr s)))))

(define (interleave lst1 lst2) (cond ((or (null? lst1) (null? lst2)) (if (null? lst1) lst2 lst1)) (else (cons (car lst1) (cons (car lst2) (interleave (cdr lst1) (cdr lst2)))))))

(define (no-repeats s) (cond ((null? s) s) ((null? (cdr s)) s) (else (cons (car s) (no-repeats (filter (lambda (x) (not (= x (car s)))) s))))))
