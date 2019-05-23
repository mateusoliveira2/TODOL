module Util where

import Data.Char
import PersistenceTodo

clear :: IO()
clear = putStrLn "\ESC[2J"

returnScreen :: IO()
returnScreen = putStrLn ""

concludeScreen :: String -> IO()
concludeScreen acao = do
    putStrLn(acao ++ " com sucesso! ")
    putStrLn("Digite qualquer tecla para sair! ")
    sair <- getLine
    returnScreen

exibeToDo :: String -> String -> IO()
exibeToDo projectName todoName = do
	let todo = returnTodo projectName todoName
	putStrLn ("┌────────────────────────────────────────────────")
	putStrLn ("│ Nome: " ++ (todo !! 0))
	putStrLn ("│ Descricao: " ++ (todo !! 1))
	putStrLn ("│ Responsavel: " ++ (todo !! 2))
	putStrLn ("│ Status:" ++ (todo !! 3))
	putStrLn ("│ Previsao de Conclusao: " ++ (todo !! 4)  ++ " hora(s)")
	putStrLn ("│ Horas Cadastradas: " ++ (todo !! 5)  ++ " hora(s)")
	putStrLn ("└────────────────────────────────────────────────\n\n")

exibeCadaToDo :: String -> [[String]] -> IO()
exibeCadaToDo projectName [] = concludeScreen("ToDos exibidos")
exibeCadaToDo projectName (toDo:resto)
	| projectName == (toDo!!0) = exibeCadaToDo projectName resto
	| otherwise = do
		exibeToDo projectName (toDo!!0)
		exibeCadaToDo projectName resto

searchMatchingSub :: [Char] -> [Char] -> Bool
searchMatchingSub [] [] = True
searchMatchingSub [] l = True
searchMatchingSub (a:ax) (b:bx) = (a == b) && searchMatchingSub ax bx

searchMatching :: [Char] -> [Char] -> Bool
searchMatching filter [] = False
searchMatching filter phrase
	| (length phrase < length filter) = False
	| (searchMatchingSub filter phrase == True) = True
	| otherwise = searchMatching filter (tail phrase)

toLowerStr :: String -> String
toLowerStr str = [ toLower c | c <- str]

filterByNameAllToDos :: String -> String -> [[String]]
filterByNameAllToDos projectName filterName = [x | x <- (returnAllTodosContent projectName), searchMatching (toLowerStr filterName) (toLowerStr (x !! 0))]

filterBySituationAllToDos :: String -> String -> [[String]]
filterBySituationAllToDos projectName filterSituation = [x | x <- (returnAllTodosContent projectName), searchMatching (toLowerStr filterSituation) (toLowerStr (x !! 3))]

filterByOwnerAllToDos :: String -> String -> [[String]]
filterByOwnerAllToDos projectName filterOwner = [x | x <- (returnAllTodosContent projectName), searchMatching (toLowerStr filterOwner) (toLowerStr (x !! 2)) ]
