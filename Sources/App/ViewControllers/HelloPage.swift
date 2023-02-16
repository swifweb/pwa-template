import Web

class HelloPage: ViewController {
    @DOM override var body: DOM.Content {
        P("Hello page")
            .textAlign(.center)
            .body {
                 Button("go back").display(.block).onClick {
                     History.back()
                 }
            }
        Div().width(300.px).height(300.px).background(color: .yellow).backgroundImage("https://i.ytimg.com/vi/1Ne1hqOXKKI/maxresdefault.jpg").backgroundSize(h: 200.px, v: 200.px).backgroundRepeat(.noRepeat)
    }
}

/// Live preview works in both XCode and VSCode
/// To make it work in XCode install the `XLivePreview` app
/// To make it work in VSCode install `webber` extension
class Hello_Preview: WebPreview {
    override class var title: String { "My hello preview" } // optional
    override class var width: UInt { 400 } // optional
    override class var height: UInt { 400 } // optional

    @Preview override class var content: Preview.Content {
        HelloPage()
    }
}
