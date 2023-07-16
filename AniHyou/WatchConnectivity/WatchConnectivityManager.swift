//
//  WatchConnectivityManager.swift
//  AniHyou
//
//  Created by Axel Lopez on 11/01/2023.
//

import Foundation
import WatchConnectivity

final class WatchConnectivityManager: NSObject, ObservableObject {
    static let shared = WatchConnectivityManager()
    @Published var isWatchAppInstalled = false
    @Published var receivedMessage: String?
    var key = ""

    private override init() {
        super.init()

        if WCSession.isSupported() {
            WCSession.default.delegate = self
            WCSession.default.activate()
        }
    }

    func send(key: String, data: String) {
        guard WCSession.default.activationState == .activated else {
            return
        }
        #if os(iOS)
        guard WCSession.default.isWatchAppInstalled else {
            return
        }
        #endif

        self.key = key

        WCSession.default.sendMessage([key: data], replyHandler: nil) { error in
            print(error)
        }
    }
}

extension WatchConnectivityManager: WCSessionDelegate {

    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        if let key = message.first?.key {
            self.key = key
            if let messageText = message[key] as? String {
                DispatchQueue.main.async { [weak self] in
                    self?.receivedMessage = messageText
                }
            }
        }
    }

    func session(
        _ session: WCSession,
        activationDidCompleteWith activationState: WCSessionActivationState,
        error: Error?
    ) {
        #if os(iOS)
        if activationState == .activated {
            isWatchAppInstalled = session.isWatchAppInstalled
        }
        #endif
    }

    #if os(iOS)
    func sessionDidBecomeInactive(_ session: WCSession) {
    }

    func sessionDidDeactivate(_ session: WCSession) {
        session.activate()
    }
    #endif

}
