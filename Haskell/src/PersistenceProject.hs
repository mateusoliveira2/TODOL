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
    
    if success then return () 
    else createDirectory nome
 
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
    renameFile (diretorioAntigo ++ nome ++ ".txt") (diretorioAntigo ++ novoNome ++ ".txt")
    renameDirectory (diretorioAntigo) (diretorioNovo)
    
-- setStatusProjeto :: String -> String -> ()

-- setDescricaoProjeto :: String -> String -> ()

-- setResponsavelProjeto :: String -> String -> ()

-- setDataProjeto :: String -> String -> ()
