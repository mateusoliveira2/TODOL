module Main where

import System.Exit
import Util
import MainProject
import PersistenceProject

receiverProjectsData :: IO()
receiverProjectsData = do
    putStrLn "Digite o nome do projeto: "
    name <- getLine

    putStrLn "Digite a descrição do projeto: "
    description <- getLine

    putStrLn "Digite os responsaveis pelo projeto: "
    responsible <- getLine

    putStrLn "Digite a previsao de termino (em horas): "
    duration <- getLine

    let status = "A fazer"
    
    -- testando envio de info da ToDo para a persistencia.
    -- lembrar de passar a duracao como (read duration), para haver
    -- a conversão para Int
    -- testeProj name description responsible (read duration)

    persistirProjeto name description responsible status (read duration)

    concludeScreen("cadastro")
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
    clear
    putStrLn "TODOL \n"
    putStrLn "1. Criar Projeto"
    putStrLn "2. Selecionar Projeto"
    putStrLn "3. Concluir projeto"
    putStrLn "0. Sair"
    putStr "Escolha: \n"
    choice <- getLine

    case choice of
        "1" -> receiverProjectsData
        "2" -> selectProject
        "3" -> concludeProject
        "0" -> returnScreen
        _   -> main
