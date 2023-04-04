formulario(dor_abdominal, 'Você tem dor na área do abdômen?').
formulario(inchaco_abdominal, 'Você notou inchaço ou aumento do tamanho da sua barriga?').
formulario(diarreia, 'Você está tendo fezes soltas e frequentes?').
% formulario(constipacao, 'Você está tendo dificuldade para evacuar ou suas fezes estão duras e secas?').
% formulario(vomito, 'Você está vomitando ou teve vontade de vomitar recentemente?').
% formulario(fadiga, 'Você se sente cansado ou sem energia?').
% formulario(mucosidade_nas_fezes, 'Você notou muco ou secreção nas suas fezes?').
% formulario(sensacao_de_incompleto_esvaziamento_do_intestino, 'Você sente que o seu intestino não está vazio mesmo após evacuar?').
% formulario(ansiedade, 'Você tem sentido ansiedade?').
% formulario(depressao, 'Você tem sentido tristeza, desânimo ou falta de interesse em atividades que antes lhe agradavam?').
% formulario(coceira_na_boca, 'Você sente coceira na boca ou garganta?').
% formulario(coceira_na_garganta, 'Você sente coceira na garganta?').
% formulario(urinacao_frequente, 'Você tem ido ao banheiro para urinar com mais frequência do que o normal?').
% formulario(dificuldade_respiratoria, 'Você está tendo dificuldade para respirar?').
% formulario(vermelhidao_na_pele, 'Você notou vermelhidão na sua pele?').
% formulario(inchaco_na_face, 'Você está com inchaço na sua face ou pescoço?').

% função para testes
print_list([]).
print_list([H|T]) :- write(H), write(', '), print_list(T).

read_string(String) :-
    read_line_to_codes(user_input, Codes),
    string_codes(String, Codes).

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

imprime_formulario(SintomasPaciente) :-
    sintomas(Sintomas),
    perguntas(Perguntas),
    perguntar_sintomas(Perguntas, Sintomas, SintomasPaciente).

probabilidades_doencas(Probabilidade) :-
    imprime_formulario(SintomasPaciente),

    probabilidade_celiaca(SintomasPaciente, P1),
    probabilidade_sili(SintomasPaciente, P2),
    probabilidade_alergia_alimentar(SintomasPaciente, P3),
    probabilidade_intoxicacao_alimentar(SintomasPaciente, P4),
    probabilidade_gastroentrite_viral(SintomasPaciente, P5),
    probabilidade_dumping(SintomasPaciente, P6),
    probabilidade_gastroparesia(SintomasPaciente, P7),
    probabilidade_ulcera_peptica(SintomasPaciente, P8),
    probabilidade_pancreatite(SintomasPaciente, P9),
    probabilidade_infeccao_trato_urinario(SintomasPaciente, P10),

    Probabilidade = [P1, P2, P3, P4, P5, P6, P7, P8, P9, P10].