module Msgs exposing (..)
import Models exposing (..)
import RemoteData exposing (WebData)

type Msg
 = OnFetchTodos (WebData (List Todo))