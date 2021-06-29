import Web

class HelloViewController: ViewController {
    @DOM override var body: DOM.Content {
        P("Hello page")
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
class Hello_Preview: WebPreview {
    override class var title: String { "My hello preview" } // optional
    override class var width: UInt { 100 } // optional
    override class var height: UInt { 100 } // optional

    @Preview override class var content: Preview.Content {
        HelloViewController()
    }
}