module MainFilter where

import System.Exit
import Util

filterByName :: String -> IO()
filterByName projectName = do
    
    clear
    putStrLn "Digite o filtro de nome: "
    filterName <- getLine

    filterByNameAllToDos projectName filterName
    mainFilter projectName

filterBySituation :: String -> IO()
filterBySituation projectName = do
    
    clear
    putStrLn "Digite o filtro de situação: "
    putStrLn "1. A fazer"
    putStrLn "2. Em andamento"
    putStrLn "3. Concluido"
    putStr "Escolha: "

    choice <- getLine

    case choice of
               "1" -> filterBySituationAllToDos projectName "A fazer"
               "2" -> filterBySituationAllToDos projectName "Em andamento"
               "3" -> filterBySituationAllToDos projectName "Concluido"
    mainFilter projectName

filterByOwner :: String -> IO()
filterByOwner projectName = do
    
    clear
    putStrLn "Digite o filtro de responsavel: "
    filterOwner <- getLine

    filterByOwnerAllToDos projectName filterOwner
    mainFilter projectName

mainFilter ::String -> IO()
mainFilter projectName = do 
    clear
    putStrLn ("Filtro de toDos do projeto " ++ projectName)
    putStrLn "1. Filtrar por nome"
    putStrLn "2. Filtrar por situacao"
    putStrLn "3. Filtrar por responsavel"
    putStrLn "0. Sair\n"
    putStr "Escolha: "

    choice <- getLine

    case choice of
               "1" -> filterByName projectName 
               "2" -> filterBySituation projectName
               "3" -> filterByOwner projectName
               "0" -> returnScreen
               _   -> mainFilter projectName
