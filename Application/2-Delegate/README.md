# Delegate

Delegating a method to existing object is a commonly used technique in Rubyland. Let's make it easier by defining a helper.

## Interface

Define a method under `Module` with the following signature `def delegate(*methods, to:)`.

Module `delegate` accepts one or more method names (symbols) and the name of the target object via the `:to` required keyword argument (also a symbol).

## Examples

```ruby
User = Struct.new(:first_name, :last_name)

class Invoce
  delegate :fist_name, :last_name, to: :'@user'

  def initialize(user)
    @user = user
  end
end

user = User.new 'Genadi', 'Samokovarov'
invoice = Invoce.new(user)

invoice.fist_name #=> "Genadi"
invoice.last_name #=> "Samokovarov"
```
