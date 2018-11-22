module Main exposing (Model, Msg(..), initialModel, main, update, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



--Model


type alias Model =
    { calories : Int
    , input : Int
    }


initialModel : Model
initialModel =
    { calories = 0
    , input = 0
    }



--View


view : Model -> Html Msg
view model =
    div []
        [ span
            [ style
                [ ( "font-weight", "bold" )
                , ( "color", "blue" )
                , ( "display", "inline-block" )
                , ( "margin", "5px" )
                ]
            ]
            [ text "Calorias:" ]
        , span [] [ text <| toString model.calories ]
        , input
            [ type_ "text"
            , onInput Input
            , style
                [ ( "display", "block" )
                , ( "margin-left", "5px" )
                , ( "width", "90px" )
                ]
            ]
            []
        , div []
            [ button
                [ onClick Add
                , style
                    [ ( "display", "inline-block" )
                    , ( "margin", "5px" )
                    , ( "border", "1px solid black" )
                    ]
                ]
                [ text "Add" ]
            , button
                [ onClick Clear
                , style
                    [ ( "display", "inline-block" )
                    , ( "margin", "5px" )
                    , ( "border", "1px solid black" )
                    ]
                ]
                [ text "Clear" ]
            ]
        ]



--Update


type Msg
    = Add
    | Clear
    | Input String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Add ->
            { model | calories = model.calories + model.input}

        Input val ->
            case String.toInt val of
                Ok input -> 
                    { model | input = input }
                Err err -> 
                    { model | input = 0}

        Clear ->
            { model | calories = 0 }


main : Program Never Model Msg
main =
    beginnerProgram
        { model = initialModel
        , update = update
        , view = view
        }
