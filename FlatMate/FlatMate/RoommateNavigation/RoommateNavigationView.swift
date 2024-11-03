//
//  RoommateNavigationView.swift
//  FlatMate
//
//  Created by Charlotte Tsui on 11/2/24.
//

import SwiftUI

struct RoommateNavigationView: View {
    @Binding var flat: RoomieGroup
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable().frame(width: 50, height: 50)
                    
                    Text(flat.roomies[0].name)
                    Spacer()
                }
                .padding(50)
                .background(Color.secondary.opacity(0.2))
                .cornerRadius(15)
            }
        }
    }
}

//#Preview {
//    RoommateNavigationView()
//}
