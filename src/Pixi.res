module NamedColor = {
  type t = [
    | #black
    | #silver
    | #gray
    | #white
    | #maroon
    | #red
    | #purple
    | #fuchsia
    | #green
    | #lime
    | #olive
    | #yellow
    | #navy
    | #blue
    | #teal
    | #aqua
    | #orange
    | #aliceblue
    | #antiquewhite
    | #aquamarine
    | #azure
    | #beige
    | #bisque
    | #blanchedalmond
    | #blueviolet
    | #brown
    | #burlywood
    | #cadetblue
    | #chartreuse
    | #chocolate
    | #coral
    | #cornflowerblue
    | #cornsilk
    | #crimson
    | #cyan
    | #aqua
    | #darkblue
    | #darkcyan
    | #darkgoldenrod
    | #darkgray
    | #darkgreen
    | #darkgrey
    | #darkkhaki
    | #darkmagenta
    | #darkolivegreen
    | #darkorange
    | #darkorchid
    | #darkred
    | #darksalmon
    | #darkseagreen
    | #darkslateblue
    | #darkslategray
    | #darkslategrey
    | #darkturquoise
    | #darkviolet
    | #deeppink
    | #deepskyblue
    | #dimgray
    | #dimgrey
    | #dodgerblue
    | #firebrick
    | #floralwhite
    | #forestgreen
    | #gainsboro
    | #ghostwhite
    | #gold
    | #goldenrod
    | #greenyellow
    | #grey
    | #honeydew
    | #hotpink
    | #indianred
    | #indigo
    | #ivory
    | #khaki
    | #lavender
    | #lavenderblush
    | #lawngreen
    | #lemonchiffon
    | #lightblue
    | #lightcoral
    | #lightcyan
    | #lightgoldenrodyellow
    | #lightgray
    | #lightgreen
    | #lightgrey
    | #lightpink
    | #lightsalmon
    | #lightseagreen
    | #lightskyblue
    | #lightslategray
    | #lightslategrey
    | #lightsteelblue
    | #lightyellow
    | #limegreen
    | #linen
    | #magenta
    | #fuchsia
    | #mediumaquamarine
    | #mediumblue
    | #mediumorchid
    | #mediumpurple
    | #mediumseagreen
    | #mediumslateblue
    | #mediumspringgreen
    | #mediumturquoise
    | #mediumvioletred
    | #midnightblue
    | #mintcream
    | #mistyrose
    | #moccasin
    | #navajowhite
    | #oldlace
    | #olivedrab
    | #orangered
    | #orchid
    | #palegoldenrod
    | #palegreen
    | #paleturquoise
    | #palevioletred
    | #papayawhip
    | #peachpuff
    | #peru
    | #pink
    | #plum
    | #powderblue
    | #rosybrown
    | #royalblue
    | #saddlebrown
    | #salmon
    | #sandybrown
    | #seagreen
    | #seashell
    | #sienna
    | #skyblue
    | #slateblue
    | #slategray
    | #slategrey
    | #snow
    | #springgreen
    | #steelblue
    | #tan
    | #thistle
    | #tomato
    | #turquoise
    | #violet
    | #wheat
    | #whitesmoke
    | #yellowgreen
    | #rebeccapurple
  ]
}

type sprite
type point
type graphics
type container

module HTMLElement = {
  type t
}

module FederatedPointerEvent = {
  type t
}

module EventMode = {
  type t = [#none | #passive | #auto | #static | #dynamic]
}

module DisplayObject = {
  module DestroyOptions = {
    type t
    @obj external make: (~children: bool=?, ~texture: bool=?, ~baseTexture: bool=?, unit) => t = ""
  }
  module Make = (
    R: {
      type t
    },
  ) => {
    // properties
    @get external getAlpha: R.t => float = "alpha"
    @set external setAlpha: (R.t, float) => unit = "alpha"
    @get external getRotation: R.t => float = "rotation"
    @set external setRotation: (R.t, ~radians: float) => unit = "rotation"
    @get external getPosition: R.t => point = "position"
    @set external setPosition: (R.t, point) => unit = "position"
    @get external getEventMode: R.t => EventMode.t = "eventMode"
    @set external setEventMode: (R.t, @as("string") EventMode.t) => unit = "eventMode"

    @set external onclick: (R.t, FederatedPointerEvent.t => unit) => unit = "onclick"
    @set
    external onglobalmousemove: (R.t, FederatedPointerEvent.t => unit) => unit = "onglobalmousemove"
    @set
    external onglobalpointermove: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onglobalpointermove"
    @set
    external onglobaltouchmove: (R.t, FederatedPointerEvent.t => unit) => unit = "onglobaltouchmove"
    @set external onmousedown: (R.t, FederatedPointerEvent.t => unit) => unit = "onmousedown"
    @set external onmouseenter: (R.t, FederatedPointerEvent.t => unit) => unit = "onmouseenter"
    @set
    external onmouseentercapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onmouseentercapture"
    @set external onmouseleave: (R.t, FederatedPointerEvent.t => unit) => unit = "onmouseleave"
    @set
    external onmouseleavecapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onmouseleavecapture"
    @set external onmousemove: (R.t, FederatedPointerEvent.t => unit) => unit = "onmousemove"
    @set
    external onmousemovecapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onmousemovecapture"
    @set external onmouseout: (R.t, FederatedPointerEvent.t => unit) => unit = "onmouseout"
    @set
    external onmouseoutcapture: (R.t, FederatedPointerEvent.t => unit) => unit = "onmouseoutcapture"
    @set external onmouseover: (R.t, FederatedPointerEvent.t => unit) => unit = "onmouseover"
    @set
    external onmouseovercapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onmouseovercapture"
    @set external onmouseup: (R.t, FederatedPointerEvent.t => unit) => unit = "onmouseup"
    @set
    external onmouseupcapture: (R.t, FederatedPointerEvent.t => unit) => unit = "onmouseupcapture"
    @set
    external onmouseupoutside: (R.t, FederatedPointerEvent.t => unit) => unit = "onmouseupoutside"
    @set
    external onmouseupoutsidecapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onmouseupoutsidecapture"
    @set
    external onpointercancel: (R.t, FederatedPointerEvent.t => unit) => unit = "onpointercancel"
    @set
    external onpointercancelcapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onpointercancelcapture"
    @set external onpointerdown: (R.t, FederatedPointerEvent.t => unit) => unit = "onpointerdown"
    @set
    external onpointerdowncapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onpointerdowncapture"
    @set external onpointerenter: (R.t, FederatedPointerEvent.t => unit) => unit = "onpointerenter"
    @set
    external onpointerentercapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onpointerentercapture"
    @set external onpointerleave: (R.t, FederatedPointerEvent.t => unit) => unit = "onpointerleave"
    @set
    external onpointerleavecapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onpointerleavecapture"
    @set external onpointermove: (R.t, FederatedPointerEvent.t => unit) => unit = "onpointermove"
    @set
    external onpointermovecapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onpointermovecapture"
    @set external onpointerout: (R.t, FederatedPointerEvent.t => unit) => unit = "onpointerout"
    @set
    external onpointeroutcapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onpointeroutcapture"
    @set external onpointerover: (R.t, FederatedPointerEvent.t => unit) => unit = "onpointerover"
    @set
    external onpointerovercapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onpointerovercapture"
    @set external onpointertap: (R.t, FederatedPointerEvent.t => unit) => unit = "onpointertap"
    @set
    external onpointertapcapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onpointertapcapture"
    @set external onpointerup: (R.t, FederatedPointerEvent.t => unit) => unit = "onpointerup"
    @set
    external onpointerupcapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onpointerupcapture"
    @set
    external onpointerupoutside: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onpointerupoutside"
    @set
    external onpointerupoutsidecapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onpointerupoutsidecapture"
    @set external onrightclick: (R.t, FederatedPointerEvent.t => unit) => unit = "onrightclick"
    @set
    external onrightclickcapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onrightclickcapture"
    @set external onrightdown: (R.t, FederatedPointerEvent.t => unit) => unit = "onrightdown"
    @set
    external onrightdowncapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onrightdowncapture"
    @set external onrightup: (R.t, FederatedPointerEvent.t => unit) => unit = "onrightup"
    @set
    external onrightupcapture: (R.t, FederatedPointerEvent.t => unit) => unit = "onrightupcapture"
    @set
    external onrightupoutside: (R.t, FederatedPointerEvent.t => unit) => unit = "onrightupoutside"
    @set
    external onrightupoutsidecapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "onrightupoutsidecapture"
    @set external ontap: (R.t, FederatedPointerEvent.t => unit) => unit = "ontap"
    @set external ontapcapture: (R.t, FederatedPointerEvent.t => unit) => unit = "ontapcapture"
    @set external ontouchcancel: (R.t, FederatedPointerEvent.t => unit) => unit = "ontouchcancel"
    @set
    external ontouchcancelcapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "ontouchcancelcapture"
    @set external ontouchend: (R.t, FederatedPointerEvent.t => unit) => unit = "ontouchend"
    @set
    external ontouchendcapture: (R.t, FederatedPointerEvent.t => unit) => unit = "ontouchendcapture"
    @set external ontouchoutside: (R.t, FederatedPointerEvent.t => unit) => unit = "ontouchoutside"
    @set
    external ontouchoutsidecapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "ontouchoutsidecapture"
    @set external ontouchmove: (R.t, FederatedPointerEvent.t => unit) => unit = "ontouchmove"
    @set
    external ontouchmovecapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "ontouchmovecapture"
    @set external ontouchstart: (R.t, FederatedPointerEvent.t => unit) => unit = "ontouchstart"
    @set
    external ontouchstartcapture: (R.t, FederatedPointerEvent.t => unit) => unit =
      "ontouchstartcapture"
    @set external onwheel: (R.t, FederatedPointerEvent.t => unit) => unit = "onwheel"
    @set external onwheelcapture: (R.t, FederatedPointerEvent.t => unit) => unit = "onwheelcapture"

    @set external onremoved: (R.t, container => unit) => unit = "onremoved"

    @send external destroy: (R.t, ~options: DestroyOptions.t=?, unit) => unit = "destroy"
  }

  type t
  include Make({
    type t = t
  })
}

module Tintable = {
  module Make = (
    R: {
      type t
    },
  ) => {
    @set external setTint: (R.t, int) => unit = "tint"
  }
}

module Positionable = {
  module Make = (
    R: {
      type t
    },
  ) => {
    @set external setX: (R.t, float) => unit = "x"
    @set external setY: (R.t, float) => unit = "y"
    @get external getX: R.t => float = "x"
    @get external getY: R.t => float = "y"
  }
}

module Canvas = {
  type t
  @send external appendChild: (Dom.element, t) => unit = "appendChild"
}

module Rectangle = {
  module Make = (
    R: {
      type t
    },
  ) => {
    @get external getWidth: R.t => float = "width"
    @get external getHeight: R.t => float = "height"
  }
  type t
  @module("pixi.js") @new
  external make: (~xLeft: float, ~yUpper: float, ~width: float, ~height: float) => t = "Rectangle"
}

module Ticker = {
  type t
  @send external add: (t, float => unit) => unit = "add"
}

module Container = {
  module Make = (
    R: {
      type t
    },
  ) => {
    include DisplayObject.Make({
      type t = R.t
    })
    @get external children: R.t => array<DisplayObject.t> = "children"
    @send external addChildSprite: (R.t, sprite) => unit = "addChild"
    @send external addChildContainer: (R.t, R.t) => unit = "addChild"
    @send external addChildGraphics: (R.t, graphics) => unit = "addChild"
    @send external removeChildContainer: (R.t, R.t) => unit = "removeChild"
    @get external getWidth: R.t => float = "width"
    @get external getHeight: R.t => float = "height"
    @set external setWidth: (R.t, float) => unit = "width"
    @set external setHeight: (R.t, float) => unit = "height"
  }
  type t = container
  @module("pixi.js") @new external make: unit => t = "Container"
  include Make({
    type t = t
  })
}

module Graphics = {
  module LineStyle = {
    type t
    @obj
    external make: (
      ~width: float=?,
      ~color: NamedColor.t=?,
      ~alpha: float=?,
      ~alignment: float=?,
      ~native: bool=?,
      unit,
    ) => t = ""
  }

  type t = graphics
  include Container.Make({
    type t = t
  })
  @module("pixi.js") @new external make: unit => t = "Graphics"
  @send external drawCircle: (t, ~x: float, ~y: float, ~radius: float) => unit = "drawCircle"
  @send external beginFill: (t, NamedColor.t) => unit = "beginFill"
  @send external endFill: t => unit = "endFill"
  @send external lineStyle: (t, LineStyle.t) => unit = "lineStyle"
}

module CanvasRenderer = {
  type t
  include Rectangle.Make({
    type t = t
  })
}

module Texture = {
  type t
}

module Point = {
  type t
  include Positionable.Make({
    type t = t
  })
  @send external add: (t, t) => t = "add"
  @send external clone: t => t = "clone"
  @send external cross: (t, t) => float = "cross"
  @send external dot: (t, t) => float = "dot"
  @send external equals: (t, t) => bool = "equals"
  @send external magnitude: t => float = "magnitude"
  @send external magnitudeSquared: t => float = "magnitudeSquared"
  @send external multiply: (t, t) => t = "multiply"
  @send external multiplyScalar: (t, float) => t = "multiplyScalar"
  @send external normalize: t => t = "normalize"
  @send external project: (t, t) => t = "project"
  @send external reflect: (t, t) => t = "reflect"
  @send external set: (t, float, float) => unit = "set"
  @send external subtract: (t, t) => t = "subtract"
}

module Anchor = {
  type t
  @set external setX: (t, float) => unit = "x"
  @set external setY: (t, float) => unit = "y"
  @get external getX: t => float = "x"
  @get external getY: t => float = "y"
}

module Sprite = {
  type t = sprite
  @module("pixi.js") @new external make: Texture.t => t = "Sprite"

  @get external getAnchor: t => Anchor.t = "anchor"

  include Positionable.Make({
    type t = t
  })
  include Tintable.Make({
    type t = t
  })
  include DisplayObject.Make({
    type t = t
  })
}

module Assets = {
  type t
  @module("pixi.js") @scope("Assets") @val external load: string => promise<Texture.t> = "load"
}

module Application = {
  type t

  module Options = {
    type t
    @obj external make: (~backgroundColor: NamedColor.t=?) => t = ""
  }

  @module("pixi.js") @new external make: (~options: Options.t=?, unit) => t = "Application"

  @get external getRenderer: t => CanvasRenderer.t = "renderer"
  @set external setRenderer: (t, CanvasRenderer.t) => unit = "renderer"

  @get external getResizeTo: t => HTMLElement.t = "resizeTo"
  @set external setResizeTo: (t, HTMLElement.t) => unit = "resizeTo"

  @get external screen: t => Rectangle.t = "screen"

  @get external getStage: t => Container.t = "stage"
  @set external setStage: (t, Container.t) => unit = "stage"

  @get external getTicker: t => Ticker.t = "ticker"
  @set external setTicker: (t, Ticker.t) => unit = "ticker"

  @get external view: t => Canvas.t = "view"
}
