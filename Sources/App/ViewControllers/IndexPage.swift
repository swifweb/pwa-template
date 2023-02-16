import Web
import FetchAPI

class IndexPage: ViewController {
    @State var firstTodoTitle = "n/a"
    
    @DOM override var body: DOM.Content {
        Header {
            Div {
				H1("First Todo Title")
                Br()
                H2(self.$firstTodoTitle)
                Br()
				Button("Load First Todo Title").onClick {
					Fetch("https://jsonplaceholder.typicode.com/todos/1") {
						switch $0 {
						case .failure:
							break
						case .success(let response):
							struct Todo: Decodable {
								let id, userId: Int
								let title: String
								let completed: Bool
							}
							response.json(as: Todo.self) {
								switch $0 {
								case .failure(let error):
									self.firstTodoTitle = "some error occured: \(error)"
								case .success(let todo):
									self.firstTodoTitle = todo.title
								}
							}
						}
					}
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
        .background(.linearGradient(angle: -30, .red/20, .green/80, .red))
    }

    override func buildUI() {
        super.buildUI()
		title = "Fetch example"
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
        IndexPage()
    }
}
