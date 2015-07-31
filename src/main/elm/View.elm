module View(view) where
import Html exposing (..)
import Model exposing (Organization)
view : (Result String (List Organization)) -> Html
view result = 
  let messages = 
       case result of 
         Err msg -> msg
         Ok projects -> (toString projects)
  in
  text messages
