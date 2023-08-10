//
//  ToastPresenter.swift
//  basicNoteApp
//
//  Created by Ali Burak Baraç on 7.08.2023.
//

import SwiftEntryKit

public class ToastPresenter {

    private static var toastView: ToastWarningView?

    public static func showWarningToast(text: String) {
        showCustomToast(text: text, backgroundColor: .appRed)
    }

    public static func showSuccessToast(text: String) {
        
        showCustomToast(text: text, backgroundColor: .appGreen)
    }

    private static func showCustomToast(text: String, backgroundColor: UIColor) {
        var attributes = EKAttributes.topToast
        attributes.entryBackground = .color(color: EKColor(backgroundColor))
        attributes.entranceAnimation = .translation
        attributes.exitAnimation = .translation
        attributes.displayDuration = 2.0

        let customView = ToastWarningView(text: text, backgroundColor: backgroundColor)
        toastView = customView
        SwiftEntryKit.display(entry: customView, using: attributes)
        
    }

}
