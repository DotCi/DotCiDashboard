module View(view)  where
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Organization,Model)
import Mailbox exposing (actions,Action(NoOp))
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
     onClick actions.address NoOp ] 
   [(text org.name)]
   ]
