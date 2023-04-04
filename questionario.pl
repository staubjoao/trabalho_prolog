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

print_list([]).
print_list([H|T]) :- write(H), write(', '), print_list(T).

read_string(String) :-
    read_line_to_codes(user_input, Codes),
    string_codes(String, Codes).

perguntar_sintomas :-
    open('respostas.txt', write, Arquivo),
    forall(formulario(Sintoma, Pergunta), (
        write(Pergunta), write('(s ou n): '),
        read_string(Resposta),
        string_codes(Resposta, [Codigo|_]),
        (Codigo =:= 115 ->
            write(Arquivo, Sintoma)
            % precisa saber se é o ultimo ou não, para caso não for colocar um ', ' se não coloca '\n'
            % (Sintoma \== last(Sintomas) -> write(Arquivo, ','), write('teste'), nl ; true)
        ;
            true
        )
    )),
    close(Arquivo).


ler_sintomas_arquivo(Arquivo, Sintomas) :-
    open(Arquivo, read, Stream),
    ler_sintomas_arquivo(Stream, [], Sintomas),
    close(Stream).

ler_sintomas_arquivo(Stream, Sintomas, SintomasFinal) :-
    read_line_to_codes(Stream, Line),
    (Line = end_of_file ->
        SintomasFinal = Sintomas
    ;
        atom_codes(Atom, Line),
        atomic_list_concat(SintomaList, ',', Atom),
        maplist(atom_string, SintomaList, SintomaStrings),
        ler_sintomas_arquivo(Stream, [SintomaStrings|Sintomas], SintomasFinal)
    ).

imprime_formulario() :-
    perguntar_sintomas.
    % ler_sintomas_arquivo('respostas.txt', Sintomas),
    % flatten(ListaSintomas, Sintomas),
    % write('Os seus sintomas são: '), print_list(Sintomas), nl.