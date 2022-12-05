#lang racket
(require rackunit)
(require rackunit/text-ui)

;; numero -> numero
;; retorna o maior numero

(define encontra_maior-testes
(test-suite
"maior tests"
(check-equal? (encontra_maior 5 4) 5)
(check-equal? (encontra_maior 4 8) 8)
(check-equal? (encontra_maior -4 -2) -2)))

;; define encontra_maior
(define (encontra_maior x y )
  ( if ( >= x y)
       x
       y
  ))

;; executando os testes
(define (executa-testes . testes)
(run-tests (test-suite "Todos os testes" testes))
(void))
(executa-testes encontra_maior-testes)

(encontra_maior 454 1231231)
