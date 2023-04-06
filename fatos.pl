:- begin_tests(doencas).
    test(gastroenterite_viral, R == 0.15) :- probabilidade_doenca(sintoma_gastroenterite_viral, [diarreia, vomito, nausea, dor_abdominal, febre, mal_estar_geral, dor_muscular, fadiga], 0.15, R).
    test(celiaca, R == 0.003333333333333333) :- probabilidade_doenca(sintoma_celiaca, [nausea, vomito, anemia, diarreia], 0.01, R).
    test(sili, R == 0.05) :-  probabilidade_doenca(sintoma_sili, [dor_abdominal, inchaco_abdominal, constipacao, diarreia, mucosidade_nas_fezes, sensacao_de_incompleto_esvaziamento_do_intestino, fadiga, ansiedade, depressao], 0.05, R).
    test(alergia_alimentar, R == 0.02) :- probabilidade_doenca(sintoma_alergia_alimentar, [coceira_na_boca, coceira_na_garganta, urinacao_frequente, diarreia, dificuldade_respiratoria, vomito, vermelhidao_na_pele, inchaco_na_face], 0.02, R).
    test(intoxicacao_alimentar, R == 0.10) :- probabilidade_doenca(sintoma_intoxicacao_alimentar,  [diarreia, vomito, dor_abdominal, nausea, febre, fraqueza, dor_de_cabeca, mal_estar_geral], 0.10, R).
    test(dumping, R == 0.03) :-  probabilidade_doenca(sintoma_sindrome_de_dumping, [sudorese, palpitacao, tontura, desmaio, diarreia, nausea, vomito, dor_abdominal, pirose], 0.03, R).
    test(gastroparesia, R == 0.01) :- probabilidade_doenca(sintoma_gastroparesia, [saciedade_precoce, nausea, vomito, dor_abdominal, perda_de_peso, diarreia, constipacao, distensao_abdominal], 0.01, R).
    test(ulcera_peptica, R == 0.05) :- probabilidade_doenca(sintoma_ulcera_peptica, [dor_abdominal, queimacao, nausea, vomito, perda_de_apetite, perda_de_peso], 0.05, R).
    test(pancreatite, R == 0.02) :-  probabilidade_doenca(sintoma_pancreatite, [dor_abdominal, nausea, vomito, perda_de_apetite, pancreatite_cronica, diabetes], 0.02, R).
    test(infeccao_trato_urinario, R == 0.01) :- probabilidade_doenca(sintoma_infeccao_do_trato_urinario, [dor_ao_urinar, aumento_da_frequencia_urinaria, urgencia_urinaria, sangue_na_urina, dor_abdominal, febre], 0.01, R).
:- end_tests(doencas). 

% probabilidade base para cada doença
probBase_gastroenterite_viral(0.65).
probBase_intoxicacao_alimentar(0.60).
probBase_ulcera_peptica(0.55).
probBase_sili(0.55).
probBase_dumping(0.53).
probBase_pancreatite(0.52).
probBase_alergia_alimentar(0.52).
probBase_infeccao_trato_urinario(0.51).
probBase_celiaca(0.51).
probBase_gastroparesia(0.51).

% sintomas de gastroenterite viral
sintoma_gastroenterite_viral(diarreia).
sintoma_gastroenterite_viral(vomito).
sintoma_gastroenterite_viral(nausea).
sintoma_gastroenterite_viral(dor_abdominal).
sintoma_gastroenterite_viral(febre).
sintoma_gastroenterite_viral(mal_estar_geral).
sintoma_gastroenterite_viral(dor_muscular).
sintoma_gastroenterite_viral(fadiga).

% sintomas da doença celíaca
sintoma_celiaca(dor_abdominal).
sintoma_celiaca(inchaco_abdominal).
sintoma_celiaca(diarreia).
sintoma_celiaca(constipacao).
sintoma_celiaca(nausea).
sintoma_celiaca(vomito).
sintoma_celiaca(perda_de_peso).
sintoma_celiaca(fadiga).
sintoma_celiaca(anemia).
sintoma_celiaca(dores_nas_articulacoes).
sintoma_celiaca(erupcoes_cutaneas).
sintoma_celiaca(irritabilidade).

% sintomas da síndrome do intestino irritável
sintoma_sili(dor_abdominal).
sintoma_sili(inchaco_abdominal).
sintoma_sili(constipacao).
sintoma_sili(diarreia).
sintoma_sili(mucosidade_nas_fezes).
sintoma_sili(sensacao_de_incompleto_esvaziamento_do_intestino).
sintoma_sili(fadiga).
sintoma_sili(ansiedade).
sintoma_sili(depressao).

% sintomas de alergias alimentares
sintoma_alergia_alimentar(coceira_na_boca).
sintoma_alergia_alimentar(coceira_na_garganta).
sintoma_alergia_alimentar(urinacao_frequente).
sintoma_alergia_alimentar(diarreia).
sintoma_alergia_alimentar(dificuldade_respiratoria).
sintoma_alergia_alimentar(vomito).
sintoma_alergia_alimentar(vermelhidao_na_pele).
sintoma_alergia_alimentar(inchaco_na_face).

% sintomas de intoxicação alimentar
sintoma_intoxicacao_alimentar(diarreia).
sintoma_intoxicacao_alimentar(vomito).
sintoma_intoxicacao_alimentar(dor_abdominal).
sintoma_intoxicacao_alimentar(nausea).
sintoma_intoxicacao_alimentar(febre).
sintoma_intoxicacao_alimentar(fraqueza).
sintoma_intoxicacao_alimentar(dor_de_cabeca).
sintoma_intoxicacao_alimentar(mal_estar_geral).


% Síndrome de dumping
sintoma_sindrome_de_dumping(sudorese).
sintoma_sindrome_de_dumping(palpitacao).
sintoma_sindrome_de_dumping(tontura).
sintoma_sindrome_de_dumping(desmaio).
sintoma_sindrome_de_dumping(diarreia).
sintoma_sindrome_de_dumping(nausea).
sintoma_sindrome_de_dumping(vomito).
sintoma_sindrome_de_dumping(dor_abdominal).
sintoma_sindrome_de_dumping(pirose).

% Gastroparesia
sintoma_gastroparesia(saciedade_precoce).
sintoma_gastroparesia(nausea).
sintoma_gastroparesia(vomito).
sintoma_gastroparesia(dor_abdominal).
sintoma_gastroparesia(perda_de_peso).
sintoma_gastroparesia(diarreia).
sintoma_gastroparesia(constipacao).
sintoma_gastroparesia(distensao_abdominal).

% Úlcera péptica
sintoma_ulcera_peptica(dor_abdominal).
sintoma_ulcera_peptica(queimacao).
sintoma_ulcera_peptica(nausea).
sintoma_ulcera_peptica(vomito).
sintoma_ulcera_peptica(perda_de_apetite).
sintoma_ulcera_peptica(perda_de_peso).

% Pancreatite
sintoma_pancreatite(dor_abdominal).
sintoma_pancreatite(nausea).
sintoma_pancreatite(vomito).
sintoma_pancreatite(perda_de_apetite).
sintoma_pancreatite(pancreatite_cronica).
sintoma_pancreatite(diabetes).

% Infecção do trato urinário
sintoma_infeccao_do_trato_urinario(dor_ao_urinar).
sintoma_infeccao_do_trato_urinario(aumento_da_frequencia_urinaria).
sintoma_infeccao_do_trato_urinario(urgencia_urinaria).
sintoma_infeccao_do_trato_urinario(sangue_na_urina).
sintoma_infeccao_do_trato_urinario(dor_abdominal).
sintoma_infeccao_do_trato_urinario(febre).

doenca(celiaca).
doenca(sili).
doenca(alergia_alimentar).
doenca(intoxicacao_alimentar).
doenca(gastroenterite_viral).
doenca(dumping).
doenca(gastroparesia).
doenca(ulcera_peptica).
doenca(pancreatite).
doenca(infeccao_trato_urinario).

imprime_doenca(X):- X = gastroenterite_viral, write('Gastroenterite viral').
imprime_doenca(X):- X = intoxicacao_alimentar, write('Intoxicação alimentar').
imprime_doenca(X):- X = ulcera_peptica, write('Úlcera péptica').
imprime_doenca(X):- X = sili, write('Síndrome do intestino irritável').
imprime_doenca(X):- X = dumping, write('Síndrome de dumping').
imprime_doenca(X):- X = pancreatite, write('Pancreatite').
imprime_doenca(X):- X = alergia_alimentar, write('Alergias alimentares').
imprime_doenca(X):- X = infeccao_trato_urinario, write('Infecção do trato urinário').
imprime_doenca(X):- X = celiaca, write('Doença celíaca').
imprime_doenca(X):- X = gastroparesia, write('Gastroparesia').

sintomas_do_paciente(Paciente, Doenca, SintomasDoencaPaciente, NaoSintomasDoencaPaciente) :-
    bagof(Sintoma, call(Doenca, Sintoma), SintomasDaDoenca),
    subtract(SintomasDaDoenca, Paciente, NaoSintomasDoencaPaciente),
    findall(Sintoma, (member(Sintoma, Paciente), call(Doenca, Sintoma)), SintomasDoencaPaciente).

verifica_sintomas(Doenca, Paciente, SintomasDoencaPaciente, NaoSintomasDoencaPaciente):- 
    Doenca = gastroenterite_viral, 
    sintomas_do_paciente(Paciente, sintoma_gastroenterite_viral, SintomasDoencaPaciente, NaoSintomasDoencaPaciente).
verifica_sintomas(Doenca, Paciente, SintomasDoencaPaciente, NaoSintomasDoencaPaciente):- 
    Doenca = intoxicacao_alimentar, 
    sintomas_do_paciente(Paciente, sintoma_intoxicacao_alimentar, SintomasDoencaPaciente, NaoSintomasDoencaPaciente).
verifica_sintomas(Doenca, Paciente, SintomasDoencaPaciente, NaoSintomasDoencaPaciente):- 
    Doenca = ulcera_peptica, 
    sintomas_do_paciente(Paciente, sintoma_ulcera_peptica, SintomasDoencaPaciente, NaoSintomasDoencaPaciente).
verifica_sintomas(Doenca, Paciente, SintomasDoencaPaciente, NaoSintomasDoencaPaciente):- 
    Doenca = sili, 
    sintomas_do_paciente(Paciente, sintoma_sili, SintomasDoencaPaciente, NaoSintomasDoencaPaciente).
verifica_sintomas(Doenca, Paciente, SintomasDoencaPaciente, NaoSintomasDoencaPaciente):- 
    Doenca = dumping, 
    sintomas_do_paciente(Paciente, sintoma_dumping, SintomasDoencaPaciente, NaoSintomasDoencaPaciente).
verifica_sintomas(Doenca, Paciente, SintomasDoencaPaciente, NaoSintomasDoencaPaciente):- 
    Doenca = pancreatite, 
    sintomas_do_paciente(Paciente, sintoma_pancreatite, SintomasDoencaPaciente, NaoSintomasDoencaPaciente).
verifica_sintomas(Doenca, Paciente, SintomasDoencaPaciente, NaoSintomasDoencaPaciente):- 
    Doenca = alergia_alimentar, 
    sintomas_do_paciente(Paciente, sintoma_alergia_alimentar, SintomasDoencaPaciente, NaoSintomasDoencaPaciente).
verifica_sintomas(Doenca, Paciente, SintomasDoencaPaciente, NaoSintomasDoencaPaciente):- 
    Doenca = infeccao_trato_urinario, 
    sintomas_do_paciente(Paciente, sintoma_infeccao_trato_urinario, SintomasDoencaPaciente, NaoSintomasDoencaPaciente).
verifica_sintomas(Doenca, Paciente, SintomasDoencaPaciente, NaoSintomasDoencaPaciente):- 
    Doenca = celiaca, 
    sintomas_do_paciente(Paciente, sintoma_celiaca, SintomasDoencaPaciente, NaoSintomasDoencaPaciente).
verifica_sintomas(Doenca, Paciente, SintomasDoencaPaciente, NaoSintomasDoencaPaciente):- 
    Doenca = gastroparesia, 
    sintomas_do_paciente(Paciente, sintoma_gastroparesia, SintomasDoencaPaciente, NaoSintomasDoencaPaciente).

imprime_sintomas([]) :- write('\n').
imprime_sintomas([H]) :- imrpime_sintoma(H), write('\n').
imprime_sintomas([H|T]) :- imrpime_sintoma(H), write(', '), imprime_sintomas(T).

imrpime_sintoma(X):- X = dor_abdominal, write('Dor abdominal').
imrpime_sintoma(X):- X = inchaco_abdominal, write('Inchaço abdominal').
imrpime_sintoma(X):- X = diarreia, write('Diarreia').
imrpime_sintoma(X):- X = constipacao, write('Constipação').
imrpime_sintoma(X):- X = nausea, write('Náusea').
imrpime_sintoma(X):- X = vomito, write('Vômito').
imrpime_sintoma(X):- X = perda_de_peso, write('Perda de peso').
imrpime_sintoma(X):- X = fadiga, write('Fadiga').
imrpime_sintoma(X):- X = anemia, write('Anemia').
imrpime_sintoma(X):- X = dores_nas_articulacoes, write('Dores nas articulações').
imrpime_sintoma(X):- X = erupcoes_cutaneas, write('Erupções cutâneas').
imrpime_sintoma(X):- X = irritabilidade, write('Irritabilidade').
imrpime_sintoma(X):- X = mucosidade_nas_fezes, write('Muco nas fezes').
imrpime_sintoma(X):- X = sensacao_de_incompleto_esvaziamento_do_intestino, write('Sensação de incompleto esvaziamento do intestino').
imrpime_sintoma(X):- X = ansiedade, write('Ansiedade').
imrpime_sintoma(X):- X = depressao, write('Depressão').
imrpime_sintoma(X):- X = coceira_na_boca, write('Coceira na boca').
imrpime_sintoma(X):- X = coceira_na_garganta, write('Coceira na garganta').
imrpime_sintoma(X):- X = urinacao_frequente, write('Urinação frequente').
imrpime_sintoma(X):- X = dificuldade_respiratoria, write('Dificuldade respiratória').
imrpime_sintoma(X):- X = vermelhidao_na_pele, write('Vermelhidão na pele').
imrpime_sintoma(X):- X = inchaco_na_face, write('Inchaço na face').
imrpime_sintoma(X):- X = fraqueza, write('Fraqueza').
imrpime_sintoma(X):- X = dor_de_cabeca, write('Dor de cabeça').
imrpime_sintoma(X):- X = mal_estar_geral, write('Mal-estar geral').
imrpime_sintoma(X):- X = febre, write('Febre').
imrpime_sintoma(X):- X = dor_muscular, write('Dor muscular').
imrpime_sintoma(X):- X = sudorese, write('Sudorese').
imrpime_sintoma(X):- X = palpitacao, write('Palpitação').
imrpime_sintoma(X):- X = tontura, write('Tontura').
imrpime_sintoma(X):- X = desmaio, write('Desmaio').
imrpime_sintoma(X):- X = pirose, write('Azia').
imrpime_sintoma(X):- X = saciedade_precoce, write('Saciedade precoce').
imrpime_sintoma(X):- X = distensao_abdominal, write('Distensão abdominal').
imrpime_sintoma(X):- X = queimacao, write('Queimação').
imrpime_sintoma(X):- X = perda_de_apetite, write('Perda de apetite').
imrpime_sintoma(X):- X = pancreatite_cronica, write('Pancreatite crônica').
imrpime_sintoma(X):- X = diabetes, write('Diabetes').
imrpime_sintoma(X):- X = dor_ao_urinar, write('Dor ao urinar').
imrpime_sintoma(X):- X = aumento_da_frequencia_urinaria, write('Aumento da frequência urinária').
imrpime_sintoma(X):- X = urgencia_urinaria, write('Urgência urinária').
imrpime_sintoma(X):- X = sangue_na_urina, write('Sangue na urina').