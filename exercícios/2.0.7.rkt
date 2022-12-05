#lang racket
(require rackunit)
(require rackunit/text-ui)

;; 3 numeros -> numero
;; retorna a soma do quadrado dos dois maiores

(define soma_quadrado-testes
(test-suite
"soma dos quadrados tests"
(check-equal? (soma_quadrado 2 3 9) 90)
(check-equal? (soma_quadrado 3 4 5) 41)
(check-equal? (soma_quadrado 8 6 2) 68)))

;; define quadrado
(define (quadrado a)
  (* a a))

;; define maior
(define (maior a b c)
  (cond
    [(>= a b c) a]
    [(>= b a c) b]
    [(>= c b ) c]
  ))

;; define 2maior
(define (2maior a b c)
  (cond
    [ (and(>= a b)(<= a c)) a]
    [ (and(>= a c)(<= a b)) a]
    
    [ (and(>= b a)(<= b c)) b]
    [ (and(>= b c)(<= b a)) c]

    [ (and(>= c a)(<= c b)) c]
    [ (and(>= c b)(<= c a)) c]
    ))

;; define soma_quadrado
(define (soma_quadrado x y z)
  (+ (quadrado(maior x y z)) (quadrado(2maior x y z)) )
  )

;; executando os testes
(define (executa-testes . testes)
(run-tests (test-suite "Todos os testes" testes))
(void))
(executa-testes soma_quadrado-testes)
                  

