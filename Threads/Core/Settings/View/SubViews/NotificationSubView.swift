//
//  NotificationSubView.swift
//  Threads
//
//  Created by Olya B on 29.09.2023.
//

import SwiftUI
import UserNotifications

struct NotificationSubView: View {
    @StateObject private var viewModel = NotificationsViewModel()
    
    var body: some View {
        
        VStack {
            Toggle("Enable push notifications".localized, isOn: $viewModel.isPushOn)
                .onChange(of: viewModel.isPushOn) { value in
                    self.viewModel.togglePushNotification()
                }
            
            Spacer()
        }
        .padding(16)
        .padding(.top, 40)
    }
}

struct NotificationSubView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationSubView()
    }
}
