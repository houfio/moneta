import WebKit

extension WKWebView {
    func load(_ url: String) {
        if let url = URL(string: url) {
            load(URLRequest(url: url))
        }
    }
}
