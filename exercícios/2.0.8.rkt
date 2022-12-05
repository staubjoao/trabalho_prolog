#lang racket
(require rackunit)
(require rackunit/text-ui)

;; 2 numeros (ponto) -> numero
;; calculo da distancia do ponto até a origem

(define dist_origem-testes
(test-suite
"distancia até a origem"
(check-equal? (dist_origem -12 9) 15)))

;; define quadrado
(define (quadrado x)
  (* x x) )

;; define dist_origem
(define (dist_origem Xa Ya)
  (sqrt (+ (quadrado(- Xa 0 )) (quadrado(- Ya 0 ))))
  )

;; executando os testes
(define (executa-testes . testes)
(run-tests (test-suite "Todos os testes" testes))
(void))
(executa-testes dist_origem-testes)
                  