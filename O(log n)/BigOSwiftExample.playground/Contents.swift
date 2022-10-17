import UIKit

// https://leetcode.com/problems/binary-search/

/*
 Binary Search

 Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.
 You must write an algorithm with O(log n) runtime complexity.

 For example, given

    nums = [-1,0,3,5,9,12]
    target = 9
 the function should return 4, the index of the target.

 */

/// Logarithmic solution
/// - Parameters:
///   - nums: array of unique integers, in ascending order
///   - target: number targeted
/// - Returns: index of the target number
func solution(nums: [Int], target: Int) -> Int { // O(log n)
    var left = 0
    var right = nums.count - 1

    while left <= right {
        let pivot = right - left/2

        if nums[pivot] == target {
            return pivot
        } else if nums[pivot] > target  {
            right = pivot - 1
        } else if nums[pivot] < target {
            left = pivot + 1
        }
    }

    return -1
}

let listOfIntegers = [-1,0,3,5,9,12]

solution(nums: listOfIntegers, target: 9) // 4
solution(nums: listOfIntegers, target: 2) // -1

// TIME COMPLEXITY = O(log n)
// SPACE COMPLEXITY = O(n)
