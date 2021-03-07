import SwiftUI
import WebKit

struct Web: UIViewRepresentable {
    var url: String

    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    func updateUIView(_ view: WKWebView, context: Context) {
        view.load(url)
    }
}

struct Web_Previews: PreviewProvider {
    static var previews: some View {
        Web(url: "https://apple.com")
    }
}
