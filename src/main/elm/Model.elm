module Model where
import Maybe exposing (Maybe(Just,Nothing))

type alias Organization = { name : String, url : String }
type alias Project = { name : String}

type alias Model = { orgs: List Organization, projects: List Project}

