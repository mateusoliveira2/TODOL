module PersistenceTodo where

import System.IO
import System.IO.Unsafe
import System.Directory
import Data.List.Split

alteraLista :: [t] -> Int -> t -> [t]
alteraLista lista indice elemento = (take (indice - 1) lista) ++ [elemento] ++ (drop indice lista)

removeArquivo :: String -> IO()
removeArquivo nome = do
    success <- doesFileExist nome
    
    if success 
    then removeFile nome
    else return ()


persistirTodo :: String -> String -> String -> String -> String -> Int -> IO()
persistirTodo nomeProjeto nome descricao responsavel status previsao = do
    let nomeDiretorio = "Projects/" ++ nomeProjeto ++ "/"
    let conteudoTodo = nome ++ "\n" ++ descricao ++ "\n" ++ responsavel ++ "\n" ++ status ++ "\n" ++ (show previsao) ++ "\n"
    
    removeArquivo (nomeDiretorio ++ nome ++ ".txt") 
    
    writeFile (nomeDiretorio ++ nome ++ ".txt") (conteudoTodo)

setNomeTodo :: String -> String -> String -> IO()
setNomeTodo nomeProjeto nome novoNome = do
    let infos = alteraLista (returnTodo nomeProjeto nome) 1 novoNome
    persistirTodo nomeProjeto (infos !! 0) (infos !! 1) (infos !! 2) (infos !! 3) (read (infos !! 4))

setDescricaoTodo :: String -> String -> String -> IO()
setDescricaoTodo nomeProjeto nome descricao = do
    let infos = alteraLista (returnTodo nomeProjeto nome) 2 descricao
    persistirTodo nomeProjeto (infos !! 0) (infos !! 1) (infos !! 2) (infos !! 3) (read (infos !! 4))

setResponsavelTodo :: String -> String -> String -> IO()
setResponsavelTodo nomeProjeto nome responsavel = do
    let infos = alteraLista (returnTodo nomeProjeto nome) 3 responsavel
    persistirTodo nomeProjeto (infos !! 0) (infos !! 1) (infos !! 2) (infos !! 3) (read (infos !! 4))

setStatusTodo :: String -> String -> String -> IO()
setStatusTodo nomeProjeto nome status = do
    let infos = alteraLista (returnTodo nomeProjeto nome) 4 status
    persistirTodo nomeProjeto (infos !! 0) (infos !! 1) (infos !! 2) (infos !! 3) (read (infos !! 4))

readTodo :: String -> String -> IO String
readTodo nomeProjeto nomeTodo = do
    let nome = ("Projects/" ++ nomeProjeto ++ "/" ++ nomeTodo)
    readFile (nome ++ ".txt")

returnTodo :: String -> String -> [String]
returnTodo nomeProjeto nome = do
    let contents = unsafePerformIO $ readTodo nomeProjeto nome
    lines contents

returnAllTodosName :: String -> [String]
returnAllTodosName projectName = do
    let contents = unsafePerformIO $ getDirectoryContents ("Projects/" ++ projectName)
    x <- contents
    lines x

returnAllTodosContent :: String -> [[String]]
returnAllTodosContent projectName = do
    let lista = returnAllTodosName projectName
    adicionaLista projectName lista

teste :: String -> String
teste x = (splitOn "." x) !! 0

adicionaLista :: String -> [String] -> [[String]]
adicionaLista projectName [] = []
adicionaLista projectName (x:xs)
    |x == "." || x == ".." || x == projectName = adicionaLista projectName xs
    |xs == [] = [(returnTodo projectName (teste x))]
    |otherwise = (returnTodo projectName (teste x)):(adicionaLista projectName xs)