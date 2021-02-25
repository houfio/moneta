import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject var data: DataService

    var body: some View {
        ScrollView {
            HStack {
                Text("portfolio")
                Spacer()
            }
                .navigationBarItems(trailing: Refresh(loading: data.loading, action: data.refreshCryptocurrencies))
        }
            .navigationTitle("portfolio")
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
