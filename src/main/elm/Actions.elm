module Actions where
import Model exposing (..)
type Action  =
     OrgSelected String|
     ProjectSelected Project|
     NoOp
     
actions : Signal.Mailbox  Action
actions =
  Signal.mailbox  NoOp

    
