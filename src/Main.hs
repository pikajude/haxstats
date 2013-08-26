module Main where

import Control.Concurrent
import Control.Concurrent.ParallelIO
import Stats.Game
import Stats.TeamSearch

main :: IO ()
main = do
    setNumCapabilities 8
    teams <- getGames
    print teams
    stopGlobalPool
