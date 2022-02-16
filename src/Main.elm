module Main exposing (main)

import Browser
import Css.Global
import Html.Styled exposing (div)
import Interface exposing (appShell)
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
    { vaults : List Vault, feed : List { x : Float, y : Float } }


initialModel : flags -> ( Model, Cmd Msg )
initialModel _ =
    ( { feed = [], vaults = [] }, generateMockData )


type alias FeedPoint =
    { x : Float, y : Float }


type Msg
    = GeneratedVaults (List Vault)
    | GeneratedFeed (List FeedPoint)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GeneratedVaults vaults ->
            ( { model | vaults = vaults }, Cmd.none )

        GeneratedFeed feed ->
            ( { model | feed = feed }, Cmd.none )


view : Model -> Html.Styled.Html Msg
view model =
    div []
        [ Css.Global.global Tw.globalStyles
        , appShell model.vaults model.feed
        ]



-- Generators


generateMockData : Cmd Msg
generateMockData =
    Cmd.batch
        [ Random.generate GeneratedVaults (Random.list 5 vaultGenerator)
        , Random.generate GeneratedFeed feedGenerator
        ]


feedGenerator : Random.Generator (List FeedPoint)
feedGenerator =
    let
        feedFromDeltas deltas =
            List.indexedMap Tuple.pair (1000 :: deltas)
                |> List.foldl addDeltaToFeed []
                |> List.reverse

        addDeltaToFeed ( index, delta ) feed =
            case feed of
                { y } :: rest ->
                    { x = toFloat index, y = y + delta } :: feed

                [] ->
                    { x = toFloat index, y = delta } :: feed
    in
    Random.list 100 (Random.float -50 300)
        |> Random.map feedFromDeltas


vaultGenerator : Random.Generator Vault
vaultGenerator =
    Random.map3 Vault
        vaultValueGenerator
        vaultValueGenerator
        vaultValueGenerator


vaultValueGenerator : Random.Generator Int
vaultValueGenerator =
    Random.int 1 10000
