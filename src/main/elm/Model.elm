module Model where

type alias Organization = { name : String, url : String }
type alias Project = { name : String}

type alias Model = { orgs: List Organization, projects: List Project}

orgs : Signal.Mailbox (Result String (List Organization))
orgs =
  Signal.mailbox (Ok [])
 
projects : Signal.Mailbox (Result String (List Project))
projects =
  Signal.mailbox (Ok [])

