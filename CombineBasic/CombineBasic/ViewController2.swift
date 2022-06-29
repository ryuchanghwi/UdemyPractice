//
//  ViewController2.swift
//  CombineBasic
//
//  Created by 류창휘 on 2022/06/29.
//

import Foundation
import UIKit
import Combine
enum MyError: Error {
    case subscriberError
}

class StringSubscriber2: Subscriber {
    func receive(subscription: Subscription) {
        subscription.request(.max(2))
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print(input)
        return .unlimited
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
        print("Completions")
    }
    
    
    
    typealias Input = String
    
    typealias Failure = MyError
    
}

class ViewController2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Subjects
            // - Publisher
            // - Subscribers
        let subscriber = StringSubscriber2()
        
        let subject = PassthroughSubject<String, MyError>()
        
        subject.subscribe(subscriber)
        
        let subscription = subject.sink(receiveCompletion: {(completion) in
            print("Received Completion from sink")
        }) { value in
            print("Received Value from sink")
        }
        
        subject.send("A")
        subject.send("B")
        
        subscription.cancel()
        
        subject.send("C")
        subject.send("D")
        
        
    }
}
