import UIKit
import Combine

/*let publisher = Just("Hello World")
 let cancellable = publisher.sink { value in
     print(value)
 }
 cancellable.cancel()*/
/**/
/*let timerPublisher = Timer.publish(every: 1, on: .main, in: .common)
 let cancellable = timerPublisher.autoconnect().sink { timeStamp in
     print("Timestamp: \(timeStamp)")
 }*/
let numbersPublisher = (1...10).publisher
let cancellable = numbersPublisher.sink { value in
     print(value)
 }
DispatchQueue.main.asyncAfter(deadline: .now() + 2){
    cancellable.cancel()
}
