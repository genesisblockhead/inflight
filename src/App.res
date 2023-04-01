module Window = {
  type t
  @set external onload: (t, unit => unit) => unit = "onload"
}

@react.component
let make = () => {
  <canvas />
}
