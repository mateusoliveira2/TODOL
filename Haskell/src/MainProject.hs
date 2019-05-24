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
	putStrLn ("│ Estimativa: " ++ (project !! 4) ++ " hora(s)")
	putStrLn ("└────────────────────────────────────────────────\n\n")

editToDo :: String -> IO()
editToDo projectName = do
    clear
    -- mostrar todas ToDos

    putStrLn "Digite o nome da ToDo: "
    todoName <- getLine
    
    toDoExists <- doesFileExist ("Projects/" ++ projectName ++ "/" ++ todoName ++ ".txt")

    if toDoExists then
        mainTodo projectName todoName
    else do
        putStrLn "\nO toDo selecionado não existe!"
        putStrLn "Pressione a tecla Enter para voltar."
        getLine
        putStr ""

    mainProject projectName
    
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

    putStrLn("Digite a duração da ToDo (em horas): ")
    duration <- getLine

    let status = "A fazer";

    if projectName == name 
        then do
            clear
            putStrLn "O nome da ToDo não pode ser o mesmo nome do projeto!"
            putStrLn "Por favor, pense em um nome válido e tente novamente.\n"
            createToDo projectName
        else persistirTodo projectName name description responsible status duration "0"

    concludeScreen("ToDo criado")
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
        putStrLn "Ok"
        setNomeProjeto projectName newName
        concludeScreen("Nome do Projeto atualizado")
    
    mainProject projectName


barraProgressoToDo :: Int -> Int -> Float -> String
barraProgressoToDo esperado cadastrado tam
	| esperado < cadastrado = "[" ++ (repeatString "+" (round tam)) ++ "]" ++ " 100%"
	| otherwise = do
		let valorReal = porcentagem cadastrado esperado
		let valor = round (valorReal / 100.0 * tam)
		let preenchidos = repeatString "+" valor
		let resto = repeatString "." ((round tam) - valor)
		"[" ++ preenchidos ++ resto ++ "] " ++ (show (round valorReal)) ++ "%"	
	
visaoGeralToDo :: String -> String -> IO()
visaoGeralToDo projectName todoName = do
	let todo = returnTodo projectName todoName
	let stringHoras = (todo!!5) ++ " hora(s) de " ++ (todo !! 4) ++ " hora(s) previstas"
	let stringNome = (todo !! 0)
	let stringEstado = if (todo!!3) == "Concluido" then " (Concluído)" else ""
	putStrLn ("┌" ++ (repeatString "─" 55))
	putStrLn ("│ " ++ stringNome ++ stringEstado)
	putStrLn ("│ " ++ stringHoras)
	putStrLn ("│ " ++ barraProgressoToDo (read (todo !! 4)) (read (todo !! 5)) 45)
	putStrLn ("└" ++ repeatString "─" 55)

somaHorasToDos :: [[String]] -> String -> Int -> Int
somaHorasToDos [] pn idx = 0
somaHorasToDos (toDo:resto) pn idx
	| toDo!!0 == pn = somaHorasToDos resto pn idx
	| otherwise = do
		let cadastrado = read (toDo!!idx) :: Int
		cadastrado + (somaHorasToDos resto pn idx)

stringPrevisao :: Int -> Int -> String
stringPrevisao real previsao
	| real < previsao = "menor do que o esperado!"
	| real > previsao = "mais do que o esperado!!"
	| otherwise = "exatamente como esperado."

visaoGeralProject :: String -> IO()
visaoGeralProject projectName = do
	let projeto = returnProjeto projectName
	let stringPrevisaoProjeto = "Projeto previsto para " ++ (projeto !! 4) ++ " hora(s)"
	let totalHorasPrevistas = somaHorasToDos (returnAllTodosContent projectName) projectName 4
	let totalHorasTrabalhadas = somaHorasToDos (returnAllTodosContent projectName) projectName 5
	let stringHorasPrevistas = (show totalHorasPrevistas) ++ " hora(s), "
	putStrLn ("┌" ++ repeatString "─" 60)
	putStrLn ("│ " ++ stringPrevisaoProjeto)
	putStrLn ("│ Estima-se pelos ToDos " ++ stringHorasPrevistas ++ (stringPrevisao totalHorasPrevistas (read (projeto!!4))))
	putStrLn ("│ Foram trabalhadas " ++ (show totalHorasTrabalhadas) ++ " hora(s)")
	putStrLn ("│ " ++ barraProgressoToDo (read (projeto !! 4)) (totalHorasTrabalhadas) 50)
	putStrLn ("└" ++ repeatString "─" 60)

gerarRelatorio :: String -> IO()
gerarRelatorio projectName = do 
	clear
	putStrLn ("===== Relatório de " ++ projectName ++ " ===== \n")

	putStrLn ("Resumo do progresso do Projeto")
	visaoGeralProject projectName
	
	putStrLn "\n"

	putStrLn ("Resumo do progresso dos ToDos:")
	mapCadaToDo visaoGeralToDo projectName (returnAllTodosContent projectName)
	

	concludeScreen("Relatório gerado")
	mainProject projectName

exibeToDos :: String -> IO()
exibeToDos projectName = do
	clear
	putStrLn ("===== ToDos de " ++ projectName ++ " ===== \n")
	let todos = returnAllTodosContent projectName
	exibeCadaToDo projectName todos
	mainProject projectName

mainProject :: String -> IO()
mainProject projectName = do 
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
