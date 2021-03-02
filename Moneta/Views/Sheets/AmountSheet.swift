import SwiftUI
import Combine

struct AmountSheet: View {
    @Binding var text: String
    var listing: Listing

    var body: some View {
        NavigationView {
            VStack {
                TextField("", text: $text)
                    .keyboardType(.numberPad)
                    .padding(8)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding()
                Text("update_amount \(listing.name)")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
            }
                .navigationTitle("amount")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AmountSheet_Previews: PreviewProvider {
    static var previews: some View {
        AmountSheet(text: Binding.constant(""), listing: Listing(id: 1, name: "Bitcoin", symbol: "BTC", slug: "bitcoin", cmcRank: 1, numMarketPairs: 1, circulatingSupply: 1, totalSupply: 1, maxSupply: 1, lastUpdated: "", dateAdded: "", tags: [], platform: nil, quote: [:]))
    }
}
