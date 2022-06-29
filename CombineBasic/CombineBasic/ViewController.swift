//
//  ViewController.swift
//  CombineBasic
//
//  Created by 류창휘 on 2022/06/29.
//

import UIKit
import Combine

class StringSubscripber: Subscriber {
    //구독자가 구독을 받을 때
    func receive(subscription: Subscription) {
        print("Received Subscription")
        subscription.request(.max(3)) //backpressure
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        print("Received Value", input) //받은 것을 알 수 있음
        return .unlimited
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completed")
    }
    
    
    
    
    typealias Input = String
    
    typealias Failure = Never
    
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let publisher = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"].publisher
        
        let subscriber = StringSubscripber()
        
        publisher.subscribe(subscriber)
    }


}

