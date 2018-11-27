module Main exposing (init, main)

import Html exposing (program)
import Models exposing (Model, initialModel)
import Update exposing (update)
import View exposing (view)
import Msgs exposing (Msg)
import Commands exposing (fetchTodos)


init : ( Model, Cmd Msg )
init =
    ( initialModel, fetchTodos )

subscriptions : Model -> Sub Msg
subscriptions model = 
    Sub.none

main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }