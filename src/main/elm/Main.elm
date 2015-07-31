module Main where
import Time
import Html exposing (Html)
import Task exposing (..)
import Model exposing (..)
import View exposing (..)
import Api exposing (lookUpProjects)


main =
  Signal.map toModel  results.signal

toModel:  (Result String (List Organization)) -> Html
toModel result =
       case result of 
         Err msg -> view   (error msg)
         Ok orgs -> view (model orgs) 

results : Signal.Mailbox (Result String (List Organization))
results =
  Signal.mailbox (Err "Error ")


port requests : Signal (Task String ())
port requests = 
   Signal.map lookUpProjects (Time.every 20000) 
    |> Signal.map (\task -> Task.toResult task `andThen` Signal.send results.address)
     

