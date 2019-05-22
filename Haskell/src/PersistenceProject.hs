module PersistenceProject where

import System.IO
import System.Directory

testeProj :: String -> String -> String -> Int -> IO()
testeProj name description responsible duration = do
    putStrLn name
    putStrLn description
    putStrLn responsible

    -- lembrar de usar o show quando quiser printar inteiros
    putStrLn (show duration)

criaDiretorio :: String -> IO()
criaDiretorio nome = do
    success <- doesDirectoryExist nome
    
    if success 
    then return () 
    else createDirectory nome

-- Recebe uma lista, a posicao, e um novo elemento para a posicao.
alteraLista :: [t] -> Int -> t -> [t]
alteraLista lista indice elemento = (take (indice - 1) lista) ++ [elemento] ++ (drop indice lista)

persistirProjeto :: String -> String -> String -> String -> Int -> String -> IO()
persistirProjeto nome descricao responsavel status previsao deta = do
    criaDiretorio "../Projects"
    let nomeDiretorio = "../Projects/" ++ nome ++ "/"
    let conteudoProjeto = nome ++ "\n" ++ descricao ++ "\n" ++ responsavel ++ "\n" ++ status ++ "\n" ++ (show previsao) ++ "\n" ++ deta ++ "\n"
    criaDiretorio (nomeDiretorio)
    writeFile (nomeDiretorio ++ nome ++ ".txt") (conteudoProjeto)
 
setNomeProjeto :: String -> String -> IO()
setNomeProjeto nome novoNome = do
    -- alteraLista (returnProjeto nome) 1 nome
    let diretorioAntigo = "../Projects/" ++ nome ++ "/"
    let diretorioNovo = "../Projects/" ++ novoNome ++ "/"
    renameFile (diretorioAntigo ++ nome ++ ".txt") (diretorioAntigo ++ novoNome ++ ".txt")
    renameDirectory (diretorioAntigo) (diretorioNovo)

setDescricaoProjeto :: String -> String -> [String]
setDescricaoProjeto nome descricao = do
    alteraLista (returnProjeto nome) 2 descricao
    
setResponsavelProjeto :: String -> String -> [String]
setResponsavelProjeto nome responsavel = do
    alteraLista (returnProjeto nome) 3 responsavel

setStatusProjeto :: String -> String -> [String]
setStatusProjeto nome status = do
    alteraLista (returnProjeto nome) 4 status

setDataProjeto :: String -> String -> [String]
setDataProjeto nome deta = do
    alteraLista (returnProjeto nome) 6 deta

readProjeto :: String -> IO String
readProjeto nomeProjeto = do
    let nome = ("../Projects/" ++ nomeProjeto ++ "/" ++ nomeProjeto)
    readFile (nome ++ ".txt")

returnProjeto :: String -> [String]
returnProjeto nome = do
    contents <- readProjeto nome
    contents
