//
//  FilterView.swift
//  Update
//
//  Created by Lucas Farah on 2/10/20.
//  Copyright © 2020 Lucas Farah. All rights reserved.
//

import SwiftUI

enum FilterType: String {
    case all = "All"
    case unreadOnly = "Unread Only"
}

struct FilterView: View {
    @Binding var selectedFilter: FilterType
    @Binding var showFilter: Bool
    
    var body: some View {
        Group {
            
            HStack {
                Text(FilterType.all.rawValue)
                    .padding()
                    .foregroundColor(Color(selectedFilter == .all ? .white : .label))
                    .background(selectedFilter == .all ? Color.blue : nil)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .onTapGesture {
                        self.selectedFilter = .all
                }
                
                Text(FilterType.unreadOnly.rawValue)
                    .padding()
                    .foregroundColor(Color(selectedFilter == .unreadOnly ? .white : .label))
                    .background(selectedFilter == .unreadOnly ? Color.blue : nil)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .onTapGesture {
                        self.selectedFilter = .unreadOnly
                }
            }
        }
        .frame(height: showFilter ? nil : 0)
        .clipped()
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(selectedFilter: .constant(.all),
                   showFilter: .constant(true))
    }
}
