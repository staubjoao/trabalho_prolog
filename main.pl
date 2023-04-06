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

% calculo da probabilidade por doença
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
    probabilidade_doenca(sintoma_gastroparesia, Sintomas, P, ProbFinal).

probabilidade_ulcera_peptica(Sintomas, ProbFinal) :-
    probBase_ulcera_peptica(P),
    probabilidade_doenca(sintoma_ulcera_peptica, Sintomas, P , ProbFinal).

probabilidade_pancreatite(Sintomas, ProbFinal) :-
    probBase_pancreatite(P),
    probabilidade_doenca(sintoma_pancreatite, Sintomas, P , ProbFinal).

probabilidade_infeccao_trato_urinario(Sintomas, ProbFinal) :-
    probBase_infeccao_trato_urinario(P),
    probabilidade_doenca(sintoma_infeccao_do_trato_urinario, Sintomas, P , ProbFinal).

% escreve no arquivo
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
    write('O arquivo pacientes.txt já existe.').
    
criar_arquivo_pacientes :-
    \+ exists_file('pacientes.txt'),
    tell('pacientes.txt'),
    write(':- dynamic paciente/4.'), nl,
    told.

% função main, ela fica responsável por fazer a leitura dos outros arquivos
main :-
    criar_arquivo_pacientes, nl,
    consult('fatos.pl'),
    consult('questionario.pl'),
    menu.

% consulta/alteração/inclusão/exclusão de pacientes
menu :-
    writeln('1 - Consultar pacientes'),
    writeln('2 - Incluir paciente'),
    writeln('3 - Alterar paciente'),
    writeln('4 - Excluir paciente'),
    writeln('5 - Diagnóstico'),
    writeln('6 - Sair'),
    write('Opcao: '),
    read(Opcao),
    nl,
    opcao_menu(Opcao).

opcao_menu(1) :-
    retractall(paciente(_,_,_,_)),
    consult('pacientes.txt'),
    findall(paciente(Nome, Idade, Peso, Altura), paciente(Nome, Idade, Peso, Altura), Pacientes),
    (
        Pacientes = []
        -> 
            write('Não há pacientes cadastrados.'), nlgit, a
        ;  
            write('Pacientes cadastrados:'), nl, listar_pacientes(Pacientes)
    ),
    menu.


opcao_menu(2):-
    nl,
    write('Nome do novo paciente: '),
    read(Nome),
    write('Idade do novo paciente: '),
    read(Idade),
    write('Peso em kg do novo paciente: '),
    read(Peso),
    write('Altura em cm do novo paciente: '),
    read(Altura),
    escrever_arquivo_prolog('pacientes.txt', Nome, Idade, Peso, Altura),
    writeln('Novo paciente adicionado com sucesso!'),
    nl,
    menu.

opcao_menu(3):-
    write('Nome do paciente: '),
    read(Nome),
    editar_paciente_arquivo(Nome),
    menu.

opcao_menu(4):-
    write('Digite o nome do paciente: '),
    read(Nome),
    excluir_paciente(Nome),
    menu.

opcao_menu(5):-
    write('O resultado do protótipo são apenas informativo, com isso, o paciente deve consultar um médico para obter um diagnóstico correto e preciso.'), nl, nl,
    probabilidades_doencas(Probabilidade, SintomasPaciente),
    nl, write('Resultados: '), nl,
    imprimir_probabilidades(Probabilidade),
    nl, write('É importante ressaltar mais uma vez que o resultado do protótipo são apenas informativo, com isso, o paciente deve consultar um médico para obter um diagnóstico correto e preciso.'), nl,
    nth0(0, Probabilidade, Primeiro),
    Primeiro = (_, X),
    verifica_sintomas(X, SintomasPaciente, SintomasDoencaPaciente, NaoSintomasDoencaPaciente),
    write('O paciente apresentou mais probabilidade de ter a seguinte doença: '), imprime_doenca(X), nl,
    write('Com os seguintes sintomas: '), imprime_sintomas(SintomasDoencaPaciente),
    write('Porém o paciente não apresentou os seguintes sintomas: '), imprime_sintomas(NaoSintomasDoencaPaciente), nl,
    main.

opcao_menu(6):-
    write('Saindo...'),
    halt.

imprimir_probabilidades(Probabilidade) :-
    maplist(imprimir_tupla, Probabilidade).

imprimir_tupla((X,Y)) :-
    imprime_doenca(Y), write(': '), format('~2f', X * 100), write('%'), nl.

editar_paciente(Nome) :-
    editar_paciente_arquivo(Nome),
    write('Paciente editado com sucesso.'), nl.

editar_paciente(Nome) :-
    \+ editar_paciente_arquivo(Nome),
    write('Paciente não existe.'), nl.

editar_paciente_arquivo(Nome) :-
    retractall(paciente(_,_,_,_)),
    consult('pacientes.txt'),
    paciente(Nome, _, _, _),
    retract(paciente(Nome, _, _, _)),
    write('A nova idade do paciente: '),
    read(NovaIdade),
    write('O novo peso do paciente: '),
    read(NovoPeso),
    write('A nova altura do paciente: '),
    read(NovaAltura),
    asserta(paciente(Nome, NovaIdade, NovoPeso, NovaAltura)),
    tell('pacientes.txt'),
    write(':- dynamic paciente/4.'), nl,
    (paciente(N, I, P, A),
    (
        N \= Nome, 
            write('paciente('), write(N), write(','), write(I), write(','), write(P), write(','), write(A), write(').'), nl, fail 
    )
    ; 
    write('paciente('), write(Nome), write(','), write(NovaIdade), write(','), write(NovoPeso), write(','), write(NovaAltura), write(').'), nl),
    told.

excluir_paciente(Nome) :-
    excluir_paciente_arquivo(Nome),
    write('Paciente removido com sucesso.'), nl.

excluir_paciente(Nome) :-
    \+ excluir_paciente_arquivo(Nome),
    write('Paciente não existe.'), nl.

excluir_paciente_arquivo(Nome) :-
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