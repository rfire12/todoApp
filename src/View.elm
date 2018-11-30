module View exposing (addTodo, list, maybeList, renderTodos, view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Models exposing (..)
import Msgs exposing (Msg(..))
import RemoteData exposing (WebData)


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ addTodo
        , maybeList model.todos
        ]


maybeList : WebData (List Todo) -> Html Msg
maybeList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "Loading Todos"

        RemoteData.Success todos ->
            list todos

        RemoteData.Failure error ->
            text (toString error)


list : List Todo -> Html Msg
list todos =
    div [ class "todos-list" ]
        [ ul []
            (List.map renderTodos
                (List.filter
                    (\todo ->
                        todo.state == Created
                    )
                    todos
                )
            )
        ]


renderTodos : Todo -> Html Msg
renderTodos todo =
    li [ class "to-do" ]
        [ input [ id "todo-checkbox", type_ "checkbox", onInput Input ] []
        , span [] [ text todo.text ]
        ]


addTodo =
    Html.form [ class "add-todo-form" ]
        [ input [ type_ "text", placeholder "Add a new To-do..." ] []
        , input [ type_ "submit", value "Add" ] []
        ]
