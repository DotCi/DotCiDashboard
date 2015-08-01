module Mailbox where
import Model exposing (..)
results : Signal.Mailbox (Result String (List Organization))
results =
  Signal.mailbox (Err "Error ")
