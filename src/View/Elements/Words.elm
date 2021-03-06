module View.Elements.Words
    exposing
        ( view
        , viewInParagraphs
        )

import Css exposing (..)
import Html.Styled as Html exposing (Html, node)
import Html.Styled.Attributes exposing (css)
import Style
import Style.Colors as Colors


view : List Style -> String -> Html msg
view styles text =
    Html.p
        [ css
            [ Style.hfnss
            , color Colors.point0
            , fontSize (px 32)
            , lineHeight (px height)
            , Style.cannotSelect
            , Style.noPaddingOrMargins
            , Style.noFontSmoothing
            , Css.batch styles
            ]
        ]
        [ Html.text text ]


height : Float
height =
    21


viewInParagraphs : List ( List Style, String ) -> Html msg
viewInParagraphs paragraphs =
    paragraphs
        |> List.map viewParagraph
        |> node "words-container" []


viewParagraph : ( List Style, String ) -> Html msg
viewParagraph ( styles, message ) =
    view [ paragraphStyle, Css.batch styles ] message


paragraphStyle : Style
paragraphStyle =
    [ marginBottom (px height)
    , lastChild [ marginBottom zero ]
    ]
        |> Css.batch
