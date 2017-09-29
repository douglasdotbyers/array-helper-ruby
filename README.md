# Array Helper

An array helper, in Ruby, which provides a method to divide an array into n parts.


 - Where the size of the array _can_ be divided equally by n:
    - All n parts are of the same size.


 - Where the size of the array _cannot_ be divided equally by n:
    - The first n-1 parts are of the same size, as large as possible.
    - The last part contains the remaining array items.


Tested with `minitest (5.10.3)`.

## Setup

Ensure `ruby (2.4.2)` is installed:

```bash
ruby --version
```

If `ruby (2.4.2)` is not installed, install it using, for example, [rbenv](https://github.com/rbenv/rbenv).

Ensure `bundler` is installed:

```bash
bundler --version
```

If `bundler` is not installed, see installation instructions at [https://bundler.io/](https://bundler.io/).

Clone the repository:

```bash
git clone https://github.com/douglasdotbyers/array-helper-ruby.git
```

Change to the repository directory:

```bash
cd array-helper-ruby
```

Install required dependencies with `bundle install`:

```bash
bundle install
```

This will install `minitest (5.10.3)`.

## Usage

Run the tests:

```bash
bundle exec ruby test/array_helper_test.rb
```

To run at the command line, with the `irb` REPL:

```bash
bundle exec irb
```

Then:

```ruby
> require_relative "app/array_helper"
>
> ArrayHelper.new.divide([1, 2, 3, 4, 5], 3)
[[1, 2], [3, 4], [5]]
> ArrayHelper.new.divide([1, 2, 3, 4, 5], 4)
[[1], [2], [3], [4, 5]]
> ArrayHelper.new.divide([1, 2, 3, 4, 5], 5)
[[1], [2], [3], [4], [5]]
```

## Notes

`ArrayHelper` is intended to be readable through use of sensible class / method / variable names, and documentation is provided via unit tests, but some further explanation of `ArrayHelper`'s private methods is given below:


```ruby
def get_part_size array_length, parts
```

`get_part_size` initially calculates the part size as the number of whole times `parts` fits into `array_length`, then increments it by one if the remainder can be distributed evenly among the first n-1 parts of the result.


```ruby
def get_divisions array, parts, part_size
```

`get_divisions` returns a result of length `parts`, with the first n-1 parts containing exactly `part_size` items, and the last part containing at most `part_size` items.


```ruby
def get_remainder array, parts, part_size
```

`get_remainder` returns the remaining array items, if any exist, which are then added to the last part of the result in the `divide` method.

### Assumptions

 - It has been assumed that where the size of the array cannot be divided equally by n, the first n-1 parts of the result must be as large as possible, whilst remaining equal in size – e.g., dividing `[1, 2, 3, 4, 5]` into 3 parts will yield `[[1, 2], [3, 4], [5]]`, and not `[[1], [2], [3, 4, 5]]`.

 - It has been assumed that where the size of the array cannot be divided equally by n, the last part of the result must contain at least one item – e.g., dividing `[1, 2, 3, 4, 5, 6]` into 4 parts will yield `[[1], [2], [3], [4, 5, 6]]`, and not `[[1, 2], [3, 4], [5, 6], []]`.

 - It has been assumed that the result should always contain n parts, even when starting with an empty array – e.g., dividing `[]` into 3 parts will yield `[[], [], []]`.
