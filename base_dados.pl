% probabilidade base para cada doença
ProbBase_celiaca(0.01).
ProbBase_sili(0.05).
ProbBase_alergia_alimentar(0.02).
ProbBase_intoxicacao_alimentar(0.10).
ProbBase_gastroenterite_viral(0.15).
ProbBase_dumping(0.03).
ProbBase_gastroparesia(0.01).
ProbBase_ulcera_peptica(0.05).
ProbBase_pancreatite(0.02).
ProbBase_infeccao_trato_urinario(0.01).

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
sintoma_sii(dor_abdominal).
sintoma_sii(inchaco_abdominal).
sintoma_sii(constipacao).
sintoma_sii(diarreia).
sintoma_sii(mucosidade_nas_fezes).
sintoma_sii(sensacao_de_incompleto_esvaziamento_do_intestino).
sintoma_sii(fadiga).
sintoma_sii(ansiedade).
sintoma_sii(depressao).

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

% conta a quantidade de sintomas associados a uma doença
num_sintomas_doenca(Doenca, Count) :-
    findall(Sintoma, call(Doenca, Sintoma), ListaSintomas),
    length(ListaSintomas, Count).

% probabilidade do paciente estar com a doença, usando a regra de Bayes
probabilidade_doenca(Doenca, Sintomas, ProbBase, ProbFinal) :-
    num_sintomas_doenca(Doenca, NumSintomas),
    findall(Sintoma, call(Doenca, Sintoma), ListaSintomasDoenca),
    intersection(ListaSintomasDoenca, Sintomas, SintomasComuns),
    length(SintomasComuns, NumSintomasComuns),
    ProbFinal is (NumSintomasComuns/NumSintomas) * ProbBase.

% Arquivos
escrever_arquivo_prolog(NomeArquivo, Nome, Idade, Peso, Altura) :-
    open(NomeArquivo, append, Stream),
    write(Stream, 'paciente('),
    write(Stream, Nome),
    write(Stream, ','),
    write(Stream, Idade),
    write(Stream, ','),
    write(Stream, Peso),
    write(Stream, ','),
    write(Stream, Altura),
    write(Stream, ').\n'),
    close(Stream).

% Predicado para ler o arquivo de texto e armazenar as informações dos pacientes em uma lista
ler_arquivo(NomeArquivo, Pacientes) :-
    open(NomeArquivo, read, Arquivo),
    ler_linhas(Arquivo, Pacientes),
    close(Arquivo).

% Predicado auxiliar para ler as linhas do arquivo e criar a lista de pacientes
ler_linhas(Arquivo, []) :-
    at_end_of_stream(Arquivo).
ler_linhas(Arquivo, [Paciente|Pacientes]) :-
    read(Arquivo, Paciente),
    ler_linhas(Arquivo, Pacientes).


% Predicado para buscar os atributos de um paciente dado o seu nome
buscar_paciente(Nome, [paciente(Nome, Idade, Peso, Altura)|_], Idade, Peso, Altura).
buscar_paciente(Nome, [_|Resto], Idade, Peso, Altura) :-
    buscar_paciente(Nome, Resto, Idade, Peso, Altura).

% consulta/alteração/inclusão/exclusão de pacientes
menu :-
    writeln('1 - Consultar pacientes'),
    writeln('2 - Incluir paciente'),
    writeln('3 - Alterar paciente'),
    writeln('4 - Excluir paciente'),
    writeln('5 - Sair'),
    write('Opcao: '),
    read(Opcao),
    opcao_menu(Opcao).

opcao_menu(1):-
    ler_arquivo(pacientes, Pacientes),
    writeln(Pacientes).

opcao_menu(2):-
    write('Nome do novo paciente: '),
    read(Nome),
    write('Idade do novo paciente: '),
    read(Idade),
    write('Peso do novo paciente: '),
    read(Peso),
    write('Altura do novo paciente: '),
    read(Altura),
    escrever_arquivo_prolog(pacientes, Nome, Idade, Peso, Altura),
    writeln('Novo paciente adicionado com sucesso!').

opcao_menu(3):-
    write('OII').

opcao_menu(4):-
    write('OII').

opcao_menu(5):-
     write('Saindo...').

% apagar_paciente(Nome) :-
%     % Abrir o arquivo original para leitura
%     open('pacientes', read, ArquivoOriginal),
%     % Criar um arquivo temporário para escrita
%     open('pacientes_temp', write, ArquivoTemp),
%     % Ler cada linha do arquivo original e verificar se ela contém o paciente a ser excluído
%     apagar_paciente_aux(Nome, ArquivoOriginal, ArquivoTemp, Encontrado),
%     % Fechar os arquivos original e temporário
%     close(ArquivoOriginal),
%     close(ArquivoTemp),
%     % Se o paciente não foi encontrado, não renomear o arquivo temporário
%     (Encontrado ->
%         % Apagar o arquivo original e renomear o arquivo temporário para o nome do arquivo original
%         delete_file('pacientes'),
%         rename_file('pacientes_temp', 'pacientes')
%     ;
%         % Apagar o arquivo temporário
%         delete_file('pacientes_temp')
%     ).

% apagar_paciente_aux(Nome, ArquivoOriginal, ArquivoTemp, Encontrado) :-
%     % Ler a próxima linha do arquivo original
%     read_line_to_codes(ArquivoOriginal, Linha),
%     % Se a linha não for vazia (EOF), processá-la
%     (Linha \= end_of_file ->
%         % Converter a linha em formato de string
%         atom_codes(AtomLinha, Linha),
%         % Transformar a string em termo Prolog
%         term_to_atom(Paciente, AtomLinha),
%         % Verificar se o termo contém o paciente a ser excluído
%         (Paciente = paciente(Nome, _, _, _) ->
%             % Se o termo contém o paciente a ser excluído, marcar como encontrado e não copiar a linha para o arquivo temporário
%             Encontrado = true
%         ;
%             % Se o termo não contém o paciente a ser excluído, copiar a linha para o arquivo temporário
%             write(ArquivoTemp, Linha),
%             write(ArquivoTemp, '\n')
%         ),
%         % Chamar recursivamente a função para processar a próxima linha
%         apagar_paciente_aux(Nome, ArquivoOriginal, ArquivoTemp, Encontrado)
%     ;
%         % Se a linha for vazia (EOF), terminar o processamento
%         Encontrado = false
%     ).



