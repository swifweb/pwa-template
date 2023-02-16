import ServiceWorker

@main
public class Service: ServiceWorker {
    @ServiceBuilder public override var body: ServiceBuilder.Content {
        Manifest
            .name("SwiftPWA")
            .startURL(".")
            .display(.standalone)
            .backgroundColor("#2A3443")
            .themeColor("white")
            .icons(
                .init(src: "images/192.png", sizes: .x192, type: .png),
                .init(src: "images/512.png", sizes: .x512, type: .png)
            )
        Lifecycle.activate {
            debugPrint("service activate event")
        }.install {
            debugPrint("service install event")
        }.fetch {
            debugPrint("service fetch event")
        }.sync {
            debugPrint("service sync event")
        }.contentDelete {
            debugPrint("service contentDelete event")
        }
    }
}
