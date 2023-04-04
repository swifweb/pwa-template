import Web

class HelloPage: PageController {
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
    @Preview override class var content: Preview.Content {
        Language.en
        Title("My hello preview")
        Size(400, 400)
        HelloPage()
    }
}
