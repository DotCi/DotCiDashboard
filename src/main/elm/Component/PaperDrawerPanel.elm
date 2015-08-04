module Component.PaperDrawerPanel where
import Html exposing (..)
import Html.Attributes exposing (..)
import Json.Encode as Json

type PanelType = Drawer | Main

drawerPanel:Html ->Html-> Html
drawerPanel drawerContent mainContent =
     node "paper-drawer-panel" []
          [paperHeaderPanel Drawer drawerContent, paperHeaderPanel Main mainContent ]

paperHeaderPanel: PanelType -> Html -> Html
paperHeaderPanel panelType panelContent = 
  let attrs = 
    case panelType of 
      Drawer ->  [attribute "drawer" "true"]
      Main -> [attribute "main" "true"]
  in
  node "paper-header-panel" attrs [
                 node "paper-toolbar"[][],
                 div[][panelContent]
                 ]
                 
