import gleam/dict
import gleam/int
import gleam/list
import gleam/option
import gleam/set
import gleam/string

/// Returns `True` if the list contains a duplicate entry. Otherwise, returns
/// `False`.
pub fn contains_duplicate(list: List(Int)) -> Bool {
  // Fold each item, adding it to a set if it has not been seen yet. Otherwise,
  // stop and yield the set.
  let seen_set =
    list
    |> list.fold_until(set.new(), fn(seen, current) {
      case seen |> set.contains(current) {
        False -> list.Continue(seen |> set.insert(current))
        True -> list.Stop(seen)
      }
    })

  // A duplicate is detected when the size of the set is different than the
  // size of the input list.
  seen_set |> set.size != list |> list.length
}

/// Returns `True` if the first string can be constructed by using the same
/// codepoints in the second string. Otherwise, returns `False`.
pub fn valid_anagram(string base: String, of other: String) -> Bool {
  // Count the occurrence of each codepoint in the base string.
  let base_codepoint_occurrences =
    base
    |> string.to_utf_codepoints
    |> list.map(string.utf_codepoint_to_int)
    |> list.fold(dict.new(), fn(counter, current) {
      counter
      |> dict.upsert(current, fn(value) {
        value
        |> option.map(int.add(_, 1))
        |> option.unwrap(0)
      })
    })

  // Subtract the values for each codepoint occurrence found in the other
  // string.
  let difference =
    other
    |> string.to_utf_codepoints
    |> list.map(string.utf_codepoint_to_int)
    |> list.fold(base_codepoint_occurrences, fn(counter, current) {
      counter
      |> dict.upsert(current, fn(value) {
        value
        |> option.map(int.subtract(_, 1))
        |> option.unwrap(0)
      })
    })

  // Remove all zero values in the difference dict. If there are any values
  // leftover, then the strings are not anagrams.
  difference
  |> dict.filter(fn(_, value) { value == 0 })
  |> dict.is_empty
}
