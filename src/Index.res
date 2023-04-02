@val external window: App.Window.t = "window"

%%raw("import './main.css'")

exception CanvasNotFound
exception BodyNotFound

App.Window.onload(window, () => {
  switch ReactDOM.querySelector("body") {
  | Some(body) => {
      let app = Pixi.Application.make()
      let view = app->Pixi.Application.view
      Pixi.View.appendChild(body, view)

      (
        async () => {
          let texture = await Pixi.Assets.load("assets/bunny.png")
          let bunny = Pixi.Sprite.make(texture)
          app->Pixi.Application.stage->Pixi.Stage.addChildSprite(bunny)
          let renderer = Pixi.Application.renderer(app)
          Pixi.Sprite.setX(bunny, Pixi.Renderer.getWidth(renderer) /. 2.0)

          let elapsed = ref(0.0)
          app
          ->Pixi.Application.ticker
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
