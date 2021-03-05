import SwiftUI
import Combine

struct AmountSheet: View {
    @Binding var text: String
    var state: StateService
    var viewModel: DetailView.ViewModel
    var listing: Listing

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "bag.circle.fill")
                    .foregroundColor(.accentColor)
                    .font(.system(size: 60))
                    .padding(.bottom, 4)
                Text("update_amount \(listing.name)")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom)
                HStack {
                    TextField("", text: $text)
                        .keyboardType(.numberPad)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                    Button("save") {
                        viewModel.updatePortfolio(listing, amount: text, state: state)
                    }
                        .disabled(Double(text) == nil)
                }
                    .padding(.horizontal)
            }
                .navigationTitle("amount")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AmountSheet_Previews: PreviewProvider {
    static var previews: some View {
        AmountSheet(text: Binding.constant(""), state: StateService(), viewModel: DetailView.ViewModel(), listing: Listing(id: 1, name: "Bitcoin", symbol: "BTC", slug: "bitcoin", cmcRank: 1, numMarketPairs: 1, circulatingSupply: 1, totalSupply: 1, maxSupply: 1, lastUpdated: "", dateAdded: "", tags: [], platform: nil, quote: [:]))
    }
}
