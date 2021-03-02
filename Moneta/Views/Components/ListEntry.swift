import SwiftUI

struct ListEntry: View {
    var icon: String
    var label: LocalizedStringKey
    var value: String
    var action: (() -> Void)? = nil

    var body: some View {
        if let a = action {
            Button(action: a) {
                HStack {
                    list
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14))
                        .foregroundColor(Color(.systemGray2))
                }
            }
        } else {
            list
        }
    }
    
    private var list: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color(.systemGray))
                .frame(width: 20, height: 20)
            Text(label)
                .foregroundColor(.primary)
            Spacer()
            Text(value)
                .foregroundColor(.primary)
        }
    }
}

struct ListEntry_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ListEntry(icon: "chevron.left", label: "Label", value: "Value")
        }
    }
}
