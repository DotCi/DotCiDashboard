module Api(lookUpProjects) where
import Time
import Json.Decode as Json exposing ((:=))
import Http
import Task exposing (..)
import Model exposing (..)
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
