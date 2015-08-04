module View(view)  where
import Html exposing (..)
import Component.PaperDrawerPanel exposing (..)
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
       drawerPanel (text "meow") (text "meow")
     -- node "paper-drawer-panel" [][ orgsView model.orgs, text (toString "Meow")]

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
