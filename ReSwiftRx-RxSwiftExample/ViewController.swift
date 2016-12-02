//
//  ViewController.swift
//  ReSwiftRx-RxSwiftExample
//
//  Created by Charlotte Tortorella on 1/12/16.
//  Copyright © 2016 ReSwift. All rights reserved.
//

import UIKit
import ReactiveReSwift
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let disposable = mainStore.observable.asObservable().map { String($0.counter) }.subscribe(onNext: { [weak self] value in
            self?.counterLabel.text = value
        })
        disposeBag.insert(disposable)
    }
    
    // when either button is tapped, an action is dispatched to the store
    // in order to update the application state
    @IBAction func downTouch(_ sender: AnyObject) {
        // This is just to demonstrate that you can dispatch signals directly,
        // don't actually do this, this is bad code
        mainStore.dispatch(Observable.just(AppAction.decrease))
    }
    
    @IBAction func upTouch(_ sender: AnyObject) {
        // This is just to demonstrate that you can dispatch signals directly,
        // don't actually do this, this is bad code
        mainStore.dispatch(Observable.just(AppAction.increase))
    }
}


