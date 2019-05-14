module MainTodo where
import Util

editTodoName :: String -> String -> IO()
editTodoName projectName todoName = do
    putStrLn "Editar nome do ToDo"
    putStrLn ("Nome atual: " ++ todoName)
    putStrLn "Digite o novo nome: "
    newName <- getLine
    --pegar o nome de vdd
    if("name" == newName) then
        putStrLn "Os nomes de ToDos são iguais"
    else
        putStrLn "Ok"
    -- setar nome do projeto
    concludeScreen("Nome do ToDo atualizado")
    

editResponsible :: String -> String -> IO()
editResponsible projectName todoName = do
    putStrLn "Editar responsaveis do ToDo\n"
    putStrLn "Digite os novos responsaveis: "
    responsible <- getLine

    -- setar responsavel
    concludeScreen("Responsaveis do ToDo atualizado")

editSituation :: String -> String -> IO()
editSituation projectName todoName = do
    putStrLn "Editar situação do ToDo\n"
    putStrLn "1. A fazer"
    putStrLn "2. Em andamento"
    putStrLn "3. Concluido"
    putStrLn "Escolha: "

    responsible <- getLine
    -- setar situacao
    concludeScreen("Status do ToDo atualizado")
    putStrLn ""

mainTodo :: String -> String -> IO()
mainTodo projectName todoName = do 
    putStrLn ("===== " ++ todoName ++ " ===== \n")
    putStrLn "1. Editar Nome"
    putStrLn "2. Editar Responsaveis"
    putStrLn "3. Editar Situacao"
    putStrLn "0. Sair\n"
    putStrLn ("Escolha: ")
    choice <- getLine

    case choice of
        "1" -> editTodoName projectName todoName
        "2" -> editResponsible projectName todoName
        "3" -> editSituation projectName todoName
        "0" -> putStrLn "ok"
    putStrLn ""