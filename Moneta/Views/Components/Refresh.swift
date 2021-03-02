import SwiftUI

struct Refresh: View {
    var loading: Bool
    var action: () -> Void

    var body: some View {
        if loading {
            ProgressView()
        } else {
            Button(action: action) {
                Image(systemName: "arrow.triangle.2.circlepath")
            }
        }
    }
}

struct Refresh_Previews: PreviewProvider {
    static var previews: some View {
        List {
            Refresh(loading: false) {
            }
        }
    }
}
