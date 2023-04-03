@val external window: App.Window.t = "window"

%%raw("import './main.css'")

exception CanvasNotFound
exception BodyNotFound

App.Window.onload(window, () => {
  switch ReactDOM.querySelector("body") {
  | Some(body) => {
      let options = Pixi.Application.Options.make(~backgroundColor=0x2980b9)
      let app = Pixi.Application.make(~options, ())
      let view = app->Pixi.Application.view
      Pixi.View.appendChild(body, view)

      (
        async () => {
          let container = Pixi.Container.make()
          app->Pixi.Application.stage->Pixi.Container.addChildContainer(container)

          let texture = await Pixi.Assets.load("assets/bunny2.png")
          let bunny = Pixi.Sprite.make(texture)
          container->Pixi.Container.addChildSprite(bunny)

          let numerals = await Pixi.Assets.load("assets/numerals.png")
          let numerals = Pixi.Sprite.make(numerals)
          numerals->Pixi.Sprite.setTint(0xb98029)
          container->Pixi.Container.addChildSprite(numerals)

          bunny->Pixi.Sprite.setEventMode(#static)
          bunny->Pixi.Sprite.onclick(Js.log)
          let renderer = Pixi.Application.renderer(app)
          Pixi.Sprite.setX(bunny, Pixi.Renderer.getWidth(renderer) /. 2.0)
          Pixi.Sprite.setX(numerals, Pixi.Renderer.getWidth(renderer) /. 2.0)
          Pixi.Sprite.setY(numerals, Pixi.Renderer.getWidth(renderer) /. 2.0)

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
