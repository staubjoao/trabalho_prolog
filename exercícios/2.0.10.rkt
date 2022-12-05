#lang racket
(require rackunit)
(require rackunit/text-ui)

;; 1 numeros -> string
;; verificar o grau de obesidade

(define imc-testes
(test-suite
"calculando grau de obesidade"
(check-equal? (imc 26) "sobrepeso")
(check-equal? (imc 31) "obesidade grau II")
(check-equal? (imc 37) "obesidade grau III")
(check-equal? (imc 45) "obesidade grau IV")
))


;; define imc
(define (imc x)
  (cond
   [(and(>= x 25) (<= x 29.9)) "sobrepeso"]
   [(and(>= x 30) (<= x 34.9)) "obesidade grau II"]
   [(and(>= x 35) (<= x 39.9)) "obesidade grau III"]
   [(>= x 40) "obesidade grau IV"]))


;; executando os testes
(define (executa-testes . testes)
(run-tests (test-suite "Todos os testes" testes))
(void))
(executa-testes imc-testes)
