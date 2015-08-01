module Model where
import Maybe exposing (Maybe(Just,Nothing))

type alias Organization = { name : String, url : String }

type alias Model = { orgs: List Organization, selectedOrg: Maybe String}
