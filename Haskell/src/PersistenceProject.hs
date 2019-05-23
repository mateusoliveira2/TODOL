module PersistenceProject where

import System.IO
import System.IO.Unsafe
import System.Directory


criaDiretorio :: String -> IO()
criaDiretorio nome = do
    success <- doesDirectoryExist nome
    
    if success 
    then return () 
    else createDirectory nome

-- Recebe o nome de um arquivo e, se o arquivo existir, o exclui
removeArquivo :: String -> IO()
removeArquivo nome = do
    success <- doesFileExist nome
    
    if success 
    then removeFile nome
    else return ()


-- Recebe uma lista, a posicao, e um novo elemento para a posicao.
alteraLista :: [t] -> Int -> t -> [t]
alteraLista lista indice elemento = (take (indice - 1) lista) ++ [elemento] ++ (drop indice lista)

persistirProjeto :: String -> String -> String -> String -> Int -> IO()
persistirProjeto nome descricao responsavel status previsao = do
    criaDiretorio "Projects"
    let nomeDiretorio = "Projects/" ++ nome ++ "/"
    let conteudoProjeto = nome ++ "\n" ++ descricao ++ "\n" ++ responsavel ++ "\n" ++ status ++ "\n" ++ (show previsao) ++ "\n"
    
    criaDiretorio (nomeDiretorio)   
    
    removeArquivo (nomeDiretorio ++ nome ++ ".txt")
    
    writeFile (nomeDiretorio ++ nome ++ ".txt") (conteudoProjeto)
    
 
setNomeProjeto :: String -> String -> IO()
setNomeProjeto nome novoNome = do
    let infos = alteraLista (returnProjeto nome) 1 nome
    persistirProjeto (infos !! 0) (infos !! 1) (infos !! 2) (infos !! 3) (read (infos !! 4))
    let diretorioAntigo = "Projects/" ++ nome ++ "/"
    let diretorioNovo = "Projects/" ++ novoNome ++ "/"
    renameFile (diretorioAntigo ++ nome ++ ".txt") (diretorioAntigo ++ novoNome ++ ".txt")
    renameDirectory (diretorioAntigo) (diretorioNovo)

setDescricaoProjeto :: String -> String -> IO()
setDescricaoProjeto nome descricao = do
    let infos = alteraLista (returnProjeto nome) 2 descricao
    persistirProjeto (infos !! 0) (infos !! 1) (infos !! 2) (infos !! 3) (read (infos !! 4))
    
setResponsavelProjeto :: String -> String -> IO()
setResponsavelProjeto nome responsavel = do
    let infos = alteraLista (returnProjeto nome) 3 responsavel
    persistirProjeto (infos !! 0) (infos !! 1) (infos !! 2) (infos !! 3) (read (infos !! 4))

setStatusProjeto :: String -> String -> IO()
setStatusProjeto nome status = do
    let infos = alteraLista (returnProjeto nome) 4 status
    persistirProjeto (infos !! 0) (infos !! 1) (infos !! 2) (infos !! 3) (read (infos !! 4))

readProjeto :: String -> IO String
readProjeto nomeProjeto = do
    let nome = ("Projects/" ++ nomeProjeto ++ "/" ++ nomeProjeto)
    readFile (nome ++ ".txt")

returnProjeto :: String -> [String]
returnProjeto nome = do
    let contents = unsafePerformIO $ readProjeto nome
    lines contents

returnAllProjectsName :: [String]
returnAllProjectsName = do
    let contents = unsafePerformIO $ getDirectoryContents "Projects"
    x <- contents
    lines x


returnAllProjectsContent :: [[String]]
returnAllProjectsContent = do
    let lista = returnAllProjectsName
    adicionaLista lista

adicionaLista :: [String] -> [[String]]
adicionaLista (x:xs)
    |x == "." || x == ".." = adicionaLista xs
    |xs == [] = [(returnProjeto x)]
    |otherwise = (returnProjeto x):(adicionaLista xs)