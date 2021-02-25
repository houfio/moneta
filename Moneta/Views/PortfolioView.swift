import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject var data: DataService
    @EnvironmentObject var state: StateService

    var body: some View {
        ZStack {
            if data.loading {
                ProgressView()
            } else {
                HStack {
                    Text("€1000.00")
                        .font(.title)
                        .blur(radius: state.showAmounts ? 0 : 10)
                    Text("-2.6%")
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .foregroundColor(Color(.systemBackground))
                        .background(Color(.systemRed))
                        .clipShape(Capsule())
                }
                    .padding(.vertical, 20)
                List {
                    Section(header: Text("coins")) {
                        Text("Bitcoin")
                    }
                }
                    .listStyle(InsetGroupedListStyle())
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
