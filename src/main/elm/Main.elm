module Main where
import Time
import Html exposing (Html)
import Task exposing (..)
import Model exposing (..)
import View exposing (..)
import Api exposing (lookUpOrgs,lookUpProjects)
import Actions exposing (actions,Action(..))
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
        OrgSelected org -> Just (lookUpProjects org)
        _ -> Nothing
    in
    Signal.filterMap actionHandler (succeed [])  actions.signal 
    |> Signal.map (\task -> Task.toResult(task) `andThen` Signal.send projects.address)

port addProject: Signal(Project)
port addProject =
           let handler action = 
             case action of 
               ProjectSelected project -> Just project
               _ -> Nothing
           in
            Signal.filterMap handler {name= "", org= ""} actions.signal
     

