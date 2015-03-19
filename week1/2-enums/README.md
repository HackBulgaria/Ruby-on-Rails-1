Hey!

You like Ruby. I hope you do. In this task we'll try to bring some functionality from statically-typed languages back to Ruby.

We're talking about enums now. As you saw in the course materials, we suggest using symbols for implementing enumerations of values in Ruby. Somewhat an alternative to the enums in C, Java, C#, etc... We would like to take this a step further. We want to define the type of the enumerated values and get errors if we try to use a value that is not available for a specific type. See the example below.

Let say we want to implement a functionality that depends on a specified direction.

```ruby
def move_towards(direction)
  # ...
end

move_towards(:west)
```

The issue we see here is that we could pick any value for the direction. It could be a misspelled word `:wst` or `:something_totaly_different`. This will cause errors somewhere in the body of the method. We want to fail immediately if we use wrong enum value. We would like to "package" the values `:east`, `:west`, `:south` and `:north` in an enum object that we could access with the name "direction". We would like to still work with symbols cause they are nice and lightweight but we would like to construct them with this object so that we could verify if the symbol is a correct value for a specific enum. A lot of words, now for the example.

```ruby
Enums.map :direction, to: [:east, :west, :south, :north]
```

The above declaretion creates a "direction" enum with values `:east`, `:west`, `:south`, `:north`.

```ruby
def move_towards(direction)
  # ...
end

move_towards(Enums.direction.west)
```

This shows how we use the enum. Now if we misspell the value we would get a `NoMethodError`. We are safe on that part.

```ruby
move_towards(Enums.direction.wst) #=> undefined method `wst' for ... (NoMethodError)
```

The error we expect is `NoMethodError` and the description is similar to the one you'll get when calling an undefined method on an object.

We would also want to be able to enumerate the values of an enum. So "direction" should be a valid enumerable object.

Have fun!
