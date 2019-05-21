module PersistenceTodo where

import System.IO
import System.Directory

testeTodo :: String -> String -> String -> Int -> IO()
testeTodo name description responsible duration = do
    putStrLn name
    putStrLn description
    putStrLn responsible

    -- lembrar de usar o show quando quiser printar inteiros
    putStrLn (show duration)