import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject var data: DataService
    @EnvironmentObject var state: StateService
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            if state.portfolio.count > 0 {
                PriceHeader(value: viewModel.value(data: data, state: state), change: viewModel.change(data: data, state: state), show: state.showAmounts)
                List {
                    Section(header: Text("coins")) {
                        ForEach(viewModel.listings(data: data, state: state), id: \.listing.id) { data in
                            ZStack {
                                Button("") {} // https://stackoverflow.com/a/65932011
                                NavigationLink(destination: DetailView(listing: data.listing)) {
                                    Text(data.listing.name)
                                    Spacer()
                                    Text(String(format: "%.2f", data.amount))
                                        .foregroundColor(Color(.systemGray))
                                }
                            }
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
            .navigationBarItems(trailing: Refresh(loading: data.loading) {
                data.fetchListings(state: state)
            })
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
