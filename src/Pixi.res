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
  @set external setX: (t, float) => unit = "x"
  @set external setY: (t, float) => unit = "y"
  @get external getX: t => float = "x"
  @get external getY: t => float = "y"
}

module Anchor = {
  type t
  @set external setX: (t, float) => unit = "x"
  @set external setY: (t, float) => unit = "y"
  @get external getX: t => float = "x"
  @get external getY: t => float = "y"
}

module Sprite = {
  type t
  @module("pixi.js") @new external make: Texture.t => t = "Sprite"

  @set external setX: (t, float) => unit = "x"
  @set external setY: (t, float) => unit = "y"

  @get external getAnchor: t => Anchor.t = "anchor"
}

module Assets = {
  type t
  @module("pixi.js") @scope("Assets") @val external load: string => promise<Texture.t> = "load"
}

module Stage = {
  type t
  @send external addChildSprite: (t, Sprite.t) => unit = "addChild"
}

module Application = {
  type t
  @module("pixi.js") @new external make: unit => t = "Application"

  @get external view: t => View.t = "view"
  @get external renderer: t => Renderer.t = "renderer"
  @get external ticker: t => Ticker.t = "ticker"
  @get external stage: t => Stage.t = "stage"
}
