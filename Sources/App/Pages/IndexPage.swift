import Web
import FetchAPI

class IndexPage: PageController {
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
    @Preview override class var content: Preview.Content {
        Language.en
        Title("Initial page")
        Size(640, 480)
        // add styles if needed
        AppStyles.id(.happyStyle)
        // add here as many elements as needed
        IndexPage()
    }
}
