module View(view)  where
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Organization,Model)
import Actions exposing (actions,Action(NoOp,OrgSelected))
import List
import Component.OrgCard exposing(orgCard)

view : Result String Model -> Html
view output = 
  case output of 
     Err msg  -> text msg
     Ok model  -> renderModel model

renderModel model =
       div [][mdlStylesheet,mdlIcons,mdlScript,(orgsView model.orgs)]

orgsView: List Organization -> Html
orgsView orgs =
  orgs 
  |> List.map (\org -> orgCard org.name) 
  |> div [] 
     

mdlStylesheet =
    let
        tag = "link"
        attrs =
            [ attribute "rel"       "stylesheet"
            , attribute "property"  "stylesheet"
            , attribute "href"      "//storage.googleapis.com/code.getmdl.io/1.0.2/material.indigo-pink.min.css"
            ]
        children = []
    in 
        node tag attrs children   

mdlIcons =
    let
        tag = "link"
        attrs =
            [ attribute "rel"       "stylesheet"
            , attribute "property"  "stylesheet"
            , attribute "href"      "//fonts.googleapis.com/icon?family=Material+Icons"
            ]
        children = []
    in 
        node tag attrs children   
mdlScript =
    let
        tag = "script"
        attrs =
            [
             attribute "src"      "//storage.googleapis.com/code.getmdl.io/1.0.2/material.min.js"
            ]
        children = []
    in 
        node tag attrs children   
