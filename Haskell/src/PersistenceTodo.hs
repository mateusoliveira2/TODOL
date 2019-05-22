module PersistenceTodo where

import System.IO
import System.IO.Unsafe
import System.Directory

alteraLista :: [t] -> Int -> t -> [t]
alteraLista lista indice elemento = (take (indice - 1) lista) ++ [elemento] ++ (drop indice lista)

persistirTodo :: String -> String -> String -> String -> String -> Int -> IO()
persistirTodo nomeProjeto nome descricao responsavel status previsao = do
    let nomeDiretorio = "Projects/" ++ nomeProjeto ++ "/"
    let conteudoTodo = nome ++ "\n" ++ descricao ++ "\n" ++ responsavel ++ "\n" ++ status ++ "\n" ++ (show previsao) ++ "\n"
    
    delete <- doesFileExist (nomeDiretorio ++ nome ++ ".txt")
    if delete then removeFile (nomeDiretorio ++ nome ++ ".txt") else putStr ""

    writeFile (nomeDiretorio ++ nome ++ ".txt") (conteudoTodo)
 
setNomeTodo :: String -> String -> String -> IO()
setNomeTodo nomeProjeto nome novoNome = do
    let diretorio = "Projects/" ++ nomeProjeto ++ "/"
    let infos = alteraLista (returnTodo nomeProjeto nome) 1 novoNome
    persistirTodo nomeProjeto (infos !! 0) (infos !! 1) (infos !! 2) (infos !! 3) (read (infos !! 4))

setDescricaoTodo :: String -> String -> String -> [String]
setDescricaoTodo nomeProjeto nome descricao = do
    alteraLista (returnTodo nomeProjeto nome) 2 descricao
    
setResponsavelTodo :: String -> String -> String -> IO()
setResponsavelTodo nomeProjeto nome responsavel = do
    let infos = alteraLista (returnTodo nomeProjeto nome) 3 responsavel
    persistirTodo nomeProjeto (infos !! 0) (infos !! 1) (infos !! 2) (infos !! 3) (read (infos !! 4))

setStatusTodo :: String -> String -> String -> IO()
setStatusTodo nomeProjeto nome status = do
    let infos = alteraLista (returnTodo nomeProjeto nome) 4 status
    persistirTodo nomeProjeto (infos !! 0) (infos !! 1) (infos !! 2) (infos !! 3) (read (infos !! 4))

readTodo :: String -> String -> String
readTodo nomeProjeto nomeTodo = do
    let nome = ("Projects/" ++ nomeProjeto ++ "/" ++ nomeTodo)
    unsafePerformIO $ readFile (nome ++ ".txt")

returnTodo :: String -> String -> [String]
returnTodo nomeProjeto nome = do
    let contents = readTodo nomeProjeto nome
    lines contents