//
//  Toast.swift
//  Github
//
//  Created by Lorena Astalis on 12.02.2022.
//
import SwiftMessages
import SwiftUI
import UIKit

public func showError(error: String) {
    let view = MessageView.viewFromNib(layout: .cardView)
    view.configureTheme(.error)
    view.configureDropShadow()
    view.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    view.configureContent(title: "Error", body: error, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "Dismiss", buttonTapHandler: { _ in
        SwiftMessages.hide()
    })
    SwiftMessages.show(view: view)
}

public func showSuccess(message: String) {
    let view = MessageView.viewFromNib(layout: .cardView)
    view.configureTheme(.success)
    view.configureDropShadow()
    view.layoutMargins = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
    view.configureContent(title: "Success", body: message, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "Dismiss", buttonTapHandler: { _ in
        SwiftMessages.hide()
    })
    SwiftMessages.show(view: view)
}
