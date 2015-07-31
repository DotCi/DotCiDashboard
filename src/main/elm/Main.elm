module Main where
import Time
import Task exposing (..)
import Model exposing (..)
import View exposing (view)
import Api exposing (lookUpProjects)


main =
  Signal.map view   results.signal

results : Signal.Mailbox (Result String (List Organization))
results =
  Signal.mailbox (Err "Error ")


port requests : Signal (Task String ())
port requests = 
   Signal.map lookUpProjects (Time.every 20000) 
    |> Signal.map (\task -> Task.toResult task `andThen` Signal.send results.address)
     

