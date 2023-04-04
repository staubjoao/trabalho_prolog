
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

probabilidade_celiaca(Sintomas, ProbFinal) :-
    probBase_celiaca(P),
    probabilidade_doenca(sintoma_celiaca, Sintomas, P , ProbFinal).

probabilidade_sili(Sintomas, ProbFinal) :-
    probBase_sili(P),
    probabilidade_doenca(sintoma_sili, Sintomas, P , ProbFinal).

probabilidade_alergia_alimentar(Sintomas, ProbFinal) :-
    probBase_alergia_alimentar(P),
    probabilidade_doenca(sintoma_alergia_alimentar, Sintomas, P , ProbFinal).

probabilidade_intoxicacao_alimentar(Sintomas, ProbFinal) :-
    probBase_intoxicacao_alimentar(P),
    probabilidade_doenca(sintoma_intoxicacao_alimentar, Sintomas, P , ProbFinal).

probabilidade_gastroentrite_viral(Sintomas, ProbFinal) :-
    probBase_gastroenterite_viral(P),
    probabilidade_doenca(sintoma_gastroenterite_viral, Sintomas, P, ProbFinal).

probabilidade_dumping(Sintomas, ProbFinal) :-
    probBase_dumping(P),
    probabilidade_doenca(sintoma_sindrome_de_dumping, Sintomas, P , ProbFinal).

probabilidade_gastroparesia(Sintomas, ProbFinal) :-
    probBase_gastroparesia(P),
    probabilidade_doenca(probBase_gastroparesia, Sintomas, P, ProbFinal).

probabilidade_ulcera_peptica(Sintomas, ProbFinal) :-
    probBase_ulcera_peptica(P),
    probabilidade_doenca(sintoma_ulcera_peptica Sintomas, P , ProbFinal).

probabilidade_pancreatite(Sintomas, ProbFinal) :-
    probBase_pancreatite(P),
    probabilidade_doenca(sintoma_pancreatite, Sintomas, P , ProbFinal).

probabilidade_infeccao_trato_urinario(Sintomas, ProbFinal) :-
    probBase_infeccao_trato_urinario(P),
    probabilidade_doenca(sintoma_infeccao_do_trato_urinario, Sintomas, P , ProbFinal).

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
    write(Stream, ').'),
    nl(Stream),
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


% Criação do arquivo pacientes, caso ele não exista
criar_arquivo_pacientes :-
    exists_file('pacientes.txt'),
    write('O arquivo pacientes.txt ja existe.'), nl.
    
criar_arquivo_pacientes :-
    \+ exists_file('pacientes.txt'),
    tell('pacientes.txt'),
    write(':- dynamic paciente/4.'), nl,
    told.
    

main :-
    set_prolog_flag(encoding, utf8),
    criar_arquivo_pacientes,
    consult('fatos.pl'),
    consult('questionario.pl'),
    menu.

% consulta/alteração/inclusão/exclusão de pacientes
menu :-
    writeln('1 - Consultar pacientes'),
    writeln('2 - Incluir paciente'),
    writeln('3 - Alterar paciente'),
    writeln('4 - Excluir paciente'),
    writeln('5 - Sair'),
    write('Opcao: '),
    read(Opcao),
    nl,
    opcao_menu(Opcao).

opcao_menu(1) :-
    consult('pacientes.txt'),
    findall(paciente(Nome, Idade, Peso, Altura), paciente(Nome, Idade, Peso, Altura), Pacientes),
    (
        Pacientes = []
        -> write('Não há pacientes cadastrados.'), 
        nl
        ;  write('Pacientes cadastrados:'), 
        nl,
           listar_pacientes(Pacientes)
    ),
    menu.


opcao_menu(2):-
    write('Nome do novo paciente: '),
    read(Nome),
    write('Idade do novo paciente: '),
    read(Idade),
    write('Peso do novo paciente: '),
    read(Peso),
    write('Altura do novo paciente: '),
    read(Altura),
    escrever_arquivo_prolog('pacientes.txt', Nome, Idade, Peso, Altura),
    writeln('Novo paciente adicionado com sucesso!'),
    nl,
    menu.

opcao_menu(3):-
    % editar_paciente_arquivo(pacientes, Nome, NovaIdade, NovoPeso, NovaAltura),
    menu.

opcao_menu(4):-
    write('Digite o nome do paciente: '),
    read(Nome),
    excluir_paciente(Nome),
    menu.

opcao_menu(5):-
     write('Saindo...').

excluir_paciente(Nome) :-
    apagar_paciente(Nome),
    write('Paciente removido com sucesso.'), nl.

excluir_paciente(Nome) :-
    \+ apagar_paciente(Nome),
    write('Paciente não existe.'), nl.

apagar_paciente(Nome) :-
    % Lê os dados do arquivo
    retractall(paciente(_,_,_,_)),
    consult('pacientes.txt'),
    retract(paciente(Nome, _, _, _)),
    % Abre o arquivo para escrita
    tell('pacientes.txt'),
    write(':- dynamic paciente/4.'), nl,
    % Escreve todas as cláusulas novamente, exceto a cláusula do paciente excluído
    (paciente(N, I, P, A), N \= Nome, write('paciente('), write(N), write(','), write(I), write(','), write(P), write(','), write(A), write(').'), nl, fail ; true),
    told.

listar_pacientes([]):-
    nl.

listar_pacientes([paciente(Nome, Idade, Peso, Altura)|Resto]) :-
    write(Nome), write(', '),
    write(Idade), write(' anos, '),
    write(Peso), write(' kg, '),
    write(Altura), write(' cm'), nl,
    listar_pacientes(Resto).

% formulario():-
    % write('Você tem dor na área do abdômen? [s/n]'),

% func greff para apagar
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
%     write(Linha),
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