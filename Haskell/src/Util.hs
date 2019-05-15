module Util where

concludeScreen :: String -> IO()
concludeScreen acao = do
    putStrLn(acao ++ " com sucesso! ")
    putStrLn("Digite qualquer tecla para sair! ")
    sair <- getLine
    putStrLn("ok")
