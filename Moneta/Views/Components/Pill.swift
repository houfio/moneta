import SwiftUI

struct Pill: View {
    var value: Double

    var body: some View {
        Text("\(value >= 0 ? "+" : "")\(String(format: "%.2f", value))%")
            .foregroundColor(Color(.systemBackground))
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(Color(value >= 0 ? .systemGreen : .systemRed))
            .clipShape(Capsule())
    }
}

struct Pill_Previews: PreviewProvider {
    static var previews: some View {
        Pill(value: 100)
    }
}
