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
import Model exposing (..)

view : (Result String (List Organization)) -> Html
view result = 
  let messages = 
       case result of 
         Err msg -> msg
         Ok projects -> (toString projects)
  in
  text messages

main =
  Signal.map view   results.signal



results : Signal.Mailbox (Result String (List Organization))
results =
  Signal.mailbox (Err "Error ")


port requests : Signal (Task String ())
port requests = 
   Signal.map lookUpProjects (Time.every 20000) 
    |> Signal.map (\task -> Task.toResult task `andThen` Signal.send results.address)
     

lookUpProjects: Time.Time  -> Task String (List Organization)
lookUpProjects x = 
  succeed("http://localhost:8080/jenkins/dotciDashboard/api/")  
  `andThen` (mapError (always "Not found :(") << Http.get projects)


projects : Json.Decoder (List Organization)
projects =
  let orgs = 
    Json.object2 Organization
               ("name" := Json.string)
               ("url" := Json.string)
  in
     "projects" := Json.list orgs
