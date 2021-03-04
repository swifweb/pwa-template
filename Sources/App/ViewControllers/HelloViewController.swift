import Web

class HelloViewController: ViewController {
    @DOM override var body: DOM.Content {
        P("Hello page")
            .textAlign(.center)
            .body {
                Button("go back").display(.block)
            }
    }
}
