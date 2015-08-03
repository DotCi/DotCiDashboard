module Main where
import Time
import Html exposing (Html)
import Task exposing (..)
import Model exposing (..)
import View exposing (..)
import Api exposing (lookUpOrgs)
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
    Ok orgs -> view (Ok {orgs= orgs, projects=[]} )


orgs : Signal.Mailbox (Result String (List Organization))
orgs =
  Signal.mailbox (Err "Error ")

port orgRequests : Signal (Task String ())
port orgRequests = 
    Signal.map lookUpOrgs (Time.every 20000) 
    |> Signal.map (\task -> Task.toResult(task) `andThen` Signal.send orgs.address)

-- port orgProjectRequest: Signal
-- port orgProjectRequest = 
--     Signal.map lookUp actions.signal 
     

