module Models exposing (..)
import RemoteData exposing (WebData)


type alias Model =
    { todos : WebData (List Todo)
    , todoInput : String
    }


type alias Todo =
    { id : String
    , text : String
    , quantity : Int
    , comments : List Comment
    , state : TodoState
    }


type alias Comment =
    { id : String
    , comment : String
    }


type TodoState
    = Created
    | Deleted
    | Done


type alias TodoId =
    String


type alias CommentId =
    String


initialModel : Model
initialModel =
    { todos = RemoteData.Loading
    , todoInput = ""
    }
