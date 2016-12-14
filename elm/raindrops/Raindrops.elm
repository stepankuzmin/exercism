module Raindrops exposing (..)

import List exposing (foldl)
import String exposing (isEmpty)


factorSounds : List ( Int, String )
factorSounds =
    [ ( 3, "Pling" ), ( 5, "Plang" ), ( 7, "Plong" ) ]


sound : Int -> ( Int, String ) -> String -> String
sound n ( m, s ) acc =
    if rem n m == 0 then
        acc ++ s
    else
        acc


raindrops : Int -> String
raindrops n =
    let
        sounds =
            foldl (sound n) "" factorSounds
    in
        if isEmpty sounds then
            toString n
        else
            sounds
