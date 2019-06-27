persistirTodo(NomeProjeto, Nome, Descricao, Responsavel, Status, Previsao, Horas) :- 
    string_concat("Projects/", NomeProjeto, Auxiliar1),
    string_concat(Auxiliar1, "/", Auxiliar2),
    string_concat(Auxiliar2, Nome, Caminho),

    open(Caminho, write, P),
    
    write(P, Nome), write(P, "\n"),
    write(P, Descricao), write(P, "\n"),
    write(P, Responsavel), write(P, "\n"),
    write(P, Status), write(P, "\n"),
    write(P, Previsao), write(P, "\n"),
    write(P, Horas), write(P, "\n"),

    close(P).
