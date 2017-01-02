module Triangle exposing (..)


version : Int
version =
    2


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


isEquilateral : Float -> Float -> Float -> Bool
isEquilateral x y z =
    x == y && y == z


allEq : List number -> Bool
allEq list =
    case List.head list of
        Just head ->
            List.all (\i -> i == head) list

        Nothing ->
            False


isIsosceles : Float -> Float -> Float -> Bool
isIsosceles x y z =
    [ x, y, z ]
        |> List.sort
        |> List.drop 1
        |> allEq


checkLengths : Float -> Float -> Float -> Bool
checkLengths x y z =
    List.any (\x -> x <= 0) [ x, y, z ]


flippedComparison : comparable -> comparable -> Order
flippedComparison a b =
    case compare a b of
        LT ->
            GT

        EQ ->
            EQ

        GT ->
            LT


checkInequality : Float -> Float -> Float -> Bool
checkInequality x y z =
    case List.sortWith flippedComparison [ x, y, z ] of
        head :: tail ->
            head > List.sum tail

        [] ->
            False


triangleKind : Float -> Float -> Float -> Result String Triangle
triangleKind x y z =
    if checkLengths x y z then
        Err "Invalid lengths"
    else if checkInequality x y z then
        Err "Violates inequality"
    else if isEquilateral x y z then
        Ok Equilateral
    else if isIsosceles x y z then
        Ok Isosceles
    else
        Ok Scalene
