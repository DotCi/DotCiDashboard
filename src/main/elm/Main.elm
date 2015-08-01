module Main where
import Time
import Html exposing (Html)
import Task exposing (..)
import Model exposing (..)
import View exposing (..)
import Api exposing (lookUpProjects)
import Mailbox exposing (actions)
import Maybe exposing (Maybe(Just,Nothing))

main =
  Signal.map view  results.signal



results : Signal.Mailbox (Result String Model)
results =
  Signal.mailbox (Err "Error ")

port requests : Signal (Task String ())
port requests = 
    Signal.map lookUpProjects (Time.every 20000) 
    |> Signal.map (\task -> Task.toResult(Task.map (\orgs -> {orgs=orgs, selectedOrg=Nothing}) task)
                           `andThen` Signal.send results.address
                   )
     

