//
//  InfoRow.swift
//  LankaBusRideSwiftUI
//
//  Created by ranCreation on 2025-05-15.
//

import SwiftUI

struct InfoRow: View {
    let icon: String
    let label: String
    let value: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .frame(width: 24)
                .foregroundColor(.blue)

            VStack(alignment: .leading) {
                Text(label)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)

                Text(value)
                    .font(.body)
            }
            Spacer()
        }
    }
}
