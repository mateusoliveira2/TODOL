module MainProject where
import System.Exit
import MainTodo
import MainFilter
import Util

editToDo :: String -> IO()
editToDo projectName = do
    clear
    -- mostrar todas ToDos
    putStrLn "Digite o nome da ToDo: "
    todoName <- getLine
    --verificar validade

    mainTodo projectName todoName
    
filterTodo :: String -> IO()
filterTodo projectName = mainFilter projectName

createToDo :: String -> IO()
createToDo projectName = do
    putStrLn("Criar ToDo\n")
    putStrLn("Digite o nome da ToDo: ")
    name <- getLine

    putStrLn("Descricao da ToDo: ")
    description <- getLine

    putStrLn("Digite o nome dos responsaveis: ")
    responsible <- getLine

    putStrLn("Digite a duração da ToDo (em dias): ")
    duration <- getLine

    concludeScreen("ToDo criado");

editProjectName :: String -> IO()
editProjectName projectName = do
    putStrLn "Editar nome do Projeto"
    putStrLn ("Nome atual: " ++ projectName)
    putStrLn "Digite o novo nome: "
    newName <- getLine
    --pegar o nome de vdd
    if(projectName == newName) then
        putStrLn "Os nomes dos Projetos são iguais"
    else
        putStrLn "Ok"
    -- setar nome do projeto
    concludeScreen("Nome do ToDo atualizado")

mainProject :: String -> IO()
mainProject projectName = do 
    clear
    putStrLn projectName 
    putStrLn "1. Criar ToDo"
    putStrLn "2. Editar ToDo"
    putStrLn "3. Listar ToDo"
    putStrLn "4. Filtrar ToDo"
    putStrLn "5. Gerar Relatorio"
    putStrLn "6. Editar Nome do Projeto"
    putStrLn "0. Sair"
    putStrLn "Escolha: "
    choice <- getLine

    case choice of
               "1" -> createToDo projectName
               "2" -> editToDo projectName
               "3" -> putStrLn "ok"
               "4" -> filterTodo projectName
               "5" -> putStrLn "ok"
               "6" -> editProjectName projectName
               "0" -> returnScreen
               _   -> mainProject projectName
