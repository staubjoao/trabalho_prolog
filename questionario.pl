formulario(dor_abdominal, 'Você tem dor na área do abdômen?').
formulario(inchaco_abdominal, 'Você notou inchaço ou aumento do tamanho da sua barriga?').
formulario(diarreia, 'Você está tendo fezes soltas e frequentes?').
formulario(constipacao, 'Você está tendo dificuldade para evacuar ou suas fezes estão duras e secas?').
formulario(nausea, 'Você sente enjoo ou tem vontade de vomitar?').
formulario(vomito, 'Você está vomitando ou teve vontade de vomitar recentemente?').
formulario(perda_de_peso, 'Você perdeu peso sem tentar?').
formulario(fadiga, 'Você se sente cansado ou sem energia?').
formulario(anemia, 'Você foi diagnosticado com anemia recentemente?').
formulario(dores_nas_articulacoes, 'Você tem dores nas suas articulações?').
formulario(erupcoes_cutaneas, 'Você notou manchas ou erupções na sua pele?').
formulario(irritabilidade, 'Você está facilmente irritado ou com mau humor?').
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
formulario(febre, 'Você tem tido febre?').
formulario(fraqueza, 'Você tem sentido fraqueza geral no corpo?').
formulario(dor_de_cabeca, 'Você tem sentido dores de cabeça?').
formulario(mal_estar_geral, 'Você tem sentido um mal-estar geral no corpo?').
formulario(dor_muscular, 'Você tem sentido dores musculares?').
formulario(sudorese, 'Você tem suado excessivamente?').
formulario(palpitacao, 'Você tem sentido batimentos cardíacos acelerados ou irregulares?').
formulario(tontura, 'Você tem sentido tontura ou vertigem?').
formulario(desmaio, 'Você já desmaiou ou perdeu a consciência recentemente?').
formulario(pirose, 'Você sente uma sensação de queimação no estômago ou no peito após comer?').
formulario(saciedade_precoce, 'Você sente que fica satisfeito após comer quantidades menores de comida do que o normal?').
formulario(distensao_abdominal, 'Você sente desconforto ou sensação de inchaço na região abdominal após comer?').
formulario(queimacao, 'Você sente uma sensação de queimação na região abdominal ou na garganta?').
formulario(perda_de_apetite, 'Você tem tido menos apetite do que o normal?').
formulario(pancreatite_cronica, 'Você foi diagnosticado com pancreatite crônica recentemente?').
formulario(diabetes, 'Você foi diagnosticado com diabetes recentemente?').
formulario(dor_ao_urinar, 'Você sente dor ou desconforto ao urinar?').
formulario(aumento_da_frequencia_urinaria, 'Você tem ido ao banheiro para urinar com mais frequência do que o normal?').
formulario(urgencia_urinaria, 'Você tem sentido vontade urgente de urinar e às vezes não consegue segurar?').
formulario(sangue_na_urina, 'Você notou sangue na sua urina?').


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


    Aux = [(P1, celiaca), (P2, sili), (P3, alergia_alimentar), (P4, intoxicacao_alimentar), (P5, gastroenterite_viral), (P6, dumping), (P7, gastroparesia), (P8, ulcera_peptica), (P9, pancreatite), (P10, infeccao_trato_urinario)],
    sort(Aux, Aux2),
    reverse(Aux2, Probabilidade).

reverse([], []).
reverse([H|T], R) :- reverse(T, RT), append(RT, [H], R).