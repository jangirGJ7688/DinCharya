//
//  ListRowView.swift
//  DinCharya
//
//  Created by Ganpat Jangir on 02/05/24.
//

import SwiftUI

struct ListRowView: View {
    let item: ToDoItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompletedTask ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompletedTask ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .padding(.vertical,10)
        .font(.title2)
    }
}

#Preview {
    ListRowView(item: ToDoItemModel(title: "This is a sample Title Please let me go", isCompletedTask: false)).previewLayout(.sizeThatFits)
}
