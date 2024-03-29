//
//  FixedHostingController.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation
import SwiftUI

class FixedHostingController<Content: View>: UIHostingController<Content> {
    private let keyboardWillShowNotificationKey = "keyboardWillShowWithNotification:"
    convenience public init(rootView: Content, ignoreSafeArea: Bool) {
        self.init(rootView: rootView)
        if ignoreSafeArea {
            disableSafeArea()
        }
    }

    func disableSafeArea() {
            guard let viewClass = object_getClass(view) else { return }

            let viewSubclassName = String(cString: class_getName(viewClass)).appending("_IgnoreSafeArea")
            if let viewSubclass = NSClassFromString(viewSubclassName) {
                object_setClass(view, viewSubclass)
            } else {
                guard let viewClassNameUtf8 = (viewSubclassName as NSString).utf8String else { return }
                guard let viewSubclass = objc_allocateClassPair(viewClass, viewClassNameUtf8, 0) else { return }

                if let method = class_getInstanceMethod(UIView.self, #selector(getter: UIView.safeAreaInsets)) {
                    let safeAreaInsets: @convention(block) (AnyObject) -> UIEdgeInsets = { _ in
                        return .zero
                    }
                    class_addMethod(viewSubclass, #selector(getter: UIView.safeAreaInsets), imp_implementationWithBlock(safeAreaInsets), method_getTypeEncoding(method))
                }

                if let method2 = class_getInstanceMethod(viewClass, NSSelectorFromString(keyboardWillShowNotificationKey)) {
                    let keyboardWillShow: @convention(block) (AnyObject, AnyObject) -> Void = { _, _ in
                        // handle keyboard will show
                    }
                    class_addMethod(viewSubclass, NSSelectorFromString(keyboardWillShowNotificationKey), imp_implementationWithBlock(keyboardWillShow), method_getTypeEncoding(method2))
                }

                objc_registerClassPair(viewSubclass)
                object_setClass(view, viewSubclass)
            }
        }
}
