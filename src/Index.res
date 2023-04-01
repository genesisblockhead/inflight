switch ReactDOM.querySelector("#root") {
| Some(e) => e->ReactDOM.Client.createRoot->ReactDOM.Client.Root.render(<App />)
| None => ()
}
