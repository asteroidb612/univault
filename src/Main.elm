module Main exposing (main)

import Browser
import Css
import Css.Global
import Html.Styled as Html exposing (..)
import Html.Styled.Attributes as Attr exposing (..)
import Html.Styled.Events as Events exposing (onClick)
import Interface exposing (vaultTable)
import Random
import Svg.Styled as Svg exposing (path, svg)
import Svg.Styled.Attributes as SvgAttr
import Tailwind.Breakpoints as Bp
import Tailwind.Utilities as Tw


main : Program () Model Msg
main =
    Browser.element
        { init = initialModel
        , view = view >> toUnstyled
        , update = update
        , subscriptions = always Sub.none
        }


type alias Vault =
    { first : Int, second : Int, third : Int }


type alias Model =
    List Vault


initialModel : flags -> ( Model, Cmd Msg )
initialModel _ =
    ( [], Random.generate GeneratedVaults (Random.list 5 vaultGenerator) )


type Msg
    = GeneratedVaults (List Vault)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GeneratedVaults vaults ->
            ( vaults, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ Css.Global.global Tw.globalStyles
        , vaultTable model
        ]



-- Generators


vaultGenerator =
    Random.map3 Vault
        vaultValueGenerator
        vaultValueGenerator
        vaultValueGenerator


vaultValueGenerator =
    Random.int 1 10
