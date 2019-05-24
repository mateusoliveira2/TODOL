module MainProject where

import System.Exit
import MainTodo
import MainFilter
import Util
import PersistenceTodo
import PersistenceProject
import System.Directory

exibeProject :: String -> IO()
exibeProject projectName = do
	let project = returnProjeto projectName
	putStrLn ("┌────────────────────────────────────────────────")
	putStrLn ("│ Nome: " ++ (project !! 0))
	putStrLn ("│ Descrição: " ++ (project !! 1))
	putStrLn ("│ Responsável: " ++ (project !! 2))
	putStrLn ("│ Status: " ++ (project !! 3))
	putStrLn ("│ Estimativa: " ++ (project !! 4) ++ " hora(s)")
	putStrLn ("└────────────────────────────────────────────────\n\n")

rmvProjectName :: String -> [String] -> [String]
rmvProjectName projectName list
	| length(list) == 0 = []
	| (list!!0) == (projectName ++ ".txt") = rmvProjectName projectName (tail list)
	| otherwise = [(list!!0)] ++ (rmvProjectName projectName (tail list))

listTodos :: String -> IO()
listTodos projectName = do
    putStrLn "\nToDo's existentes: "
    if length( returnAllTodosName projectName ) > 2 then 
        listNames (rmvProjectName projectName (returnAllTodosName projectName)) 1 4
    else
        putStrLn "- Não há ToDo's cadastrados para esse projeto.\n"

editToDo :: String -> IO()
editToDo projectName = do
    clear
    listTodos projectName

    putStrLn "Digite o nome da ToDo: "
    todoName <- getLine
    
    toDoExists <- doesFileExist ("Projects/" ++ projectName ++ "/" ++ todoName ++ ".txt")

    if toDoExists && todoName /= projectName then
        mainTodo projectName todoName
    else do
        putStrLn "\nO toDo selecionado não existe!"
        putStrLn "Pressione a tecla Enter para voltar."
        getLine
        putStr ""

    mainProject projectName
    
filterTodo :: String -> IO()
filterTodo projectName = do
    mainFilter projectName
    mainProject projectName

createToDo :: String -> IO()
createToDo projectName = do
    putStrLn("Criar ToDo\n")
    putStrLn("Digite o nome da ToDo: ")
    name <- getLine

    putStrLn("Descricao da ToDo: ")
    description <- getLine

    putStrLn("Digite o nome dos responsaveis: ")
    responsible <- getLine

    putStrLn("Digite a duração da ToDo (em horas): ")
    duration <- getLine

    let status = "A fazer";

    if projectName == name 
        then do
            clear
            putStrLn "O nome da ToDo não pode ser o mesmo nome do projeto!"
            putStrLn "Por favor, pense em um nome válido e tente novamente.\n"
            createToDo projectName
        else do
            if  (name++".txt") `elem` (returnAllTodosName projectName) then do
                putStrLn "\nToDo com este nome ja existe!\n\nEscolha outro nome\n\n"
                createToDo projectName
            else do
                persistirTodo projectName name description responsible status duration "0"
                concludeScreen("ToDo cadastrada")            
            
    mainProject projectName

editProjectName :: String -> IO()
editProjectName projectName = do
    putStrLn "Editar nome do Projeto"
    putStrLn ("Nome atual: " ++ projectName)
    putStrLn "Digite o novo nome: "

    newName <- getLine

    if(projectName == newName) then do
		putStrLn "\nOs nomes dos Projetos são iguais"
		putStrLn "Pressione a tecla Enter para voltar."
		getLine
		putStr ""
	else do
        if  newName `elem` returnAllProjectsName then do
            putStrLn "\n\nProjeto ja existe!\n\nEscolha outro nome\n"
        else do
            setNomeProjeto projectName newName
            concludeScreen("Nome do Projeto atualizado")
    
    mainProject projectName

gerarRelatorio :: String -> IO()
gerarRelatorio projectName = do 
	clear
	putStrLn ("===== Relatório de " ++ projectName ++ " ===== \n")
	concludeScreen("relatório gerado")
	mainProject projectName

-- exibeCadaToDo :: String -> [[String]] -> IO()
-- exibeCadaToDo projectName [] = concludeScreen("ToDos exibidos")
-- exibeCadaToDo projectName (toDo:resto)
	-- | projectName == (toDo!!0) = exibeCadaToDo projectName resto
	-- | otherwise = do
		-- exibeToDo projectName (toDo!!0)
		-- exibeCadaToDo projectName resto

exibeToDos :: String -> IO()
exibeToDos projectName = do
	clear
	putStrLn ("===== ToDos de " ++ projectName ++ " ===== \n")
	let todos = returnAllTodosContent projectName
	exibeCadaToDo projectName todos
	mainProject projectName

mainProject :: String -> IO()

mainProject projectName
	| projectName == "." || projectName == ".." || projectName == "" = do returnScreen
	| otherwise = do
		clear
		
		exibeProject projectName

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
			"3" -> exibeToDos projectName
			"4" -> filterTodo projectName
			"5" -> gerarRelatorio projectName
			"6" -> editProjectName projectName
			"0" -> returnScreen
			_   -> mainProject projectName
