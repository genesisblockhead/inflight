@val external window: App.Window.t = "window"

%%raw("import './main.css'")

exception CanvasNotFound

App.Window.onload(window, () => {
  Js.log("hello")
  switch ReactDOM.querySelector("#canvas") {
  | Some(canvas) => {
      Paper.setup(canvas)
      let path = Paper.Path.make()
      Paper.Path.setStrokeColor(path, "black")
      let start = Paper.Point.make(100., 100.)
      Paper.Path.moveTo(path, start)
      Paper.Path.lineTo(path, Paper.Point.add(start, Paper.Point.make(200., -50.)))
      Js.log(path)

      let a = Paper.Point.make(200., 200.)
      let b = Paper.Point.make(300., 250.)
      let rectangle = Paper.Path.Rectangle.make(a, b)
      Paper.Path.Rectangle.setStrokeColor(rectangle, "red")
    }
  | None => raise(CanvasNotFound)
  }
})

switch ReactDOM.querySelector("#root") {
| Some(e) => e->ReactDOM.Client.createRoot->ReactDOM.Client.Root.render(<App />)
| None => Js.log("not found")
}
