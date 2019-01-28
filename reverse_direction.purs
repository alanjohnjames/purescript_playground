{-
    spicydonuts/purescript.md

    https://gist.github.com/spicydonuts/a2e712bc1872ee9eb898   
-}


data Direction
    = North
    | South
    | East
    | West

class Reversible a where
    reverse :: a -> a

instance reversibleDirection :: Reversible Direction where
    reverse North = South
    reverse South = North
    reverse East = West
    reverse West = East

mirror :: forall a. (Reversible a) => a -> Tuple a a
mirror a = Tuple a (reverse a)

