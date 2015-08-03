module Main where
import Time
import Html exposing (Html)
import Task exposing (..)
import Model exposing (..)
import View exposing (..)
import Api exposing (lookUpOrgs,lookUpProjects)
import Actions exposing (actions,Action(OrgSelected,NoOp))
import Maybe exposing (Maybe, Maybe(Just,Nothing))

main =
  Signal.map2 output projects.signal orgs.signal

output  projectResult orgResult = 
  let projects =
      case projectResult of
        Err err -> [] 
        Ok projects -> projects
  in
  case orgResult of
    Err msg -> view (Err msg)
    Ok orgs -> view (Ok {orgs= orgs, projects=projects} )



port orgRequests : Signal (Task String ())
port orgRequests = 
    Signal.map lookUpOrgs (Time.every 20000) 
    |> Signal.map (\task -> Task.toResult(task) `andThen` Signal.send orgs.address)

port projectRequests : Signal (Task String ())
port projectRequests = 
    let actionHandler action = 
      case action of
        OrgSelected org ->  lookUpProjects org
        NoOp -> succeed []
    in
    Signal.map actionHandler actions.signal 
    |> Signal.map (\task -> Task.toResult(task) `andThen` Signal.send projects.address)
     

