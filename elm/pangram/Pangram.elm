module Pangram exposing (..)

import Char exposing (isLower, isUpper)
import String exposing (all, contains, filter, fromChar, toLower)


letterInString : String -> Char -> Bool
letterInString string char =
    contains (fromChar char) string


isLetter : Char -> Bool
isLetter char =
    isLower (char) || isUpper (char)


isPangram : String -> Bool
isPangram phrase =
    let
        letters =
            toLower <| filter isLetter phrase
    in
        all (letterInString letters) "abcdefghijklmnopqrstuvwxyz"
