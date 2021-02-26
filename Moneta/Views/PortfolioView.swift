import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject var data: DataService
    @EnvironmentObject var state: StateService

    var body: some View {
        VStack {
            if let currencies = data.currencies {
                HStack {
                    Text("€1000.00")
                        .font(.title)
                        .blur(radius: state.showAmounts ? 0 : 10)
                    Pill(value: -1.2)
                }
                    .padding(.vertical, 20)
                List {
                    Section(header: Text("coins")) {
                        Text("Bitcoin")
                    }
                }
                    .listStyle(InsetGroupedListStyle())
            } else {
                ProgressView()
            }
        }
            .navigationTitle("portfolio")
            .navigationBarItems(trailing: Refresh(loading: data.loading, action: data.refreshCryptocurrencies))
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
