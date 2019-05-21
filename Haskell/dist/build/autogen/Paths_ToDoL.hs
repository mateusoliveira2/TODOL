module Paths_ToDoL (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/matheusop/.cabal/bin"
libdir     = "/home/matheusop/.cabal/lib/x86_64-linux-ghc-7.10.3/ToDoL-0.1.0.0-JI3ImsjBb4n3SypCzoaJpi"
datadir    = "/home/matheusop/.cabal/share/x86_64-linux-ghc-7.10.3/ToDoL-0.1.0.0"
libexecdir = "/home/matheusop/.cabal/libexec"
sysconfdir = "/home/matheusop/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "ToDoL_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "ToDoL_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "ToDoL_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "ToDoL_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "ToDoL_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
