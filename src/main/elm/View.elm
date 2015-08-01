module View(view)  where
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Organization,Model)
import Mailbox exposing (results)
import List



view : Result String Model -> Html
view output = 
  case output of 
     Err msg  -> text msg
     Ok model  -> orgsView model.orgs

orgsView: List Organization -> Html
orgsView orgs =
  orgs 
  |> List.map (\org -> orgView org) 
  |> ul [] 
     
orgView org = 
   li [][
   a [href "#",
     onClick results.address (Err "meowlicious") ] 
   [(text org.name)]
   ]
