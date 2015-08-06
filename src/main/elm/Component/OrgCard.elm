module Component.OrgCard where 
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Actions exposing (actions,Action)

card: String ->Action ->String-> Html
card name action buttonText=
  div [class "mdl-card  mdl-shadow--2dp"][
      div [class "mdl-card__title"][
        h4 [][text name]
      ],
      div [class "mdl-card__actions"][
         
           a [href "#",
             onClick actions.address action, 
             class "mdl-button mdl-button--colored mdl-js-button mdl-js-ripple-effect"
             ] 
           [(text buttonText)]
      ]
  ]
