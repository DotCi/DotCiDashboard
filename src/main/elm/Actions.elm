module Actions where
import Model exposing (..)
type Action  =
     OrgSelected String|
     NoOp
     
actions : Signal.Mailbox  Action
actions =
  Signal.mailbox  NoOp
