module View(view)  where
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Organization,Model)
import Actions exposing (actions,Action(NoOp,OrgSelected))
import List

view : Result String Model -> Html
view output = 
  case output of 
     Err msg  -> text msg
     Ok model  -> renderModel model

renderModel model =
       div [][mdlStylesheet,mdlIcons,mdlScript,xbutton]
     -- node "paper-drawer-panel" [][ orgsView model.orgs, text (toString "Meow")]
xbutton = 
  button [class "mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored"] [ i [class "material-icons"][text "add"]]


orgsView: List Organization -> Html
orgsView orgs =
  orgs 
  |> List.map (\org -> orgView org) 
  |> ul [] 
     
orgView org = 
   li [][
   a [href "#",
     onClick actions.address (OrgSelected org.name)
     ] 
   [(text org.name)]
   ]

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
