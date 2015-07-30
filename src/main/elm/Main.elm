module Main where
import Html exposing (div, button, text)
import Html.Events exposing (onClick)
import StartApp
import Http
import Json.Decode as Json exposing ((:=))
import Array
import Task exposing (..)
import String
import Char
import Html exposing (..)
import Json.Decode as Json exposing ((:=))
import Time

view : (Result String (List String)) -> Html
view result = 
  let messages = 
       case result of 
         Err msg -> msg
         Ok projects -> (toString projects)
  in
  text messages

main =
  Signal.map view   results.signal



results : Signal.Mailbox (Result String (List String))
results =
  Signal.mailbox (Err "Error ")

report projects =
  Signal.send results.address  projects

port requests : Signal (Task String ())
port requests = 
   Signal.map lookUpProjects (Time.every 20000) 
    |> Signal.map (\task -> Task.toResult task `andThen` Signal.send results.address)
     
-- port requests : Signal (Task x ())
-- port requests = 
--     Task.toResult lookUpProjects 

lookUpProjects: Time.Time  -> Task String (List String)
lookUpProjects x = 
  succeed("http://localhost:8080/jenkins/dotciDashboard/api/")  `andThen` (mapError (always "Not found :(") << Http.get projects)


projects : Json.Decoder (List String)
projects =
  let project = 
    Json.string
  in
     "projects" := Json.list project
