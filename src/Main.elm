module Main exposing (main)

import Browser
import Css.Global
import Html.Styled exposing (div)
import Interface exposing (vaultTable)
import Random
import Tailwind.Utilities as Tw


main : Program () Model Msg
main =
    Browser.element
        { init = initialModel
        , view = view >> Html.Styled.toUnstyled
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
update msg _ =
    case msg of
        GeneratedVaults vaults ->
            ( vaults, Cmd.none )


view : Model -> Html.Styled.Html Msg
view model =
    div []
        [ Css.Global.global Tw.globalStyles
        , vaultTable model
        ]



-- Generators

vaultGenerator : Random.Generator Vault
vaultGenerator =
    Random.map3 Vault
        vaultValueGenerator
        vaultValueGenerator
        vaultValueGenerator

vaultValueGenerator : Random.Generator Int
vaultValueGenerator =
    Random.int 1 10000
