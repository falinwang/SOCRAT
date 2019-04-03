'use strict'

BaseService = require 'scripts/BaseClasses/BaseService.coffee'

module.exports = class ChartsLineChart extends BaseService
  @inject '$q',
    '$stateParams',
    'app_analysis_charts_dataTransform',
    'app_analysis_charts_list',
    'app_analysis_charts_sendData',
    'app_analysis_charts_checkTime',
    'app_analysis_charts_dataService',
    'app_analysis_charts_msgService'

  initialize: ->
    @msgService = @app_analysis_charts_msgService
    @dataService = @app_analysis_charts_dataService
    @dataTransform = @app_analysis_charts_dataTransform
    @list = @app_analysis_charts_list
    @sendData = @app_analysis_charts_sendData
    @checkTime = @app_analysis_charts_checkTime
    @DATA_TYPES = @dataService.getDataTypes()

    @ve = require 'vega-embed'
    @vt = require 'vega-tooltip/build/vega-tooltip.js'

  drawSunburst: (data,labels,container) ->

    container.select("#slider").remove()
    container.select("#maxbins").remove()

    vlSpec = {
      "$schema": "https://vega.github.io/schema/vega/v4.json",
      "width": 600,
      "height": 600,
      "padding": 5,
      "autosize": "none",

      "data": [
        {
          "name": "tree",
          "values": [
            {
              "id": 1,
              "name": "flare"
            },
            {
              "id": 2,
              "name": "analytics",
              "parent": 1
            },
            {
              "id": 3,
              "name": "cluster",
              "parent": 2
            },
            {
              "id": 4,
              "name": "AgglomerativeCluster",
              "parent": 3,
              "size": 3938
            },
            {
              "id": 5,
              "name": "CommunityStructure",
              "parent": 3,
              "size": 3812
            },
            {
              "id": 6,
              "name": "HierarchicalCluster",
              "parent": 3,
              "size": 6714
            },
            {
              "id": 7,
              "name": "MergeEdge",
              "parent": 3,
              "size": 743
            },
            {
              "id": 8,
              "name": "graph",
              "parent": 2
            },
            {
              "id": 9,
              "name": "BetweennessCentrality",
              "parent": 8,
              "size": 3534
            },
            {
              "id": 10,
              "name": "LinkDistance",
              "parent": 8,
              "size": 5731
            },
            {
              "id": 11,
              "name": "MaxFlowMinCut",
              "parent": 8,
              "size": 7840
            },
            {
              "id": 12,
              "name": "ShortestPaths",
              "parent": 8,
              "size": 5914
            },
            {
              "id": 13,
              "name": "SpanningTree",
              "parent": 8,
              "size": 3416
            },
            {
              "id": 14,
              "name": "optimization",
              "parent": 2
            },
            {
              "id": 15,
              "name": "AspectRatioBanker",
              "parent": 14,
              "size": 7074
            },
            {
              "id": 16,
              "name": "animate",
              "parent": 1
            },
            {
              "id": 17,
              "name": "Easing",
              "parent": 16,
              "size": 17010
            },
            {
              "id": 18,
              "name": "FunctionSequence",
              "parent": 16,
              "size": 5842
            },
            {
              "id": 19,
              "name": "interpolate",
              "parent": 16
            },
            {
              "id": 20,
              "name": "ArrayInterpolator",
              "parent": 19,
              "size": 1983
            },
            {
              "id": 21,
              "name": "ColorInterpolator",
              "parent": 19,
              "size": 2047
            },
            {
              "id": 22,
              "name": "DateInterpolator",
              "parent": 19,
              "size": 1375
            },
            {
              "id": 23,
              "name": "Interpolator",
              "parent": 19,
              "size": 8746
            },
            {
              "id": 24,
              "name": "MatrixInterpolator",
              "parent": 19,
              "size": 2202
            },
            {
              "id": 25,
              "name": "NumberInterpolator",
              "parent": 19,
              "size": 1382
            },
            {
              "id": 26,
              "name": "ObjectInterpolator",
              "parent": 19,
              "size": 1629
            },
            {
              "id": 27,
              "name": "PointInterpolator",
              "parent": 19,
              "size": 1675
            },
            {
              "id": 28,
              "name": "RectangleInterpolator",
              "parent": 19,
              "size": 2042
            },
            {
              "id": 29,
              "name": "ISchedulable",
              "parent": 16,
              "size": 1041
            },
            {
              "id": 30,
              "name": "Parallel",
              "parent": 16,
              "size": 5176
            },
            {
              "id": 31,
              "name": "Pause",
              "parent": 16,
              "size": 449
            },
            {
              "id": 32,
              "name": "Scheduler",
              "parent": 16,
              "size": 5593
            },
            {
              "id": 33,
              "name": "Sequence",
              "parent": 16,
              "size": 5534
            },
            {
              "id": 34,
              "name": "Transition",
              "parent": 16,
              "size": 9201
            },
            {
              "id": 35,
              "name": "Transitioner",
              "parent": 16,
              "size": 19975
            },
            {
              "id": 36,
              "name": "TransitionEvent",
              "parent": 16,
              "size": 1116
            },
            {
              "id": 37,
              "name": "Tween",
              "parent": 16,
              "size": 6006
            },
            {
              "id": 38,
              "name": "data",
              "parent": 1
            },
            {
              "id": 39,
              "name": "converters",
              "parent": 38
            },
            {
              "id": 40,
              "name": "Converters",
              "parent": 39,
              "size": 721
            },
            {
              "id": 41,
              "name": "DelimitedTextConverter",
              "parent": 39,
              "size": 4294
            },
            {
              "id": 42,
              "name": "GraphMLConverter",
              "parent": 39,
              "size": 9800
            },
            {
              "id": 43,
              "name": "IDataConverter",
              "parent": 39,
              "size": 1314
            },
            {
              "id": 44,
              "name": "JSONConverter",
              "parent": 39,
              "size": 2220
            },
            {
              "id": 45,
              "name": "DataField",
              "parent": 38,
              "size": 1759
            },
            {
              "id": 46,
              "name": "DataSchema",
              "parent": 38,
              "size": 2165
            },
            {
              "id": 47,
              "name": "DataSet",
              "parent": 38,
              "size": 586
            },
            {
              "id": 48,
              "name": "DataSource",
              "parent": 38,
              "size": 3331
            },
            {
              "id": 49,
              "name": "DataTable",
              "parent": 38,
              "size": 772
            },
            {
              "id": 50,
              "name": "DataUtil",
              "parent": 38,
              "size": 3322
            },
            {
              "id": 51,
              "name": "display",
              "parent": 1
            },
            {
              "id": 52,
              "name": "DirtySprite",
              "parent": 51,
              "size": 8833
            },
            {
              "id": 53,
              "name": "LineSprite",
              "parent": 51,
              "size": 1732
            },
            {
              "id": 54,
              "name": "RectSprite",
              "parent": 51,
              "size": 3623
            },
            {
              "id": 55,
              "name": "TextSprite",
              "parent": 51,
              "size": 10066
            },
            {
              "id": 56,
              "name": "flex",
              "parent": 1
            },
            {
              "id": 57,
              "name": "FlareVis",
              "parent": 56,
              "size": 4116
            },
            {
              "id": 58,
              "name": "physics",
              "parent": 1
            },
            {
              "id": 59,
              "name": "DragForce",
              "parent": 58,
              "size": 1082
            },
            {
              "id": 60,
              "name": "GravityForce",
              "parent": 58,
              "size": 1336
            },
            {
              "id": 61,
              "name": "IForce",
              "parent": 58,
              "size": 319
            },
            {
              "id": 62,
              "name": "NBodyForce",
              "parent": 58,
              "size": 10498
            },
            {
              "id": 63,
              "name": "Particle",
              "parent": 58,
              "size": 2822
            },
            {
              "id": 64,
              "name": "Simulation",
              "parent": 58,
              "size": 9983
            },
            {
              "id": 65,
              "name": "Spring",
              "parent": 58,
              "size": 2213
            },
            {
              "id": 66,
              "name": "SpringForce",
              "parent": 58,
              "size": 1681
            },
            {
              "id": 67,
              "name": "query",
              "parent": 1
            },
            {
              "id": 68,
              "name": "AggregateExpression",
              "parent": 67,
              "size": 1616
            },
            {
              "id": 69,
              "name": "And",
              "parent": 67,
              "size": 1027
            },
            {
              "id": 70,
              "name": "Arithmetic",
              "parent": 67,
              "size": 3891
            },
            {
              "id": 71,
              "name": "Average",
              "parent": 67,
              "size": 891
            },
            {
              "id": 72,
              "name": "BinaryExpression",
              "parent": 67,
              "size": 2893
            },
            {
              "id": 73,
              "name": "Comparison",
              "parent": 67,
              "size": 5103
            },
            {
              "id": 74,
              "name": "CompositeExpression",
              "parent": 67,
              "size": 3677
            },
            {
              "id": 75,
              "name": "Count",
              "parent": 67,
              "size": 781
            },
            {
              "id": 76,
              "name": "DateUtil",
              "parent": 67,
              "size": 4141
            },
            {
              "id": 77,
              "name": "Distinct",
              "parent": 67,
              "size": 933
            },
            {
              "id": 78,
              "name": "Expression",
              "parent": 67,
              "size": 5130
            },
            {
              "id": 79,
              "name": "ExpressionIterator",
              "parent": 67,
              "size": 3617
            },
            {
              "id": 80,
              "name": "Fn",
              "parent": 67,
              "size": 3240
            },
            {
              "id": 81,
              "name": "If",
              "parent": 67,
              "size": 2732
            },
            {
              "id": 82,
              "name": "IsA",
              "parent": 67,
              "size": 2039
            },
            {
              "id": 83,
              "name": "Literal",
              "parent": 67,
              "size": 1214
            },
            {
              "id": 84,
              "name": "Match",
              "parent": 67,
              "size": 3748
            },
            {
              "id": 85,
              "name": "Maximum",
              "parent": 67,
              "size": 843
            },
            {
              "id": 86,
              "name": "methods",
              "parent": 67
            },
            {
              "id": 87,
              "name": "add",
              "parent": 86,
              "size": 593
            },
            {
              "id": 88,
              "name": "and",
              "parent": 86,
              "size": 330
            },
            {
              "id": 89,
              "name": "average",
              "parent": 86,
              "size": 287
            },
            {
              "id": 90,
              "name": "count",
              "parent": 86,
              "size": 277
            },
            {
              "id": 91,
              "name": "distinct",
              "parent": 86,
              "size": 292
            },
            {
              "id": 92,
              "name": "div",
              "parent": 86,
              "size": 595
            },
            {
              "id": 93,
              "name": "eq",
              "parent": 86,
              "size": 594
            },
            {
              "id": 94,
              "name": "fn",
              "parent": 86,
              "size": 460
            },
            {
              "id": 95,
              "name": "gt",
              "parent": 86,
              "size": 603
            },
            {
              "id": 96,
              "name": "gte",
              "parent": 86,
              "size": 625
            },
            {
              "id": 97,
              "name": "iff",
              "parent": 86,
              "size": 748
            },
            {
              "id": 98,
              "name": "isa",
              "parent": 86,
              "size": 461
            },
            {
              "id": 99,
              "name": "lt",
              "parent": 86,
              "size": 597
            },
            {
              "id": 100,
              "name": "lte",
              "parent": 86,
              "size": 619
            },
            {
              "id": 101,
              "name": "max",
              "parent": 86,
              "size": 283
            },
            {
              "id": 102,
              "name": "min",
              "parent": 86,
              "size": 283
            },
            {
              "id": 103,
              "name": "mod",
              "parent": 86,
              "size": 591
            },
            {
              "id": 104,
              "name": "mul",
              "parent": 86,
              "size": 603
            },
            {
              "id": 105,
              "name": "neq",
              "parent": 86,
              "size": 599
            },
            {
              "id": 106,
              "name": "not",
              "parent": 86,
              "size": 386
            },
            {
              "id": 107,
              "name": "or",
              "parent": 86,
              "size": 323
            },
            {
              "id": 108,
              "name": "orderby",
              "parent": 86,
              "size": 307
            },
            {
              "id": 109,
              "name": "range",
              "parent": 86,
              "size": 772
            },
            {
              "id": 110,
              "name": "select",
              "parent": 86,
              "size": 296
            },
            {
              "id": 111,
              "name": "stddev",
              "parent": 86,
              "size": 363
            },
            {
              "id": 112,
              "name": "sub",
              "parent": 86,
              "size": 600
            },
            {
              "id": 113,
              "name": "sum",
              "parent": 86,
              "size": 280
            },
            {
              "id": 114,
              "name": "update",
              "parent": 86,
              "size": 307
            },
            {
              "id": 115,
              "name": "variance",
              "parent": 86,
              "size": 335
            },
            {
              "id": 116,
              "name": "where",
              "parent": 86,
              "size": 299
            },
            {
              "id": 117,
              "name": "xor",
              "parent": 86,
              "size": 354
            },
            {
              "id": 118,
              "name": "_",
              "parent": 86,
              "size": 264
            },
            {
              "id": 119,
              "name": "Minimum",
              "parent": 67,
              "size": 843
            },
            {
              "id": 120,
              "name": "Not",
              "parent": 67,
              "size": 1554
            },
            {
              "id": 121,
              "name": "Or",
              "parent": 67,
              "size": 970
            },
            {
              "id": 122,
              "name": "Query",
              "parent": 67,
              "size": 13896
            },
            {
              "id": 123,
              "name": "Range",
              "parent": 67,
              "size": 1594
            },
            {
              "id": 124,
              "name": "StringUtil",
              "parent": 67,
              "size": 4130
            },
            {
              "id": 125,
              "name": "Sum",
              "parent": 67,
              "size": 791
            },
            {
              "id": 126,
              "name": "Variable",
              "parent": 67,
              "size": 1124
            },
            {
              "id": 127,
              "name": "Variance",
              "parent": 67,
              "size": 1876
            },
            {
              "id": 128,
              "name": "Xor",
              "parent": 67,
              "size": 1101
            },
            {
              "id": 129,
              "name": "scale",
              "parent": 1
            },
            {
              "id": 130,
              "name": "IScaleMap",
              "parent": 129,
              "size": 2105
            },
            {
              "id": 131,
              "name": "LinearScale",
              "parent": 129,
              "size": 1316
            },
            {
              "id": 132,
              "name": "LogScale",
              "parent": 129,
              "size": 3151
            },
            {
              "id": 133,
              "name": "OrdinalScale",
              "parent": 129,
              "size": 3770
            },
            {
              "id": 134,
              "name": "QuantileScale",
              "parent": 129,
              "size": 2435
            },
            {
              "id": 135,
              "name": "QuantitativeScale",
              "parent": 129,
              "size": 4839
            },
            {
              "id": 136,
              "name": "RootScale",
              "parent": 129,
              "size": 1756
            },
            {
              "id": 137,
              "name": "Scale",
              "parent": 129,
              "size": 4268
            },
            {
              "id": 138,
              "name": "ScaleType",
              "parent": 129,
              "size": 1821
            },
            {
              "id": 139,
              "name": "TimeScale",
              "parent": 129,
              "size": 5833
            },
            {
              "id": 140,
              "name": "util",
              "parent": 1
            },
            {
              "id": 141,
              "name": "Arrays",
              "parent": 140,
              "size": 8258
            },
            {
              "id": 142,
              "name": "Colors",
              "parent": 140,
              "size": 10001
            },
            {
              "id": 143,
              "name": "Dates",
              "parent": 140,
              "size": 8217
            },
            {
              "id": 144,
              "name": "Displays",
              "parent": 140,
              "size": 12555
            },
            {
              "id": 145,
              "name": "Filter",
              "parent": 140,
              "size": 2324
            },
            {
              "id": 146,
              "name": "Geometry",
              "parent": 140,
              "size": 10993
            },
            {
              "id": 147,
              "name": "heap",
              "parent": 140
            },
            {
              "id": 148,
              "name": "FibonacciHeap",
              "parent": 147,
              "size": 9354
            },
            {
              "id": 149,
              "name": "HeapNode",
              "parent": 147,
              "size": 1233
            },
            {
              "id": 150,
              "name": "IEvaluable",
              "parent": 140,
              "size": 335
            },
            {
              "id": 151,
              "name": "IPredicate",
              "parent": 140,
              "size": 383
            },
            {
              "id": 152,
              "name": "IValueProxy",
              "parent": 140,
              "size": 874
            },
            {
              "id": 153,
              "name": "math",
              "parent": 140
            },
            {
              "id": 154,
              "name": "DenseMatrix",
              "parent": 153,
              "size": 3165
            },
            {
              "id": 155,
              "name": "IMatrix",
              "parent": 153,
              "size": 2815
            },
            {
              "id": 156,
              "name": "SparseMatrix",
              "parent": 153,
              "size": 3366
            },
            {
              "id": 157,
              "name": "Maths",
              "parent": 140,
              "size": 17705
            },
            {
              "id": 158,
              "name": "Orientation",
              "parent": 140,
              "size": 1486
            },
            {
              "id": 159,
              "name": "palette",
              "parent": 140
            },
            {
              "id": 160,
              "name": "ColorPalette",
              "parent": 159,
              "size": 6367
            },
            {
              "id": 161,
              "name": "Palette",
              "parent": 159,
              "size": 1229
            },
            {
              "id": 162,
              "name": "ShapePalette",
              "parent": 159,
              "size": 2059
            },
            {
              "id": 163,
              "name": "SizePalette",
              "parent": 159,
              "size": 2291
            },
            {
              "id": 164,
              "name": "Property",
              "parent": 140,
              "size": 5559
            },
            {
              "id": 165,
              "name": "Shapes",
              "parent": 140,
              "size": 19118
            },
            {
              "id": 166,
              "name": "Sort",
              "parent": 140,
              "size": 6887
            },
            {
              "id": 167,
              "name": "Stats",
              "parent": 140,
              "size": 6557
            },
            {
              "id": 168,
              "name": "Strings",
              "parent": 140,
              "size": 22026
            },
            {
              "id": 169,
              "name": "vis",
              "parent": 1
            },
            {
              "id": 170,
              "name": "axis",
              "parent": 169
            },
            {
              "id": 171,
              "name": "Axes",
              "parent": 170,
              "size": 1302
            },
            {
              "id": 172,
              "name": "Axis",
              "parent": 170,
              "size": 24593
            },
            {
              "id": 173,
              "name": "AxisGridLine",
              "parent": 170,
              "size": 652
            },
            {
              "id": 174,
              "name": "AxisLabel",
              "parent": 170,
              "size": 636
            },
            {
              "id": 175,
              "name": "CartesianAxes",
              "parent": 170,
              "size": 6703
            },
            {
              "id": 176,
              "name": "controls",
              "parent": 169
            },
            {
              "id": 177,
              "name": "AnchorControl",
              "parent": 176,
              "size": 2138
            },
            {
              "id": 178,
              "name": "ClickControl",
              "parent": 176,
              "size": 3824
            },
            {
              "id": 179,
              "name": "Control",
              "parent": 176,
              "size": 1353
            },
            {
              "id": 180,
              "name": "ControlList",
              "parent": 176,
              "size": 4665
            },
            {
              "id": 181,
              "name": "DragControl",
              "parent": 176,
              "size": 2649
            },
            {
              "id": 182,
              "name": "ExpandControl",
              "parent": 176,
              "size": 2832
            },
            {
              "id": 183,
              "name": "HoverControl",
              "parent": 176,
              "size": 4896
            },
            {
              "id": 184,
              "name": "IControl",
              "parent": 176,
              "size": 763
            },
            {
              "id": 185,
              "name": "PanZoomControl",
              "parent": 176,
              "size": 5222
            },
            {
              "id": 186,
              "name": "SelectionControl",
              "parent": 176,
              "size": 7862
            },
            {
              "id": 187,
              "name": "TooltipControl",
              "parent": 176,
              "size": 8435
            },
            {
              "id": 188,
              "name": "data",
              "parent": 169
            },
            {
              "id": 189,
              "name": "Data",
              "parent": 188,
              "size": 20544
            },
            {
              "id": 190,
              "name": "DataList",
              "parent": 188,
              "size": 19788
            },
            {
              "id": 191,
              "name": "DataSprite",
              "parent": 188,
              "size": 10349
            },
            {
              "id": 192,
              "name": "EdgeSprite",
              "parent": 188,
              "size": 3301
            },
            {
              "id": 193,
              "name": "NodeSprite",
              "parent": 188,
              "size": 19382
            },
            {
              "id": 194,
              "name": "render",
              "parent": 188
            },
            {
              "id": 195,
              "name": "ArrowType",
              "parent": 194,
              "size": 698
            },
            {
              "id": 196,
              "name": "EdgeRenderer",
              "parent": 194,
              "size": 5569
            },
            {
              "id": 197,
              "name": "IRenderer",
              "parent": 194,
              "size": 353
            },
            {
              "id": 198,
              "name": "ShapeRenderer",
              "parent": 194,
              "size": 2247
            },
            {
              "id": 199,
              "name": "ScaleBinding",
              "parent": 188,
              "size": 11275
            },
            {
              "id": 200,
              "name": "Tree",
              "parent": 188,
              "size": 7147
            },
            {
              "id": 201,
              "name": "TreeBuilder",
              "parent": 188,
              "size": 9930
            },
            {
              "id": 202,
              "name": "events",
              "parent": 169
            },
            {
              "id": 203,
              "name": "DataEvent",
              "parent": 202,
              "size": 2313
            },
            {
              "id": 204,
              "name": "SelectionEvent",
              "parent": 202,
              "size": 1880
            },
            {
              "id": 205,
              "name": "TooltipEvent",
              "parent": 202,
              "size": 1701
            },
            {
              "id": 206,
              "name": "VisualizationEvent",
              "parent": 202,
              "size": 1117
            },
            {
              "id": 207,
              "name": "legend",
              "parent": 169
            },
            {
              "id": 208,
              "name": "Legend",
              "parent": 207,
              "size": 20859
            },
            {
              "id": 209,
              "name": "LegendItem",
              "parent": 207,
              "size": 4614
            },
            {
              "id": 210,
              "name": "LegendRange",
              "parent": 207,
              "size": 10530
            },
            {
              "id": 211,
              "name": "operator",
              "parent": 169
            },
            {
              "id": 212,
              "name": "distortion",
              "parent": 211
            },
            {
              "id": 213,
              "name": "BifocalDistortion",
              "parent": 212,
              "size": 4461
            },
            {
              "id": 214,
              "name": "Distortion",
              "parent": 212,
              "size": 6314
            },
            {
              "id": 215,
              "name": "FisheyeDistortion",
              "parent": 212,
              "size": 3444
            },
            {
              "id": 216,
              "name": "encoder",
              "parent": 211
            },
            {
              "id": 217,
              "name": "ColorEncoder",
              "parent": 216,
              "size": 3179
            },
            {
              "id": 218,
              "name": "Encoder",
              "parent": 216,
              "size": 4060
            },
            {
              "id": 219,
              "name": "PropertyEncoder",
              "parent": 216,
              "size": 4138
            },
            {
              "id": 220,
              "name": "ShapeEncoder",
              "parent": 216,
              "size": 1690
            },
            {
              "id": 221,
              "name": "SizeEncoder",
              "parent": 216,
              "size": 1830
            },
            {
              "id": 222,
              "name": "filter",
              "parent": 211
            },
            {
              "id": 223,
              "name": "FisheyeTreeFilter",
              "parent": 222,
              "size": 5219
            },
            {
              "id": 224,
              "name": "GraphDistanceFilter",
              "parent": 222,
              "size": 3165
            },
            {
              "id": 225,
              "name": "VisibilityFilter",
              "parent": 222,
              "size": 3509
            },
            {
              "id": 226,
              "name": "IOperator",
              "parent": 211,
              "size": 1286
            },
            {
              "id": 227,
              "name": "label",
              "parent": 211
            },
            {
              "id": 228,
              "name": "Labeler",
              "parent": 227,
              "size": 9956
            },
            {
              "id": 229,
              "name": "RadialLabeler",
              "parent": 227,
              "size": 3899
            },
            {
              "id": 230,
              "name": "StackedAreaLabeler",
              "parent": 227,
              "size": 3202
            },
            {
              "id": 231,
              "name": "layout",
              "parent": 211
            },
            {
              "id": 232,
              "name": "AxisLayout",
              "parent": 231,
              "size": 6725
            },
            {
              "id": 233,
              "name": "BundledEdgeRouter",
              "parent": 231,
              "size": 3727
            },
            {
              "id": 234,
              "name": "CircleLayout",
              "parent": 231,
              "size": 9317
            },
            {
              "id": 235,
              "name": "CirclePackingLayout",
              "parent": 231,
              "size": 12003
            },
            {
              "id": 236,
              "name": "DendrogramLayout",
              "parent": 231,
              "size": 4853
            },
            {
              "id": 237,
              "name": "ForceDirectedLayout",
              "parent": 231,
              "size": 8411
            },
            {
              "id": 238,
              "name": "IcicleTreeLayout",
              "parent": 231,
              "size": 4864
            },
            {
              "id": 239,
              "name": "IndentedTreeLayout",
              "parent": 231,
              "size": 3174
            },
            {
              "id": 240,
              "name": "Layout",
              "parent": 231,
              "size": 7881
            },
            {
              "id": 241,
              "name": "NodeLinkTreeLayout",
              "parent": 231,
              "size": 12870
            },
            {
              "id": 242,
              "name": "PieLayout",
              "parent": 231,
              "size": 2728
            },
            {
              "id": 243,
              "name": "RadialTreeLayout",
              "parent": 231,
              "size": 12348
            },
            {
              "id": 244,
              "name": "RandomLayout",
              "parent": 231,
              "size": 870
            },
            {
              "id": 245,
              "name": "StackedAreaLayout",
              "parent": 231,
              "size": 9121
            },
            {
              "id": 246,
              "name": "TreeMapLayout",
              "parent": 231,
              "size": 9191
            },
            {
              "id": 247,
              "name": "Operator",
              "parent": 211,
              "size": 2490
            },
            {
              "id": 248,
              "name": "OperatorList",
              "parent": 211,
              "size": 5248
            },
            {
              "id": 249,
              "name": "OperatorSequence",
              "parent": 211,
              "size": 4190
            },
            {
              "id": 250,
              "name": "OperatorSwitch",
              "parent": 211,
              "size": 2581
            },
            {
              "id": 251,
              "name": "SortOperator",
              "parent": 211,
              "size": 2023
            },
            {
              "id": 252,
              "name": "Visualization",
              "parent": 169,
              "size": 16540
            }
          ],
          "transform": [
            {
              "type": "stratify",
              "key": "id",
              "parentKey": "parent"
            },
            {
              "type": "partition",
              "field": "size",
              "sort": {"field": "value"},
              "size": [{"signal": "2 * PI"}, {"signal": "width / 2"}],
              "as": ["a0", "r0", "a1", "r1", "depth", "children"]
            }
          ]
        }
      ],

      "scales": [
        {
          "name": "color",
          "type": "ordinal",
          "range": {"scheme": "tableau20"}
        }
      ],

      "marks": [
        {
          "type": "arc",
          "from": {"data": "tree"},
          "encode": {
            "enter": {
              "x": {"signal": "width / 2"},
              "y": {"signal": "height / 2"},
              "fill": {"scale": "color", "field": "depth"},
              "tooltip": {"signal": "datum.name + (datum.size ? ', ' + datum.size + ' bytes' : '')"}
            },
            "update": {
              "startAngle": {"field": "a0"},
              "endAngle": {"field": "a1"},
              "innerRadius": {"field": "r0"},
              "outerRadius": {"field": "r1"},
              "stroke": {"value": "white"},
              "strokeWidth": {"value": 0.5},
              "zindex": {"value": 0}
            },
            "hover": {
              "stroke": {"value": "red"},
              "strokeWidth": {"value": 2},
              "zindex": {"value": 1}
            }
          }
        }
      ]
    }

    opt =
      "actions": {export: true, source: false, editor: true}

    @ve('#vis', vlSpec, opt, (error, result) -> return).then((result) =>
      return
    )

