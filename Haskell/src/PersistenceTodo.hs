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
    writeFile (nomeDiretorio ++ nome ++ ".txt") (conteudoTodo)
 
setNomeTodo :: String -> String -> String -> IO()
setNomeTodo nomeProjeto nome novoNome = do
    -- alteraLista (returnProjeto nome) 1 nome
    let diretorio = "Projects/" ++ nomeProjeto ++ "/"
    renameFile (diretorio ++ nome ++ ".txt") (diretorio ++ novoNome ++ ".txt")

setDescricaoTodo :: String -> String -> String -> [String]
setDescricaoTodo nomeProjeto nome descricao = do
    alteraLista (returnTodo nomeProjeto nome) 2 descricao
    
setResponsavelTodo :: String -> String -> String -> [String]
setResponsavelTodo nomeProjeto nome responsavel = do
    alteraLista (returnTodo nomeProjeto nome) 3 responsavel

setStatusTodo :: String -> String -> String -> [String]
setStatusTodo nomeProjeto nome status = do
    alteraLista (returnTodo nomeProjeto nome) 4 status

readTodo :: String -> String -> String
readTodo nomeProjeto nomeTodo = do
    let nome = ("Projects/" ++ nomeProjeto ++ "/" ++ nomeTodo)
    unsafePerformIO $ readFile (nome ++ ".txt")

returnTodo :: String -> String -> [String]
returnTodo nomeProjeto nome = do
    let contents = readTodo nomeProjeto nome
    lines contents