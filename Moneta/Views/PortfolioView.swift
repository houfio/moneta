import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject var data: DataService
    @EnvironmentObject var state: StateService
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            if !viewModel.isEmpty(state: state) {
                PriceHeader(value: viewModel.getTotalValue(data: data, state: state), change: viewModel.getTotalChange(data: data, state: state), show: state.showAmounts)
                List {
                    Section(header: Text("coins")) {
                        ForEach(viewModel.getListings(data: data, state: state), id: \.listing.id) { listing in
                            ZStack {
                                Button("") {} // https://stackoverflow.com/a/65932011
                                NavigationLink(destination: DetailView(listing: listing.listing)) {
                                    Text(listing.listing.name)
                                    Spacer()
                                    Text(String(format: "%.2f", listing.amount))
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
