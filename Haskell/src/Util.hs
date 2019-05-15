module Util where

clear :: IO()
clear = putStrLn "\n\n\n\n\n\n\n\n\n\n\n\n"

returnScreen :: IO()
returnScreen = putStrLn ""

concludeScreen :: String -> IO()
concludeScreen acao = do
    putStrLn(acao ++ " com sucesso! ")
    putStrLn("Digite qualquer tecla para sair! ")
    sair <- getLine
    returnScreen

searchMatching :: String -> String -> Bool
searchMatching filter phrase = True

filterByNameAllToDos :: String -> String -> IO()
filterByNameAllToDos projectName filterName = putStrLn ("Filtro por nome")

filterBySituationAllToDos :: String -> String -> IO()
filterBySituationAllToDos projectName filterSituation = putStrLn ("Filtro por situação")

filterByOwnerAllToDos :: String -> String -> IO()
filterByOwnerAllToDos projectName filterOwner = putStrLn ("Filtro por responsável")
