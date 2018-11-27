module Commands exposing (..)

import Http
import Json.Decode as Decode
import Json.Decode.Pipeline exposing (decode, required)
import Msgs exposing (Msg)
import RemoteData
import Constants exposing (constants)

fetchPlayers: Cmd Msg
fetchTodos = 
    Http.get fetchTodosUrl todosDecoder
    |> RemoteData.sendRequest
    |> Cmd.map Msgs.OnfetchTodos

fetchTodosUrl : String
    constants.todosUrl

todosDecoder: Decode.Decoder (List Todo)
todosDecoder=
    Decode.list todoDecoder

todoDecoder: Decode.Decoder Todo
todoDecoder =
    decode Todo
    |> required "id" Decode.String
    |> required "name" Decode.String
    |> required "quantity" Decode.String
    |> required "comments" (Decode.list commentsDecoder)

commentsDecoder =
    decode Comment = 
        |> required "id" Decode.String
        |> required "Comment" Decode.String