module MainFilter where

import System.Exit
import Util

filterByName :: String -> IO()
filterByName projectName = do
    clear
    putStrLn "Digite o filtro de nome: "
    filterName <- getLine
    
    let filtroTodos = filterByNameAllToDos projectName filterName
    exibeCadaToDo projectName filtroTodos
    mainFilter projectName

filterBySituation :: String -> IO()
filterBySituation projectName = do
    
    clear
    putStrLn "Digite o filtro de situação: "
    putStrLn "1. A fazer"
    putStrLn "2. Em andamento"
    putStrLn "3. Concluido"
    putStrLn "Escolha: "
    choice <- getLine

    if (choice == "1") then do
      let filtroTodos = filterBySituationAllToDos projectName "A fazer"
      exibeCadaToDo projectName filtroTodos
      mainFilter projectName
    else if (choice == "2") then do
      let filtroTodos = filterBySituationAllToDos projectName "Em andamento"
      exibeCadaToDo projectName filtroTodos
      mainFilter projectName
    else if (choice == "3") then do
      let filtroTodos = filterBySituationAllToDos projectName "Concluido"
      exibeCadaToDo projectName filtroTodos
      mainFilter projectName
    else
      returnScreen

filterByOwner :: String -> IO()
filterByOwner projectName = do
    clear
    putStrLn "Digite o filtro de responsavel: "
    filterOwner <- getLine

    let filtroTodos = filterByOwnerAllToDos projectName filterOwner
    exibeCadaToDo projectName filtroTodos
    mainFilter projectName

mainFilter ::String -> IO()
mainFilter projectName = do 
    clear
    putStrLn ("Filtro de toDos do projeto " ++ projectName)
    putStrLn "1. Filtrar por nome"
    putStrLn "2. Filtrar por situacao"
    putStrLn "3. Filtrar por responsavel"
    putStrLn "0. Sair"
    putStrLn "Escolha: "
    choice <- getLine

    case choice of
               "1" -> filterByName projectName 
               "2" -> filterBySituation projectName
               "3" -> filterByOwner projectName
               "0" -> returnScreen
               _   -> mainFilter projectName
