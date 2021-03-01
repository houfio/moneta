import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject var data: DataService
    @EnvironmentObject var state: StateService

    var body: some View {
        VStack {
            if state.portfolio.count > 0 {
                HStack {
                    Text("€1000.00")
                        .font(.title)
                        .blur(radius: state.showAmounts ? 0 : 10)
                        .animation(.easeInOut)
                        .onTapGesture {
                            state.showAmounts.toggle()
                        }
                    Pill(value: -1.2)
                }
                    .padding(.vertical, 20)
                List {
                    Section(header: Text("coins")) {
                        NavigationLink(destination: DetailView(id: 1, name: "Bitcoin")) {
                            Text("Bitcoin")
                        }
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
                data.fetchCryptocurrencies(state: state)
            })
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
