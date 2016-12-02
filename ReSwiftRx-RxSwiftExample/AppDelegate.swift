//
//  AppDelegate.swift
//  ReSwiftRx-RxSwiftExample
//
//  Created by Charlotte Tortorella on 1/12/16.
//  Copyright © 2016 ReSwift. All rights reserved.
//

import UIKit
import ReactiveReSwift
import RxSwift

let middleware = Middleware<AppState> { _, _, action in
    print("Received action:")
    return action
}.map { _, _, action in
    print(action)
    return action
}

// The global application store, which is responsible for managing the appliction state.
let mainStore = Store(
    reducer: counterReducer,
    stateType: AppState.self,
    observable: Variable(AppState()),
    middleware: middleware
)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
}

