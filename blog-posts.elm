import Html exposing (Html, ul, li, text, div, button)
import List exposing (map)
import Html.Events exposing (onClick)

main =
  Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Post = {name: String, tags: List String}
type alias Model = List Post

model : Model
model = [Post "Post 1" ["initial post, test"], Post "Post 2" ["test"]]

-- UPDATE

type Msg = SortAsc | SortDesc

update : Msg -> Model -> Model
update msg model = case msg of
    SortAsc -> List.sortBy .name model
    SortDesc -> List.sortWith descending model

descending : Post -> Post -> Order
descending a b =
    case compare a.name b.name of
        LT ->
            GT
        GT ->
            LT
        EQ ->
            EQ

-- VIEW
postName : Post ->  (Html.Html msg)
postName post = li [] [text post.name, postTagList post]

postTagList : Post -> (Html.Html msg)
postTagList post = ul [] [(li [] (map (\p -> text p) post.tags))]

view : Model -> Html Msg
view model = div [] 
    [
        ul [] (map postName model)
        , button [onClick SortAsc] [text "Acs"]
        , button [onClick SortDesc] [text "Desc"]
    ]