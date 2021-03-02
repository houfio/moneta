import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject var data: DataService
    @EnvironmentObject var state: StateService

    var body: some View {
        VStack {
            if state.portfolio.count > 0 {
                PriceHeader(value: 1000, change: 1.2, show: state.showAmounts)
                    .onTapGesture {
                        state.showAmounts.toggle()
                    }
                List {
                    Section(header: Text("coins")) {
                    }
                }
                    .listStyle(InsetGroupedListStyle())
            } else {
                Text("empty_portfolio")
                    .padding()
            }
        }
            .navigationTitle("portfolio")
            .navigationBarItems(trailing: Refresh(loading: false) {
                data.fetchListings(state: state)
            })
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
