# Optional

In Ruby, you'll get to fight `nil` a lot. Let's craft a tool that represents an optional value. It will let us chain method calls on `nil` for as long as we like, given the contract that all the method chaining will return nil in the end.

## Interface

Define a class named `Optional`. It should accept a single argument, to be the target object we can call undefined methods on.

Define an instance method `Optional#value` to access the value once done with the chaining.

All method calls to an `Optional` instance must be delegated to `Optional#value`.

## Examples

A code snippet is worth a thousand words, the old Japanese noodles master said.

```ruby
# The most basic example.
Optional.new(nil).no_such_method.value #=> nil

# A user can have an account. When no account is associated with a user, its `nil`
user = Optional.new(user)
balance = user.account.balance.value #=> nil if user.account is nil

# You can chain method calls for as long as you want.
Optional.new(42).succ.succ.succ.succ.succ.to_s.value #=> "47"
```
