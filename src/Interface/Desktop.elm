module Interface.Desktop exposing (notifications, profileButton, profileDropdown)

import Css
import Css.Global
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr exposing (..)
import Html.Styled.Events as Events exposing (onClick)
import Svg.Styled as Svg exposing (path, svg)
import Svg.Styled.Attributes as SvgAttr
import Tailwind.Breakpoints as Bp
import Tailwind.Utilities as Tw


profileDropdown =
    {-
       Dropdown menu, show/hide based on menu state.

       Entering: "transition ease-out duration-200"
         From: "transform opacity-0 scale-95"
         To: "transform opacity-100 scale-100"
       Leaving: "transition ease-in duration-75"
         From: "transform opacity-100 scale-100"
         To: "transform opacity-0 scale-95"
    -}
    div
        [ css
            [ Tw.origin_top_right
            , Tw.absolute
            , Tw.right_0
            , Tw.mt_2
            , Tw.w_48
            , Tw.rounded_md
            , Tw.shadow_lg
            , Tw.py_1
            , Tw.bg_white
            , Tw.ring_1
            , Tw.ring_black
            , Tw.ring_opacity_5
            , Tw.z_10
            , Css.focus
                [ Tw.outline_none
                ]
            ]
        , Attr.attribute "role" "menu"
        , Attr.attribute "aria-orientation" "vertical"
        , Attr.attribute "aria-labelledby" "user-menu-button"
        , Attr.tabindex -1
        ]
        [ {- Active: "bg-gray-100", Not Active: "" -}
          a
            [ Attr.href "#"
            , css
                [ Tw.block
                , Tw.px_4
                , Tw.py_2
                , Tw.text_sm
                , Tw.text_gray_700
                ]
            , Attr.attribute "role" "menuitem"
            , Attr.tabindex -1
            , Attr.id "user-menu-item-0"
            ]
            [ text "Your Profile" ]
        , a
            [ Attr.href "#"
            , css
                [ Tw.block
                , Tw.px_4
                , Tw.py_2
                , Tw.text_sm
                , Tw.text_gray_700
                ]
            , Attr.attribute "role" "menuitem"
            , Attr.tabindex -1
            , Attr.id "user-menu-item-1"
            ]
            [ text "Settings" ]
        , a
            [ Attr.href "#"
            , css
                [ Tw.block
                , Tw.px_4
                , Tw.py_2
                , Tw.text_sm
                , Tw.text_gray_700
                ]
            , Attr.attribute "role" "menuitem"
            , Attr.tabindex -1
            , Attr.id "user-menu-item-2"
            ]
            [ text "Sign out " ]
        ]


profileButton =
    div []
        [ button
            [ Attr.type_ "button"
            , css
                [ Tw.max_w_xs
                , Tw.bg_white
                , Tw.flex
                , Tw.items_center
                , Tw.text_sm
                , Tw.rounded_full
                , Css.focus
                    [ Tw.outline_none
                    , Tw.ring_2
                    , Tw.ring_offset_2
                    , Tw.ring_indigo_500
                    ]
                ]
            , Attr.id "user-menu-button"
            , Attr.attribute "aria-expanded" "false"
            , Attr.attribute "aria-haspopup" "true"
            ]
            [ span
                [ css
                    [ Tw.sr_only
                    ]
                ]
                [ text "Open user menu" ]
            , img
                [ css
                    [ Tw.h_8
                    , Tw.w_8
                    , Tw.rounded_full
                    ]
                , Attr.src "https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                , Attr.alt ""
                ]
                []
            ]
        ]


notifications =
    button
        [ css
            [ Tw.bg_white
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
        ]
