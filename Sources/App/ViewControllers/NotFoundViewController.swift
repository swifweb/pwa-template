import Web

class NotFoundViewController: ViewController {
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

/// Live preview works only in Visual Studio Code
/// To make it work do the following:
/// - install VSCode
/// - install `webber` extension
class NotFound_Preview: WebPreview {
    override class var title: String { "Not found endpoint" } // optional
    override class var width: UInt { 200 } // optional
    override class var height: UInt { 200 } // optional

    @Preview override class var content: Preview.Content {
        NotFoundViewController()
    }
}
