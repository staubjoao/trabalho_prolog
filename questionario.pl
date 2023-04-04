formulario(dor_abdominal, 'Você tem dor na área do abdômen?').
formulario(inchaco_abdominal, 'Você notou inchaço ou aumento do tamanho da sua barriga?').
formulario(diarreia, 'Você está tendo fezes soltas e frequentes?').
formulario(constipacao, 'Você está tendo dificuldade para evacuar ou suas fezes estão duras e secas?').
formulario(vomito, 'Você está vomitando ou teve vontade de vomitar recentemente?').
formulario(fadiga, 'Você se sente cansado ou sem energia?').
formulario(mucosidade_nas_fezes, 'Você notou muco ou secreção nas suas fezes?').
formulario(sensacao_de_incompleto_esvaziamento_do_intestino, 'Você sente que o seu intestino não está vazio mesmo após evacuar?').
formulario(ansiedade, 'Você tem sentido ansiedade?').
formulario(depressao, 'Você tem sentido tristeza, desânimo ou falta de interesse em atividades que antes lhe agradavam?').
formulario(coceira_na_boca, 'Você sente coceira na boca ou garganta?').
formulario(coceira_na_garganta, 'Você sente coceira na garganta?').
formulario(urinacao_frequente, 'Você tem ido ao banheiro para urinar com mais frequência do que o normal?').
formulario(dificuldade_respiratoria, 'Você está tendo dificuldade para respirar?').
formulario(vermelhidao_na_pele, 'Você notou vermelhidão na sua pele?').
formulario(inchaco_na_face, 'Você está com inchaço na sua face ou pescoço?').

% função para testes
print_list([]).
print_list([H|T]) :- write(H), write(', '), print_list(T).

% imprime o formulario e coleta os sintomas que o paciente está sentindo
perguntar_sintomas([], [], []).
perguntar_sintomas([Pergunta | Perguntas], [Sintoma | Sintomas], [Sintoma | SintomasPaciente]) :-
    write(Pergunta), write('(s ou n): '),
    read_string(Resposta),
    string_codes(Resposta, [Codigo|_]),
    (Codigo =:= 115 ; Codigo =:= 83),
    perguntar_sintomas(Perguntas, Sintomas, SintomasPaciente).
perguntar_sintomas([_ | Perguntas], [_ | Sintomas], SintomasPaciente) :-
    perguntar_sintomas(Perguntas, Sintomas, SintomasPaciente).

sintomas(ListaSintomas) :- findall(Sintoma, formulario(Sintoma, _), ListaSintomas).
perguntas(ListaPerguntas) :- findall(Pergunta, formulario(_, Pergunta), ListaPerguntas).

imprime_formulario() :-
    sintomas(Sintomas),
    perguntas(Perguntas),
    perguntar_sintomas(Perguntas, Sintomas, SintomasPaciente),
    write('Os seus sintomas são: '), print_list(SintomasPaciente), nl.
