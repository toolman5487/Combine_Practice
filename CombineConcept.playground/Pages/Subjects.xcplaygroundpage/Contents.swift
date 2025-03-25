import UIKit
import Foundation
import Combine

/*
//PassthroughSubject
let subject = PassthroughSubject<Int,Never>()
let cancellable = subject.sink { value in
    print(value)
}
subject.send(2)

//CurrentValueSubject
let currentValueSubject = CurrentValueSubject<String,Never>("Wiilly")
let currentCancellable = currentValueSubject.sink { valueString in
    print(valueString)
}
currentValueSubject.send("Hello")
 
 */

//Creating custom Subjects

class EvenSubject<Failure: Error>: Subject {
    
    typealias Output = Int
    private let wrapped:PassthroughSubject<Int, Failure>
    
    init(initialValue:Int) {
        self.wrapped = PassthroughSubject()
        let evenInitialValue = initialValue % 2 == 0 ? initialValue:0
        send(initialValue)
    }
    
    
    func send(subscription: any Subscription) {
        wrapped.send(subscription: subscription)
    }
    
    func send(_ value: Int) {
        guard value % 2 == 0 else { return }
        wrapped.send(value)
    }
    
    func send(completion: Subscribers.Completion<Failure>) {
        wrapped.send(completion: completion)
    }
    
    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Int == S.Input {
        wrapped.receive(subscriber: subscriber)
    }
    
}

let evenSubject = EvenSubject<Never>(initialValue: 2)
let cancellable = evenSubject.sink { value in
    print(value)
}

evenSubject.send(2)
evenSubject.send(3)
evenSubject.send(4)
evenSubject.send(9)
