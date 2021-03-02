import SwiftUI

struct ListEntry: View {
    var icon: String
    var label: LocalizedStringKey
    var value: String

    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(label)
            Spacer()
            Text(value)
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
