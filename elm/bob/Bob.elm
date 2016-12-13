module Bob exposing (..)

import Char exposing (isLower, isUpper)
import String exposing (all, endsWith, filter, isEmpty, trim)


isLetter : Char -> Bool
isLetter char =
    isLower (char) || isUpper (char)


isShout : String -> Bool
isShout phrase =
    let
        letters =
            filter isLetter phrase
    in
        (not (isEmpty letters)) && (all isUpper letters)


isQuestion : String -> Bool
isQuestion =
    endsWith "?"


isSilence : String -> Bool
isSilence =
    isEmpty << trim


hey : String -> String
hey phrase =
    if isShout phrase then
        "Whoa, chill out!"
    else if isQuestion phrase then
        "Sure."
    else if isSilence phrase then
        "Fine. Be that way!"
    else
        "Whatever."
