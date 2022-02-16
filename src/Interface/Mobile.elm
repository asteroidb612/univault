module Interface.Mobile exposing (hamburger, notifications, profileDropdown)

import Css
import Css.Global
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr exposing (..)
import Html.Styled.Events as Events exposing (onClick)
import Svg.Styled as Svg exposing (path, svg)
import Svg.Styled.Attributes as SvgAttr
import Tailwind.Breakpoints as Bp
import Tailwind.Utilities as Tw


notifications =
    button
        [ css
            [ Tw.ml_auto
            , Tw.bg_white
            , Tw.flex_shrink_0
            , Tw.p_1
            , Tw.rounded_full
            , Tw.text_gray_400
            , Css.focus
                [ Tw.outline_none
                , Tw.ring_2
                , Tw.ring_offset_2
                , Tw.ring_indigo_500
                ]
            , Css.hover
                [ Tw.text_gray_500
                ]
            ]
        ]
        [ span
            [ css
                [ Tw.sr_only
                ]
            ]
            [ text "View notifications" ]
        , {- Heroicon name: outline/bell -}
          svg
            [ SvgAttr.css
                [ Tw.h_6
                , Tw.w_6
                ]
            , SvgAttr.fill "none"
            , SvgAttr.viewBox "0 0 24 24"
            , SvgAttr.stroke "currentColor"
            , Attr.attribute "aria-hidden" "true"
            ]
            [ path
                [ SvgAttr.strokeLinecap "round"
                , SvgAttr.strokeLinejoin "round"
                , SvgAttr.strokeWidth "2"
                , SvgAttr.d "M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"
                ]
                []
            ]
        ]


profileDropdown =
    div
        [ css
            [ Tw.mt_3
            , Tw.space_y_1
            ]
        ]
        [ a
            [ Attr.href "#"
            , css
                [ Tw.block
                , Tw.px_4
                , Tw.py_2
                , Tw.text_base
                , Tw.font_medium
                , Tw.text_gray_500
                , Css.hover
                    [ Tw.text_gray_800
                    , Tw.bg_gray_100
                    ]
                ]
            ]
            [ text "Your Profile" ]
        , a
            [ Attr.href "#"
            , css
                [ Tw.block
                , Tw.px_4
                , Tw.py_2
                , Tw.text_base
                , Tw.font_medium
                , Tw.text_gray_500
                , Css.hover
                    [ Tw.text_gray_800
                    , Tw.bg_gray_100
                    ]
                ]
            ]
            [ text "Settings" ]
        , a
            [ Attr.href "#"
            , css
                [ Tw.block
                , Tw.px_4
                , Tw.py_2
                , Tw.text_base
                , Tw.font_medium
                , Tw.text_gray_500
                , Css.hover
                    [ Tw.text_gray_800
                    , Tw.bg_gray_100
                    ]
                ]
            ]
            [ text "Sign out" ]
        ]


hamburger =
    div
        [ css
            [ Tw.neg_mr_2
            , Tw.flex
            , Tw.items_center
            , Bp.sm
                [ Tw.hidden
                ]
            ]
        ]
        [ {- Mobile menu button -}
          button
            [ Attr.type_ "button"
            , css
                [ Tw.bg_white
                , Tw.inline_flex
                , Tw.items_center
                , Tw.justify_center
                , Tw.p_2
                , Tw.rounded_md
                , Tw.text_gray_400
                , Css.focus
                    [ Tw.outline_none
                    , Tw.ring_2
                    , Tw.ring_offset_2
                    , Tw.ring_indigo_500
                    ]
                , Css.hover
                    [ Tw.text_gray_500
                    , Tw.bg_gray_100
                    ]
                ]
            , Attr.attribute "aria-controls" "mobile-menu"
            , Attr.attribute "aria-expanded" "false"
            ]
            [ span
                [ css
                    [ Tw.sr_only
                    ]
                ]
                [ text "Open main menu" ]
            , {-
                 Heroicon name: outline/menu

                 Menu open: "hidden", Menu closed: "block"
              -}
              svg
                [ SvgAttr.css
                    [ Tw.block
                    , Tw.h_6
                    , Tw.w_6
                    ]
                , SvgAttr.fill "none"
                , SvgAttr.viewBox "0 0 24 24"
                , SvgAttr.stroke "currentColor"
                , Attr.attribute "aria-hidden" "true"
                ]
                [ path
                    [ SvgAttr.strokeLinecap "round"
                    , SvgAttr.strokeLinejoin "round"
                    , SvgAttr.strokeWidth "2"
                    , SvgAttr.d "M4 6h16M4 12h16M4 18h16"
                    ]
                    []
                ]
            , {-
                 Heroicon name: outline/x

                 Menu open: "block", Menu closed: "hidden"
              -}
              svg
                [ SvgAttr.css
                    [ Tw.hidden
                    , Tw.h_6
                    , Tw.w_6
                    ]
                , SvgAttr.fill "none"
                , SvgAttr.viewBox "0 0 24 24"
                , SvgAttr.stroke "currentColor"
                , Attr.attribute "aria-hidden" "true"
                ]
                [ path
                    [ SvgAttr.strokeLinecap "round"
                    , SvgAttr.strokeLinejoin "round"
                    , SvgAttr.strokeWidth "2"
                    , SvgAttr.d "M6 18L18 6M6 6l12 12"
                    ]
                    []
                ]
            ]
        ]
