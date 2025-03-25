import UIKit
import Combine


enum numbersError:Error{
    case operationFailed
}

let numberPoblisher = [1,2,3,4,5].publisher
let doublePoblisher = numberPoblisher.tryMap { number in
    if number == 4{
        throw numbersError.operationFailed
    }
    return number * 2
}.mapError { error in
    if let numberError = error as? numbersError{
        return numbersError.operationFailed
    }
    return numbersError.operationFailed
}

let cancellable = doublePoblisher.sink { completion in
 switch completion{
 case .finished:
     print("Finished")
 case .failure(let error):
     print(error)
 }
}receiveValue: { value in
 print(value)
}


/*let doublePoblisher = numberPoblisher.tryMap { number in
 if number == 4{
     throw numbersError.operationFailed
 }
 return number * 2
}.catch { error in
 
 if let numberError = error as? numbersError{
     print("Erorr:\(numberError)")
 }
 
 return Just(0)
 
}

let cancellable = doublePoblisher.sink { completion in
 switch completion{
 case .finished:
     print("Finished")
 case .failure(let error):
     print(error)
 }
}receiveValue: { value in
 print(value)
}
*/
