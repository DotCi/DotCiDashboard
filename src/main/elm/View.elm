module View(error,model,view)  where
import Html exposing (..)
import Html.Attributes exposing (..)
import Model exposing (Organization,Model)
import List


type Output =  Error String|ModelOk Model 

error err  =
     Error err
model orgList =
     ModelOk {orgs = orgList}

view : Output -> Html
view output = 
  case output of 
     Error msg  -> text "Error"
     ModelOk model  -> orgsView model.orgs

orgsView: List Organization -> Html
orgsView orgs =
  orgs 
  |> List.map (\org -> orgView org) 
  |> ul [] 
     
orgView org = 
   li [][
   a [href "#"] [(text org.name)]
   ]
