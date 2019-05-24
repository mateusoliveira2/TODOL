module Util where

import Data.Char
import PersistenceTodo

clear :: IO()
clear = putStrLn "\ESC[2J"

returnScreen :: IO()
returnScreen = putStrLn ""

porcentagem :: Int -> Int -> Float
porcentagem a b
 	| a >= b = 100.0
	| otherwise = (fromIntegral a) / (fromIntegral b) * 100.0

repeatString :: String -> Int -> String
repeatString pal 0 = ""
repeatString pal n = pal ++ repeatString pal (n-1)

concludeScreen :: String -> IO()
concludeScreen acao = do
    putStrLn(acao ++ " com sucesso! ")
    putStrLn("Digite qualquer tecla para sair! ")
    sair <- getLine
    returnScreen

ehNumero :: String -> Bool
ehNumero "" = False
ehNumero (dig:res) = (isDigit dig) && ((res == "") || ehNumero res)

tiraPontos :: [String] -> [String]
tiraPontos [] = []
tiraPontos (a:as)
	| a == "." || a == ".." = tiraPontos as
	| otherwise = [a] ++ tiraPontos as

listNames :: [String] -> Int -> Int -> IO()
listNames list index ignore = do
    if length(list) > 0 then do
        if (list!!0) /= "." && (list!!0) /= ".." then do
            putStrLn ( (show index) ++ ". " ++ (take ( (length (list!!0)) - ignore ) (list!!0)) )
            listNames (tail list) (index+1) ignore
        else listNames (tail list) index ignore
    else putStrLn "" 

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

mapCadaToDo :: (String -> String -> IO()) -> String -> [[String]] -> IO()
mapCadaToDo func projectName [] = returnScreen
mapCadaToDo func projectName (toDo:resto) 
	| projectName == (toDo!!0) = mapCadaToDo func projectName resto 
	| otherwise = do
		func projectName (toDo!!0)
		mapCadaToDo func projectName resto 

exibeCadaToDo :: String -> [[String]] -> IO()
exibeCadaToDo projectName toDos = do 
	mapCadaToDo exibeToDo projectName toDos 
	concludeScreen "ToDos exibidos"

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
