module View(error,model,view)  where
import Html exposing (..)
import Model exposing (Organization,Model)


type Output =  Error String|ModelOk Model 

error err  =
     Error err
model orgList =
     ModelOk {orgs = orgList}

view : Output -> Html
view output = 
  case output of 
     Error msg  -> text "Error"
     ModelOk model  -> text "not error" 
     

