//
//  InfoRow.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-15.
//

import SwiftUI

struct InfoRow: View {
    var label: String
    var value: String

    var body: some View {
        HStack(alignment: .top) {
            Text(label)
                .fontWeight(.semibold)
            Spacer()
            Text(value)
                .multilineTextAlignment(.trailing)
        }
    }
}
