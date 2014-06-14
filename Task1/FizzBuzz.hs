{-
    Напишите программу, которая выводит на экран числа от 1 до 100.
    При этом вместо чисел, кратных трем, программа должна выводить
    слово «Fizz», а вместо чисел, кратных пяти — слово «Buzz».
    Если число кратно и 3, и 5, то программа должна выводить слово «FizzBuzz»
-}

module Main where

fizz :: Int -> String
fizz n = if n `mod` 3 == 0 then "Fizz" else ""

buzz :: Int -> String
buzz n = if n `mod` 5 == 0 then "Buzz" else ""

firstNonEmpty :: String -> String -> String
firstNonEmpty "" second = second
firstNonEmpty first second = first

fizzBuzz :: Int -> String
fizzBuzz n = firstNonEmpty (fizz n ++ buzz n) (show n)

main = do
    let myFizzBuzzes = map fizzBuzz [1..100]

    fbs <- readFile "FizzBuzzes.txt"    
    if read fbs == myFizzBuzzes
        then putStrLn "Right."
        else putStrLn "Not right."
