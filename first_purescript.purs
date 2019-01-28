{-
From: https://medium.com/fuzzy-sharp/purescript-and-haskell-at-lumi-7e8e2b16fb13
-}

data PursRecord = PursRecord
    { recordFields :: [(Maybe Text, PursType)]
    }
data PursTypeConstructor = PursTypeConstructor
    { name      :: Text
    , dataCtors :: [(Text, PursRecord)]
    }
class ToPursType a where
    toPursType :: Tagged a PursTypeConstructor
    default toPursType 
    :: ( Generic a
        , GenericToPursType (Rep a)
        )
    => Tagged a PursTypeConstructor
    toPursType = retag $ genericToPursType @(Rep a) id
