var array = [Int]()

func isPrime(_ n : Int) -> Bool {
    
    if n == 1 {
        return false
    }
    
    if n == 2 {
        return true
    }
    
    if n % 2 == 0 {
        return false
    }
    
    for a in array {
        if n % a == 0 {
            return false
        }
    }
    
    return true
}


var i = 0
while (array.count < 10) {
    
    if isPrime(i) {
        array.append(i)
    }
    i = i + 1
}

array

