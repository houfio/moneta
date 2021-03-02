import SwiftUI
import Combine

struct AmountSheet: View {
    @Binding var text: String
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
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    Button("save") {
                        print("save")
                    }
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
        AmountSheet(text: Binding.constant(""), listing: Listing(id: 1, name: "Bitcoin", symbol: "BTC", slug: "bitcoin", cmcRank: 1, numMarketPairs: 1, circulatingSupply: 1, totalSupply: 1, maxSupply: 1, lastUpdated: "", dateAdded: "", tags: [], platform: nil, quote: [:]))
    }
}
