import SwiftUI

struct PriceHeader: View {
    @EnvironmentObject var data: DataService
    @EnvironmentObject var state: StateService
    var value: Double
    var change: Double? = nil
    var show = true

    private var sign: String {
        data.currencies?.data.first { currency in
            currency.symbol == state.currency
        }?.sign ?? "€"
    }

    var body: some View {
        HStack {
            Text("\(sign)\(String(format: "%.2f", value))")
                .font(.title)
                .blur(radius: show ? 0 : 10)
            if let c = change {
                Pill(value: c)
            }
        }
            .padding(.vertical, 20)
    }
}

struct PriceHeader_Previews: PreviewProvider {
    static var previews: some View {
        PriceHeader(value: 1000)
    }
}
