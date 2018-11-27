module Commands exposing (commentsDecoder, decodeState, fetchTodos, fetchTodosUrl, todoDecoder, todosDecoder)

import Constants exposing (constants)
import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Models exposing (..)
import Msgs exposing (Msg)
import RemoteData


fetchTodos : Cmd Msg
fetchTodos =
    Http.get fetchTodosUrl todosDecoder
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.OnFetchTodos


fetchTodosUrl : String
fetchTodosUrl =
    constants.todosURL


todosDecoder : Decode.Decoder (List Todo)
todosDecoder =
    Decode.list todoDecoder


todoDecoder : Decode.Decoder Todo
todoDecoder =
    decode Todo
        |> required "id" Decode.string
        |> required "text" Decode.string
        |> required "quantity" Decode.int
        |> required "comments" (Decode.list commentsDecoder)
        |> required "state" decodeState


commentsDecoder : Decode.Decoder Comment
commentsDecoder =
    decode Comment
        |> required "id" Decode.string
        |> required "comment" Decode.string


decodeState : Decode.Decoder TodoState
decodeState =
    Decode.string
        |> Decode.andThen
            (\state ->
                case state of
                    "Created" ->
                        Decode.succeed Created

                    "Deleted" ->
                        Decode.succeed Deleted

                    "Done" ->
                        Decode.succeed Done

                    _ ->
                        Decode.fail "invalid state"
            )
