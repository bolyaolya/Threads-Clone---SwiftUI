//
//  NotificationsViewModel.swift
//  Threads
//
//  Created by Olya B on 30.09.2023.
//

import Foundation
import UserNotifications

class NotificationsViewModel: ObservableObject {
    @Published var isPushOn = false
    
    init() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                self.isPushOn = settings.authorizationStatus == .authorized
            }
        }
    }
    
    func togglePushNotification() {
        if isPushOn {
            UNUserNotificationCenter.current().removeAllDeliveredNotifications()
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            print("Уведомления выключены")
        } else {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { result, error in
                DispatchQueue.main.async {
                    if result {
                        print("Уведомления включены")
                    } else {
                        print("Пользователь отклонил запрос на отправку пуш")
                    }
                }
            }
        }
    }
}
