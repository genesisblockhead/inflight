type t

@module @new external make: 'a => t = "hammerjs"

module Recognizer = {
  module Options = {
    type t = {enable: bool}
  }
  type t
  @send external set: (t, Options.t) => unit = "set"
}

@send external getRotateRecognizer: (t, @as("rotate") _) => Recognizer.t = "get"

module Event = {
  type t
}

@send external onRotate: (t, @as("rotate") _, Event.t => unit) => unit = "on"
