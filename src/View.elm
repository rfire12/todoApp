module View exposing (..)

import Html exposing (..)
import RemoteData exposing (WebData)
import Models exposing (..)
import Msgs exposing (Msg)

view : Model -> Html Msg
view model = 
    div []
    [
        maybeList model.todos
    ]

maybeList : WebData (List Todo) -> Html Msg
maybeList response =
    case response of 
        RemoteData.NotAsked ->
            text ""
        
        RemoteData.Loading ->
            text "Loading Todos"

        RemoteData.Success todos ->
            text "Fetching Success :)"

        RemoteData.Failure error ->
            text (toString error)

