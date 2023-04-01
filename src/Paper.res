@module("paper") external setup: Dom.element => unit = "setup"

module View = {
  type t
  @send external draw: t => unit = "draw"
}

@module("paper") @val external view: View.t = "view"

module Point = {
  type t
  @module("paper") @new external make: (float, float) => t = "Point"
  @send external add: (t, t) => t = "add"
}

module Path = {
  type t
  @module("paper") @new external make: unit => t = "Path"
  @set external setStrokeColor: (t, string) => unit = "strokeColor"
  @send external moveTo: (t, Point.t) => unit = "moveTo"
  @send external lineTo: (t, Point.t) => unit = "lineTo"
}
