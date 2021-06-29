import Web

class WelcomeViewController: ViewController {
    @State var clickCount = 0
    @State var clicked = false
    
    @DOM override var body: DOM.Content {
        Header {
            Div {
                H1(self.$clickCount.map { "Hello world PWA app, clicks: \($0)" })
                    .color(self.$clicked.map { $0 ? .red : .white })
                    .textAlign(.center)
                    .fontFamily(.app)
                Br()
                H4("Now you can run the world using Swift")
                    .color(.white)
                    .textAlign(.center)
                    .fontFamily(.system, .appleSystem, .sanFrancisco, .roboto, .segoeUI, .helveticaNeue, .lucidaGrande, .sansSerif)
                Button("click").onClick {
                    self.clicked = !self.clicked
                    self.clickCount += 1
                }
                Button("go to hello").onClick {
                    History.pushState(path: "hello")
                }
                Button("toggle style").onClick {
                    App.current.theme = App.current.theme == .happy ? .sad : .happy
                }
            }
            .position(.absolute)
            .display(.block)
            .top(50.percent)
            .left(50.percent)
            .transform(.translate(-50.percent, -50.percent))
            .whiteSpace(.nowrap)
            .overflow(.hidden)
        }
        .position(.fixed)
        .width(100.percent)
        .height(100.percent)
        .background(.linearGradient(180, .black/70, .gray))
    }

    override func buildUI() {
        super.buildUI()
        title = "PWA Hello world"
        metaDescription = "An awesome Swift in heart of your website"
    }
}

/// Live preview works in both XCode and VSCode
/// To make it work in XCode install the `XLivePreview` app
/// To make it work in VSCode install `webber` extension
class Welcome_Preview: WebPreview {
    override class var title: String { "Initial page" } // optional
    override class var width: UInt { 640 } // optional
    override class var height: UInt { 480 } // optional

    @Preview override class var content: Preview.Content {
        // add styles if needed
        AppStyles.id(.happyStyle)
        // add here as many elements as needed
        WelcomeViewController()
    }
}
