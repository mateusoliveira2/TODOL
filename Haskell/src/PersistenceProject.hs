import System.IO
import System.Directory

criaDiretorio :: String -> ()
criaDiretorio nome = if not doesDirectoryExist nome 
    then createDirectory nome
    else return ()

persistirProjeto :: String -> String -> String -> String -> Int -> String -> ()

persistirProjeto nome descricao responsavel status previsao deta = do
    criaDiretorio "../Projects"
    let nomeDiretorio = "../Projects/" ++ nome ++ "/"
    let conteudoProjeto = nome ++ "\n" ++ descricao ++ "\n" ++ responsavel ++ "\n" ++ status ++ "\n" ++ previsao ++ "\n" ++ deta ++ "\n"
    criaDiretorio (nomeDiretorio)
    writeFile (nomeDiretorio ++ nome ++ ".txt") (conteudoProjeto)

setNomeProjeto :: String -> String -> ()
setNomeProjeto nome novoNome = do
    let diretorioAntigo = "../Projects/" ++ nome ++ "/"
    let diretorioNovo = "../Projects/" ++ novoNome ++ "/"
    renameFile (diretorioAntigo ++ nome ++ ".txt") (diretorioAntigo ++ novoNome ++ ".txt")
    renameDirectory (diretorioAntigo) (diretorioNovo)
    
setStatusProjeto :: String -> String -> ()

setDescricaoProjeto :: String -> String -> ()

setResponsavelProjeto :: String -> String -> ()

setDataProjeto :: String -> String -> ()
