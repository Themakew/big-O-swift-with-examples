import UIKit

/*
 Rotate array to right 1 times.
 
 For example, given

     A = [3, 8, 9, 7, 6]
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

     [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]

 */

func solution(A: [Int]) -> [Int] {
    // Edge case
    guard !A.isEmpty else {
        return []
    }

    // Edge case
    guard A.count != 1 else {
        return A
    }

    var resultList = A // Space complexity here grown linear with the array size, O(n).
    if let lastItem = resultList.last {
        resultList.removeLast() // O(1)
        resultList.insert(lastItem, at: 0) // O(i) - where 'i' is the index, in this case, i = 0. Then, O(1) always.
    }

    return resultList
}

solution(A: [1, 2, 3, 4, 5]) // [5, 1, 2, 3, 4]
solution(A: [3, 8, 9, 7, 6]) // [6, 3, 8, 9, 7]

// TIME COMPLEXITY = O(1)
// SPACE COMPLEXITY = O(n)
