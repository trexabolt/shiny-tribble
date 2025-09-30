data Player = Player { pname :: String, px :: Int, py :: Int } deriving Show

movePlayer :: Player -> (Int, Int) -> Player
movePlayer p (dx, dy) = p { px = px p + dx, py = py p + dy }

showPlayers :: [Player] -> IO ()
showPlayers [] = return ()
showPlayers (p:ps) = do
    putStrLn $ pname p ++ " at (" ++ show (px p) ++ "," ++ show (py p) ++ ")"
    showPlayers ps

main :: IO ()
main = do
    let players = [Player "A" 0 0, Player "B" 2 2]
    let steps = [(1,0), (0,1), (1,1), (-1,0), (0,-1)]
    putStrLn "Co-op Platformer Start"
    let simulate ps [] = showPlayers ps
        simulate ps (s:ss) = do
            let ps' = zipWith movePlayer ps [s, (snd s, fst s)]
            showPlayers ps'
            simulate ps' ss
    simulate players steps
    putStrLn "Platformer Ended."