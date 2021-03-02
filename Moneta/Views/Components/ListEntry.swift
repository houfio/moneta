import SwiftUI

struct ListEntry: View {
    var icon: String
    var label: LocalizedStringKey
    var value: String
    var wrap: Bool = false
    var action: (() -> Void)? = nil

    var body: some View {
        if let a = action {
            Button(action: a) {
                HStack {
                    list
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14))
                        .foregroundColor(Color(.systemGray2))
                        .padding(.leading, 8)
                }
            }
        } else {
            list
        }
    }

    @ViewBuilder private var list: some View {
        if wrap {
            VStack {
                HStack {
                    keyText
                    Spacer()
                }
                HStack {
                    Spacer()
                    valueText
                }
            }
                .padding(.vertical, 6)
        } else {
            HStack {
                keyText
                Spacer()
                valueText
            }
        }
    }

    private var keyText: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color(.systemGray))
                .frame(width: 20, height: 20)
            Text(label)
                .foregroundColor(.primary)
        }
    }

    private var valueText: some View {
        Text(value)
            .padding(.horizontal, 10)
            .padding(.vertical, 4)
            .background(Color(.systemGray5))
            .foregroundColor(.primary)
            .cornerRadius(10)
    }
}

struct ListEntry_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ListEntry(icon: "chevron.left", label: "Label", value: "Value")
        }
    }
}
