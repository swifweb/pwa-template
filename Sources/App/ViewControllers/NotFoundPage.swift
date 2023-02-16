import Web

class NotFoundPage: ViewController {
    @DOM override var body: DOM.Content {
        P("this is catchall aka 404 NOT FOUND page")
            .textAlign(.center)
            .body {
                Button("go back").display(.block).onClick {
                    History.back()
                }
            }
    }
}

/// Live preview works in both XCode and VSCode
/// To make it work in XCode install the `XLivePreview` app
/// To make it work in VSCode install `webber` extension
class NotFound_Preview: WebPreview {
    @Preview override class var content: Preview.Content {
        Language.en
        Title("Not found endpoint")
        Size(200, 200)
        NotFoundPage()
    }
}
