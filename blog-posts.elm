import Html exposing (Html, ul, li, text, div, button)
import List exposing (map)
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL
type alias Post = {name: String}
type alias Model = List Post

model : Model
model = [Post "Post 1", Post "Post 2"]

-- UPDATE

type Msg = SortAsc | SortDesc

update : Msg -> Model -> Model
update msg model = case msg of
    SortAsc -> List.sortBy .name model
    SortDesc -> List.reverse model

-- VIEW

listItem : Post ->  (Html.Html msg)
listItem post = li [] [text post.name]

view : Model -> Html Msg
view model = div [] 
    [
        ul [] (map listItem model)
        , button [onClick SortAsc] [text "Acs"]
        , button [onClick SortDesc] [text "Desc"]
    ]