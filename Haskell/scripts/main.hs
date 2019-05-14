module Main where

import System.Exit
import Util
import MainProject

receiverProjectsData :: IO()
receiverProjectsData = do
    putStrLn "Digite o nome do projeto: "
    name <- getLine

    putStrLn "Digite a descrição do projeto: "
    descricao <- getLine

    putStrLn "Digite os responsaveis pelo projeto: "
    responsaveis <- getLine

    putStrLn "Digite a previsao de termino (em dias): "
    previsao_termino <- getLine

    concludeScreen("cadastro ")
    main

selectProject :: IO()
selectProject = do
    -- listagem dos projetos
    putStrLn "Digite o nome do projeto que você deseja selecionar: "
    projectName <- getLine
    -- verificacao se existe
    mainProject projectName
    main

concludeProject :: IO()
concludeProject = do
    -- listagem dos projetos
    putStrLn "Digite o nome do projeto que você deseja concluir: "
    projectName <- getLine
    -- verificacao se existe
    main

main :: IO()
main = do 
    putStrLn "TODOL \n"
    putStrLn "1. Criar Projeto"
    putStrLn "2. Selecionar Projeto"
    putStrLn "3. Concluir projeto"
    putStrLn "0. Sair"
    putStrLn "Escolha: "
    choice <- getLine

    case choice of
        "1" -> receiverProjectsData
        "2" -> selectProject
        "3" -> concludeProject
        "0" -> exitWith (ExitFailure 44)