module Interface exposing (Vault, vaultTable)

import Browser
import Css
import Css.Global
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr exposing (..)
import Html.Styled.Events as Events exposing (onClick)
import Svg.Styled as Svg exposing (path, svg)
import Svg.Styled.Attributes as SvgAttr
import Tailwind.Breakpoints as Bp
import Tailwind.Utilities as Tw


type alias Vault =
    { first : Int, second : Int, third : Int }


vaultTable : List Vault -> Html msg
vaultTable vaults =
    let
        vaultRows =
            List.indexedMap vaultRow vaults

        headers =
            List.map header [ "E", "v3", "D" ]
    in
    div [ css [ Tw.flex, Tw.flex_col ] ]
        [ div
            [ css
                [ Tw.neg_my_2
                , Tw.overflow_x_auto
                , Bp.lg
                    [ Tw.neg_mx_8
                    ]
                , Bp.sm
                    [ Tw.neg_mx_6
                    ]
                ]
            ]
            [ div
                [ css
                    [ Tw.py_2
                    , Tw.align_middle
                    , Tw.inline_block
                    , Tw.min_w_full
                    , Bp.lg
                        [ Tw.px_8
                        ]
                    , Bp.sm
                        [ Tw.px_6
                        ]
                    ]
                ]
                [ div
                    [ css
                        [ Tw.shadow
                        , Tw.overflow_hidden
                        , Tw.border_b
                        , Tw.border_gray_200
                        , Bp.sm
                            [ Tw.rounded_lg
                            ]
                        ]
                    ]
                    [ table
                        [ css
                            [ Tw.min_w_full
                            , Tw.divide_y
                            , Tw.divide_gray_200
                            ]
                        ]
                        [ thead
                            [ css
                                [ Tw.bg_gray_50
                                ]
                            ]
                            [ tr [] headers ]
                        , tbody
                            [ css
                                [ Tw.bg_white
                                , Tw.divide_y
                                , Tw.divide_gray_200
                                ]
                            ]
                            vaultRows
                        ]
                    ]
                ]
            ]
        ]


header : String -> Html msg
header label =
    th
        [ Attr.scope "col"
        , css
            [ Tw.px_6
            , Tw.py_3
            , Tw.text_left
            , Tw.text_xs
            , Tw.font_medium
            , Tw.text_gray_500
            , Tw.uppercase
            , Tw.tracking_wider
            ]
        ]
        [ text label ]


vaultRow : Int -> Vault -> Html msg
vaultRow index vault =
    let
        even =
            modBy 2 index == 0
    in
    tr
        [ css
            [ if even then
                Tw.bg_gray_50

              else
                Tw.bg_white
            ]
        ]
        [ td
            [ css
                [ Tw.px_6
                , Tw.py_4
                , Tw.whitespace_nowrap
                ]
            ]
            [ span
                [ css
                    [ Tw.px_2
                    , Tw.inline_flex
                    , Tw.text_xs
                    , Tw.leading_5
                    , Tw.font_semibold
                    , Tw.rounded_full
                    , Tw.bg_green_100
                    , Tw.text_green_800
                    ]
                ]
                [ text (String.fromInt vault.first) ]
            ]
        , td
            [ css
                [ Tw.px_6
                , Tw.py_4
                , Tw.whitespace_nowrap
                , Tw.text_sm
                , Tw.text_gray_500
                ]
            ]
            [ text (String.fromInt vault.second) ]
        , td
            [ css
                [ Tw.px_6
                , Tw.py_4
                , Tw.whitespace_nowrap
                , Tw.text_sm
                , Tw.text_gray_500
                ]
            ]
            [ text (String.fromInt vault.third) ]
        ]
