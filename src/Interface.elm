module Interface exposing (Vault, appShell, vaultTable)

import Css
import Css.Global
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr exposing (..)
import Html.Styled.Events as Events exposing (onClick)
import Interface.Desktop as Desktop
import Interface.Mobile as Mobile
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
            List.map vaultHeader [ "E", "v3", "D" ]
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


vaultHeader : String -> Html msg
vaultHeader label =
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


appShell : List Vault -> Html msg
appShell vaults =
    div
        [ css
            [ Tw.min_h_screen
            , Tw.bg_white
            ]
        ]
        [ nav
            [ css
                [ Tw.bg_white
                , Tw.border_b
                , Tw.border_gray_200
                ]
            ]
            [ div
                [ css
                    [ Tw.max_w_7xl
                    , Tw.mx_auto
                    , Tw.px_4
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
                        [ Tw.flex
                        , Tw.justify_between
                        , Tw.h_16
                        ]
                    ]
                    [ Desktop.menu
                    , div
                        [ css
                            [ Tw.hidden
                            , Bp.sm
                                [ Tw.ml_6
                                , Tw.flex
                                , Tw.items_center
                                ]
                            ]
                        ]
                        [ Desktop.notifications
                        , div
                            [ css
                                [ Tw.ml_3
                                , Tw.relative
                                ]
                            ]
                            [ Desktop.profileButton
                            , Desktop.profileDropdown
                            ]
                        ]
                    , Mobile.hamburger
                    ]
                ]
            , {- Mobile menu, show/hide based on menu state. -}
              div
                [ css
                    [ Bp.sm
                        [ Tw.hidden
                        ]
                    ]
                ]
                [ Mobile.menu
                , div
                    [ css
                        [ Tw.pt_4
                        , Tw.pb_3
                        , Tw.border_t
                        , Tw.border_gray_200
                        ]
                    ]
                    [ div
                        [ css
                            [ Tw.flex
                            , Tw.items_center
                            , Tw.px_4
                            ]
                        ]
                        [ div
                            [ css
                                [ Tw.flex_shrink_0
                                ]
                            ]
                            [ img
                                [ css
                                    [ Tw.h_10
                                    , Tw.w_10
                                    , Tw.rounded_full
                                    ]
                                , Attr.src "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                                , Attr.alt ""
                                ]
                                []
                            ]
                        , div
                            [ css
                                [ Tw.ml_3
                                ]
                            ]
                            [ div
                                [ css
                                    [ Tw.text_base
                                    , Tw.font_medium
                                    , Tw.text_gray_800
                                    ]
                                ]
                                [ text "Tom Cook" ]
                            , div
                                [ css
                                    [ Tw.text_sm
                                    , Tw.font_medium
                                    , Tw.text_gray_500
                                    ]
                                ]
                                [ text "tom@example.com" ]
                            ]
                        , Mobile.notifications
                        ]
                    , Mobile.profileDropdown
                    ]
                ]
            ]
        , div
            [ css
                [ Tw.py_10
                ]
            ]
            [ header []
                [ div
                    [ css
                        [ Tw.max_w_7xl
                        , Tw.mx_auto
                        , Tw.px_4
                        , Bp.lg
                            [ Tw.px_8
                            ]
                        , Bp.sm
                            [ Tw.px_6
                            ]
                        ]
                    ]
                    [ h1
                        [ css
                            [ Tw.text_3xl
                            , Tw.font_bold
                            , Tw.leading_tight
                            , Tw.text_gray_900
                            ]
                        ]
                        [ text "Dashboard" ]
                    ]
                ]
            , main_ []
                [ div
                    [ css
                        [ Tw.max_w_7xl
                        , Tw.mx_auto
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
                            [ Tw.px_4
                            , Tw.py_8
                            , Bp.sm
                                [ Tw.px_0
                                ]
                            ]
                        ]
                        [ vaultTable vaults ]
                    ]
                ]
            ]
        ]
