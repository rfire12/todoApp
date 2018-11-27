module Models exposing (Model, Todo)


type alias Model =
    { todos : Maybe List Todo
    }


type alias Todo =
    { id : TodoId
    , name : String
    , quantity : Int
    , comments : Maybe List Comment
    , state : TodoState
    }


type alias Comment =
    { id : CommentId
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
