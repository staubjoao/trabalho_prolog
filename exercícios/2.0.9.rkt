#lang racket
(require rackunit)
(require rackunit/text-ui)

;; 3 numeros -> string
;; verificar o tipo do triangulo

(define tipo_triangulo-testes
(test-suite
"tipo do triangulo"
(check-equal? (tipo_triangulo 4 5 3) "escaleno")
(check-equal? (tipo_triangulo 4 4 4) "equilátero")
(check-equal? (tipo_triangulo 4 4 8) "isósceles")
))


;; define tipo_triangulo
(define (tipo_triangulo x y z)
  (cond
    [(= x y z)"equilátero"]
    
    [(and(= x z) (not(= x y))) "isósceles"]
    [(and(= x y) (not(= x z))) "isósceles"]
    
    [(and(= y x) (not(= y z))) "isósceles"]
    [(and(= y z) (not(= y x))) "isósceles"]

    [(and(= z x) (not(= z y))) "isósceles"]
    [(and(= z y) (not(= z x))) "isósceles"]
    
    [else "escaleno"]
    )
  )

;; executando os testes
(define (executa-testes . testes)
(run-tests (test-suite "Todos os testes" testes))
(void))
(executa-testes tipo_triangulo-testes)
                  