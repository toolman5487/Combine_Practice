import Foundation
import Combine

//Filter

let numberPublisher = (1...10).publisher
let evennumberPublisher = numberPublisher.filter {$0 % 2 == 0}
let cancellable = evennumberPublisher.sink { value in
    print(value)
}

//CompactMap

