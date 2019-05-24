module MainTodo where
    
import Util
import PersistenceTodo

editTodoName :: String -> String -> IO()
editTodoName projectName todoName = do
    putStrLn "Editar nome do ToDo"
    putStrLn ("Nome atual: " ++ todoName)
    
    putStrLn "Digite o novo nome: "
    newName <- getLine

    if(todoName == newName) then do
        putStrLn "\nOs nomes das ToDo's são iguais"
        putStrLn "Pressione a tecla Enter para voltar."
        getLine
        putStr ""
        mainTodo projectName todoName
    else do
        if  (newName++".txt") `elem` (returnAllTodosName projectName) then do
            putStrLn "\nToDo com este nome ja existe!\n\nEscolha outro nome\n\n"
            editTodoName projectName todoName
        else do
            setNomeTodo projectName todoName newName
            concludeScreen("Nome do ToDo atualizado")

        mainTodo projectName newName

editResponsible :: String -> String -> IO()
editResponsible projectName todoName = do
    putStrLn "Editar responsaveis do ToDo\n"
    putStrLn "Digite os novos responsaveis: "
    responsible <- getLine

    setResponsavelTodo projectName todoName responsible

    concludeScreen("Os responsaveis do ToDo foram atualizados")
    mainTodo projectName todoName

options :: String -> String
options choice
    | choice == "1" = "A fazer"
    | choice == "2" = "Em andamento"
    | otherwise = "Concluido"

editSituation :: String -> String -> IO()
editSituation projectName todoName = do
    clear   
    putStrLn "Editar situação do ToDo\n"
    putStrLn "1. A fazer"
    putStrLn "2. Em andamento"
    putStrLn "3. Concluido"
    putStrLn "Escolha: "

    choice <- getLine

    if (choice == "1") || (choice == "2") || (choice == "3") then do
        setStatusTodo projectName todoName (options choice)
        concludeScreen("Status do ToDo atualizado")
        mainTodo projectName todoName
    else do
        putStrLn "Por favor, digite uma opção válida!"
        editSituation projectName todoName

todoConcluido :: String -> String -> Bool
todoConcluido projectName todoName = (getStatus	projectName todoName) == "Concluido"

editHours :: String -> String -> IO()
editHours projectName todoName
    | todoConcluido projectName todoName = do 
        concludeScreen("Este ToDo já foi concluido")
        mainTodo projectName todoName
    | otherwise = do
        putStrLn "Quantas horas deseja cadastrar?"
        horasCadastradas <- getLine
        addHorasTrabalhadas projectName todoName (read horasCadastradas :: Int)
        concludeScreen("Horas cadastradas")
        mainTodo projectName todoName


mainTodo :: String -> String -> IO()
mainTodo projectName todoName = do 
	clear
	putStrLn ("===== " ++ todoName ++ " ===== \n")

	exibeToDo projectName todoName

	putStrLn "1. Editar Nome"
	putStrLn "2. Editar Responsaveis"
	putStrLn "3. Editar Situacao"
	putStrLn "4. Cadastrar horas"
	putStrLn "0. Sair\n"
	putStrLn ("Escolha: ")
	choice <- getLine

	case choice of
		"1" -> editTodoName projectName todoName
		"2" -> editResponsible projectName todoName
		"3" -> editSituation projectName todoName
		"4" -> editHours projectName todoName
		"0" -> putStrLn ""
