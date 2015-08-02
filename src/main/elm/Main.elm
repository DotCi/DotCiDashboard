module Main where
import Time
import Html exposing (Html)
import Task exposing (..)
import Model exposing (..)
import View exposing (..)
import Api exposing (lookUpProjects)
import Actions exposing (actions,Action(OrgSelected,NoOp))
import Maybe exposing (Maybe(Just,Nothing))

main =
  Signal.map2 output actions.signal orgs.signal

output  action orgResult = 
  let selectedOrg =
      case action of
        OrgSelected org ->  Just org
        NoOp -> Nothing
  in
  case orgResult of
    Err msg -> view (Err msg)
    Ok orgs -> view (Ok {orgs= orgs, selectedOrg=selectedOrg} )


orgs : Signal.Mailbox (Result String (List Organization))
orgs =
  Signal.mailbox (Err "Error ")

port requests : Signal (Task String ())
port requests = 
    Signal.map lookUpProjects (Time.every 20000) 
    |> Signal.map (\task -> Task.toResult(task) `andThen` Signal.send orgs.address)
     

