type sprite
type point

module FederatedPointerEvent = {
  type t
}

module EventMode = {
  type t = [#none | #passive | #auto | #static | #dynamic]
}

module DisplayObject = {
  module Make = (
    R: {
      type t
    },
  ) => {
    @get external getAlpha: R.t => float = "alpha"
    @set external setAlpha: (R.t, float) => unit = "alpha"
    @get external getRotation: R.t => float = "rotation"
    @set external setRotation: (R.t, float) => unit = "rotation"
    @get external getPosition: R.t => point = "position"
    @set external setPosition: (R.t, point) => unit = "position"

    @get external getEventMode: R.t => EventMode.t = "eventMode"
    @set external setEventMode: (R.t, @as("string") EventMode.t) => unit = "eventMode"
    @set external onclick: (R.t, FederatedPointerEvent.t => unit) => unit = "onclick"
  }
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

module View = {
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
}

module Ticker = {
  type t
  @send external add: (t, float => unit) => unit = "add"
}

module Container = {
  type t
  @module("pixi.js") @new external make: unit => t = "Container"
  @send external addChildSprite: (t, sprite) => unit = "addChild"
  @send external addChildContainer: (t, t) => unit = "addChild"
  @send external destroy: t => unit = "destroy"
}

module Renderer = {
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
    @obj external make: (~backgroundColor: int=?) => t = ""
  }

  @module("pixi.js") @new external make: (~options: Options.t=?, unit) => t = "Application"

  @get external view: t => View.t = "view"
  @get external renderer: t => Renderer.t = "renderer"
  @get external ticker: t => Ticker.t = "ticker"
  @get external stage: t => Container.t = "stage"
}
