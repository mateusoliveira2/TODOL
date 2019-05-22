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
alteraLista lista indice elemento = do
    parte1 <- take (indice - 1)
    parte2 <- drop indice
    parte1 ++ elemento ++ parte2 

persistirProjeto :: String -> String -> String -> String -> Int -> String -> IO()
persistirProjeto nome descricao responsavel status previsao deta = do
    criaDiretorio "../Projects"
    let nomeDiretorio = "../Projects/" ++ nome ++ "/"
    let conteudoProjeto = nome ++ "\n" ++ descricao ++ "\n" ++ responsavel ++ "\n" ++ status ++ "\n" ++ (show previsao) ++ "\n" ++ deta ++ "\n"
    criaDiretorio (nomeDiretorio)
    writeFile (nomeDiretorio ++ nome ++ ".txt") (conteudoProjeto)
 
setNomeProjeto :: String -> String -> IO()
setNomeProjeto nome novoNome = do
    let diretorioAntigo = "../Projects/" ++ nome ++ "/"
    let diretorioNovo = "../Projects/" ++ novoNome ++ "/"
    projeto <- returnProjeto nome
    lista <- alteraLista projeto 1 nome
    renameFile (diretorioAntigo ++ nome ++ ".txt") (diretorioAntigo ++ novoNome ++ ".txt")
    renameDirectory (diretorioAntigo) (diretorioNovo)

setDescricaoProjeto :: String -> String -> [String]
setDescricaoProjeto nome descricao = do
    projeto <- returnProjeto nome
    lista <- alteraLista projeto 2 descricao
    
setResponsavelProjeto :: String -> String -> [String]
setResponsavelProjeto nome responsavel = do
    projeto <- returnProjeto nome
    lista <- alteraLista projeto 3 responsavel

setStatusProjeto :: String -> String -> [String]
setStatusProjeto nome status = do
    projeto <- returnProjeto nome
    lista <- alteraLista projeto 4 status

setDataProjeto :: String -> String -> [String]
setDataProjeto nome deta = do
    projeto <- returnProjeto nome
    lista <- alteraLista projeto 6 status

returnProjeto :: String -> [String]
returnProjeto nomeProjeto = do
    let nome = "../Projects/" ++ nomeProjeto ++ "/" ++ nomeProjeto ++ ".txt"
    contents <- readFile nome
    lines contents
