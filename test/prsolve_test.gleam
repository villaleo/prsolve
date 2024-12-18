import gleeunit
import gleeunit/should
import prsolve

pub fn main() {
  gleeunit.main()
}

pub fn two_sum_trivial_test() {
  [1, 2, 3, 4]
  |> prsolve.two_sum(target: 7)
  |> should.equal([3, 2])
}

pub fn two_sum_no_pair_test() {
  [1, 2, 3, 4]
  |> prsolve.two_sum(target: 10)
  |> should.equal([])
}

pub fn two_sum_one_number_test() {
  [1]
  |> prsolve.two_sum(target: 1)
  |> should.equal([])
}

pub fn two_sum_empty_list_test() {
  []
  |> prsolve.two_sum(target: 1)
  |> should.equal([])
}

pub fn two_sum_two_numbers_test() {
  [1, 2]
  |> prsolve.two_sum(target: 3)
  |> should.equal([1, 0])
}

pub fn contains_duplicate_trivial_test() {
  [1, 2, 3, 3, 4]
  |> prsolve.contains_duplicate
  |> should.be_true
}

pub fn contains_duplicate_distinct_numbers_test() {
  [1, 2, 3, 4, 5]
  |> prsolve.contains_duplicate
  |> should.be_false
}

pub fn contains_duplicate_empty_list_test() {
  []
  |> prsolve.contains_duplicate
  |> should.be_false
}

pub fn contains_duplicate_one_item_test() {
  [1]
  |> prsolve.contains_duplicate
  |> should.be_false
}

pub fn contains_duplicate_two_distinct_items_test() {
  [1, 2]
  |> prsolve.contains_duplicate
  |> should.be_false
}

pub fn contains_duplicate_two_duplicate_items_test() {
  [2, 2]
  |> prsolve.contains_duplicate
  |> should.be_true
}

pub fn contains_duplicate_three_distinct_items_test() {
  [1, 2, 3]
  |> prsolve.contains_duplicate
  |> should.be_false
}

pub fn contains_duplicate_three_duplicate_items_test() {
  [1, 1, 1]
  |> prsolve.contains_duplicate
  |> should.be_true
}

pub fn valid_anagram_trivial_test() {
  "dog"
  |> prsolve.valid_anagram(of: "god")
  |> should.be_true
}

pub fn valid_anagram_same_input_test() {
  "abc"
  |> prsolve.valid_anagram(of: "abc")
  |> should.be_true
}

pub fn valid_anagram_empty_string_test() {
  ""
  |> prsolve.valid_anagram(of: "")
  |> should.be_true
}

pub fn valid_anagram_one_off_test() {
  "12345"
  |> prsolve.valid_anagram(of: "1234")
  |> should.be_false
}
