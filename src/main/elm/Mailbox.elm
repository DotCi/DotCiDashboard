module Mailbox where
import Model exposing (..)
results : Signal.Mailbox (Result String Model)
results =
  Signal.mailbox (Err "Error ")
