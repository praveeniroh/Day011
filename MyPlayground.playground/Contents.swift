import Cocoa


public class SomePublicClass {                  // explicitly public class
    public var somePublicProperty = 0            // explicitly public class member
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}


class SomeInternalClass {                       // implicitly internal class
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}


fileprivate class SomeFilePrivateClass {        // explicitly file-private class
    func someFilePrivateMethod() {}              // implicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}


private class SomePrivateClass {                // explicitly private class
    func somePrivateMethod() {}                  // implicitly private class member
}



//Access level of tuple

private class PrivateClass{}

public class PublicClass{}

public class MyClass{
//    let tuple:(PrivateClass,PublicClass) = (PrivateClass(),PublicClass())
   private let tuple:(PrivateClass,PublicClass) = (PrivateClass(),PublicClass())

    //Access level of function

//    func myFunction(_ privateObj:PrivateClass)->PublicClass{
//    PublicClass()
//}

    private func myFuntion2(_ privateObj:PrivateClass)->PublicClass{
        return PublicClass()
    }

}


//enum

public enum PublicEnum {
    case caseA
    case caseB
}

internal enum InternalEnum {
    case caseC
    case caseD
}
class Test{
    private enum PrivateEnum {
        case caseE
        case caseF
    }
    private let meEnum = PrivateEnum.caseE//must be private type
}
let publicEnumInstance = PublicEnum.caseA // Accessible
let internalEnumInstance = InternalEnum.caseC // Accessible


//subclassing
public class Superclass {
    public func publicMethod() {
        print("Public Method")
    }
    
    fileprivate func internalMethod() {
        print("Internal Method")
    }
}

// Subclass with lower access level
internal class SubclassA: Superclass {
    override internal func internalMethod() {
        super.internalMethod()
        print("SubclassA Internal Method")
    }
}

// Subclass with the higher access level - error
//public class SubclassB: SubclassA {
//    override internal func internalMethod() {
//        super.internalMethod()
//        print("SubclassB Internal Method")
//    }
//}


//getter setter
struct MyStruct2 {
    private(set) var privateSetter = 0
    var publicSetGet: Int  {
        get {
           return privateSetter
        }
        set{
            privateSetter = newValue
        }
    }
}



//static paramter and methods
struct MyStruct {
    static var staticProperty: Int = 10
    static var instanceCount = 0
    var currenctInstance:Int  {
        return Self.instanceCount
    }
    
    init(){
        Self.instanceCount += 1
    }
    static var computedStaticProperty: Int {
        return staticProperty * 2
    }
    
    static func calculateSum(a: Int, b: Int) -> Int {
        return a + b
    }
}

print(MyStruct.staticProperty)
MyStruct.staticProperty = 20
print(MyStruct.staticProperty)
print(MyStruct.computedStaticProperty)

let sum = MyStruct.calculateSum(a: 5, b: 3)
print(sum)

let obj1 = MyStruct()
print("current obj : \(obj1.currenctInstance)")
let obj2 = MyStruct()
print("current obj : \(obj1.currenctInstance)")
print("Number of objects:\(MyStruct.instanceCount)")


//check poin
struct Car{
    let model:String
    let numberOfSeats:Int
    var currentGear:Int = 0{
        didSet{
            print("current gear \(currentGear)")
        }
    }
    
    mutating func increaseGear(){
        if currentGear <= 5{
            currentGear += 1
            
        }else{
            print("max gear reached")
        }
    }
    
    mutating func decreaseGear(){
        if currentGear > 0{
            currentGear -= 1
        }else{
            print("min gear reached")
        }
    }
}
var audi320d = Car(model: "Audi", numberOfSeats: 4)
audi320d.decreaseGear()
audi320d.increaseGear()
audi320d.increaseGear()
audi320d.increaseGear()
audi320d.increaseGear()
audi320d.increaseGear()
audi320d.increaseGear()
audi320d.increaseGear()
