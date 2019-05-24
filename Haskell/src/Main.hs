module Main where

import System.Exit
import Util
import MainProject
import PersistenceProject
import System.Directory

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

    if  name `elem` returnAllProjectsName then do
        putStrLn "\n\nProjeto ja existe!\n\nEscolha outro nome\n"
    else do
        -- lembrar de passar a duracao como (read duration), para haver a conversão para Int
        persistirProjeto name description responsible status (read duration)
        concludeScreen("cadastro")

    main

listNames :: [String] -> Int -> IO()
listNames list index = do
    if length(list) > 0 then do
        if (list!!0) /= "." && (list!!0) /= ".." then do
            putStrLn ( (show index) ++ ". " ++ (list!!0) )
            listNames (tail list) (index+1)
        else listNames (tail list) index
    else putStrLn "" 

listProjects :: IO()
listProjects = do
    putStrLn "\nProjetos existentes: "
    if length( returnAllProjectsName ) > 2 then 
        listNames returnAllProjectsName 1
    else
        putStrLn "- Não há projetos cadastrados.\n"

selectProject :: IO()
selectProject = do
    listProjects

    putStrLn "Digite o nome do projeto que você deseja selecionar: "
    projectName <- getLine
    
    projectExists <- doesDirectoryExist ("Projects/" ++ projectName)

    if projectExists then
        mainProject projectName
    else do
        putStrLn "\nO projeto selecionado não existe!"
        putStrLn "Pressione a tecla Enter para voltar."
        getLine
        putStr ""

    main

concludeProject :: IO()
concludeProject = do
    listProjects

    putStrLn "Digite o nome do projeto que você deseja concluir: "
    projectName <- getLine
    
    projectExists <- doesDirectoryExist ("Projects/" ++ projectName)

    if projectExists then do
        setStatusProjeto projectName "Concluido"
        putStrLn "Projeto concluído com sucesso!"
    else
        putStrLn "\nO projeto selecionado não existe!"

    putStrLn "\nPressione a tecla Enter para voltar."
    getLine

    main

main :: IO()
main = do
    criaDiretorio ("Projects")
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
