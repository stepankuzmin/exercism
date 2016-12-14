module Accumulate exposing (..)


accumulate : (a -> b) -> List a -> List b
accumulate f list =
    case list of
        head :: tail ->
            (f head) :: (accumulate f tail)

        [] ->
            []
