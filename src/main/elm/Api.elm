module Api(lookUpOrgs,lookUpProjects) where
import Time
import Json.Decode as Json exposing ((:=))
import Http
import Task exposing (..)
import Model exposing (..)

serverUrl = "http://localhost:8080/jenkins" 

lookUpOrgs: Time.Time  -> Task String (List Organization)
lookUpOrgs x = 
  succeed(serverUrl ++ "/dotciDashboard/api/")  
  `andThen` (mapError (always "Not found :(") << Http.get orgs)

lookUpProjects: String  -> Task String (List Project)
lookUpProjects orgName = 
  succeed(serverUrl ++ "/dotciDashboard/api/" ++ orgName ++ "/?tree=projects[*]")  
  `andThen` (mapError (always "Not found :(") << Http.get projects)

projects : Json.Decoder (List Project)
projects =
  let projects = 
    Json.object2 Project
               ("name" := Json.string)
               ("org" := Json.string)
  in
     "projects" := Json.list projects


orgs : Json.Decoder (List Organization)
orgs =
  let orgs = 
    Json.object2 Organization
               ("name" := Json.string)
               ("url" := Json.string)
  in
     "orgs" := Json.list orgs
