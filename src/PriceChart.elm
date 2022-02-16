module PriceChart exposing (chart)

import Chart as C
import Chart.Attributes as CA
import Html.Styled


chart data =
    Html.Styled.fromUnstyled <|
        C.chart
            [ CA.height 300
            , CA.width 1300
            , CA.padding { top = 10, bottom = 5, left = 10, right = 10 }
            ]
            [ C.xLabels []
            , C.yLabels [ CA.withGrid ]
            , C.series .x
                [ C.interpolated .y [ CA.monotone ] [ CA.circle ] ]
                data
            ]
