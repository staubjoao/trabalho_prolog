% probabilidade base para cada doença
probBase_celiaca(0.01).
probBase_sili(0.05).
probBase_alergia_alimentar(0.02).
probBase_intoxicacao_alimentar(0.10).
probBase_gastroenterite_viral(0.15).
probBase_dumping(0.03).
probBase_gastroparesia(0.01).
probBase_ulcera_peptica(0.05).
probBase_pancreatite(0.02).
probBase_infeccao_trato_urinario(0.01).

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
sintoma_intoxicacao_alimentar(febril).
sintoma_intoxicacao_alimentar(fraqueza).
sintoma_intoxicacao_alimentar(dor_de_cabeca).
sintoma_intoxicacao_alimentar(mal_estar_geral).

% sintomas de gastroenterite viral
sintoma_gastroenterite_viral(diarreia).
sintoma_gastroenterite_viral(vomito).
sintoma_gastroenterite_viral(nausea).
sintoma_gastroenterite_viral(dor_abdominal).
sintoma_gastroenterite_viral(febre).
sintoma_gastroenterite_viral(mal_estar_geral).
sintoma_gastroenterite_viral(dor_muscular).
sintoma_gastroenterite_viral(fadiga).

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