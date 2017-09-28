# Array Helper

An array helper, in Ruby, which provides a method to divide an array into n parts.


 - Where the size of the array _can_ be divided equally by n:
    - All n parts are of the same size.


 - Where the size of the array _cannot_ be divided equally by n:
    - The first n-1 parts are of the same size.
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
