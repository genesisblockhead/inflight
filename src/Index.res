@val external window: App.Window.t = "window"

%%raw("import './main.css'")

exception CanvasNotFound
exception BodyNotFound

module Shape = {
  module Circle = {
    let make = (~fill=?, ~position=?, ~x=?, ~y=?, ~linestyle=?, ~radius, ()) => {
      open Pixi
      let g = Graphics.make()
      switch fill {
      | Some(fill) => g->Graphics.beginFill(fill)
      | None => ()
      }
      let (x, y) = switch position {
      | Some(position) => (position->Point.getX, position->Point.getY)
      | None => (Js.Option.getWithDefault(0.0, x), Js.Option.getWithDefault(0.0, y))
      }
      switch linestyle {
      | Some(linestyle) => g->Graphics.lineStyle(linestyle)
      | None => ()
      }
      g->Graphics.drawCircle(~x, ~y, ~radius)
      g->Graphics.endFill
      g
    }
  }
}

App.Window.onload(window, () => {
  switch ReactDOM.querySelector("body") {
  | Some(body) => {
      let options = Pixi.Application.Options.make(~backgroundColor=#white)
      let app = Pixi.Application.make(~options, ())
      let view = app->Pixi.Application.view
      Pixi.Canvas.appendChild(body, view)

      (
        async () => {
          let container = Pixi.Container.make()
          app->Pixi.Application.getStage->Pixi.Container.addChildContainer(container)

          let texture = await Pixi.Assets.load("assets/bunny2.png")
          let bunny = Pixi.Sprite.make(texture)
          container->Pixi.Container.addChildSprite(bunny)

          let numerals = await Pixi.Assets.load("assets/numerals.png")
          let numerals = Pixi.Sprite.make(numerals)
          numerals->Pixi.Sprite.setTint(0xb98029)
          container->Pixi.Container.addChildSprite(numerals)

          bunny->Pixi.Sprite.setEventMode(#static)
          let renderer = Pixi.Application.getRenderer(app)
          bunny->Pixi.Sprite.onclick(event => {
            open Pixi
            Js.log(event)
            app->Application.getStage->Container.removeChildContainer(container)
            container->Container.destroy()
            let container = Container.make()
            let h = CanvasRenderer.getWidth(renderer)
            let w = CanvasRenderer.getHeight(renderer)
            let x = h *. 0.75
            let y = w /. 2.0
            let radius = 0.10 *. Js.Math.min_float(h, w)
            let graphics = Shape.Circle.make(
              ~fill=#yellow,
              ~x,
              ~y,
              ~radius,
              ~linestyle=Graphics.LineStyle.make(~width=8., ~color=#black, ()),
              (),
            )
            app->Application.getStage->Container.addChildContainer(container)
            container->Container.addChildGraphics(graphics)
          })
          Pixi.Sprite.setX(bunny, Pixi.CanvasRenderer.getWidth(renderer) /. 2.0)
          Pixi.Sprite.setX(numerals, Pixi.CanvasRenderer.getWidth(renderer) /. 2.0)
          Pixi.Sprite.setY(numerals, Pixi.CanvasRenderer.getWidth(renderer) /. 2.0)

          let elapsed = ref(0.0)
          app
          ->Pixi.Application.getTicker
          ->Pixi.Ticker.add(delta => {
            elapsed := elapsed.contents +. delta
            Pixi.Sprite.setX(bunny, 100.0 +. Js.Math.cos(elapsed.contents /. 50.0) *. 100.0)
          })
        }
      )() |> ignore
    }
  | None => raise(BodyNotFound)
  }
})

switch ReactDOM.querySelector("#root") {
| Some(e) => e->ReactDOM.Client.createRoot->ReactDOM.Client.Root.render(<App />)
| None => Js.log("not found")
}
