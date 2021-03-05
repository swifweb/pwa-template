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
