import SwiftUI

struct PortfolioView: View {
    var body: some View {
        ScrollView {
            HStack {
                Text("portfolio")
                Spacer()
            }
        }
                .navigationTitle("portfolio")
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
