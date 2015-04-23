Howdy!

This won't be your regular Rails task. Here we'll be testing your Ruby skills and try to break you mentaly. You'll be put through a series of well-designed exercises that have the sole purpose of tearing your soul and making you cry like a baby. A two-year old. Seriously. Nah, just kidding. Or am I? Why am I wasting your time with pointless introduction? I don't really know. It's funny though. Ok... ok... Stopping. Back to the task.

You're a developer. What's more - you're an engineer. A mighty one! (You really thought I will stop, right?) You know matrices. We won't surprise you with some basic array juggling stuff. This one is all about matrices. Furthermore, it is about sparse matrices and the waste of space.

Talking about matrices, we need a handy way to represent them. We can see them but Ruby cannot. So we'll have to make it see what we see. The language offers lots of choices. What we'll be working with this time is nested arrays. We'll represent a matrix with the following data structure:

```ruby
[[1, 2, 3, 4],
 [5, 6, 7, 8],
 [9, 8, 7, 6],
 [5, 4, 3, 2]]
```

Equal number of rows and columns. Sweet!

Let see what a sparse matrix looks like:

```ruby
[[1, nil, nil, nil],
 [nil, 2, 5, nil],
 [6, nil, nil, 7],
 [nil, 3, nil, 4]]
```

As you've probably already noticed. Most of this matrix is a giant waste of space. Not only it devours real estate from your computer screen but it also absorbs your prescious memory juice! Most of the elements of this matrix don't bring any value to us. It is filled with `nil`s. Blah!

We need a solution to this problem immediately! And this time we won't be getting Bruce Willis on the phone. We'll count on you!

Here's the plan. Legends speak about a way to efficiently represent matrices of this kind. Named after it's great founder ([Robert Tarjan](http://en.wikipedia.org/wiki/Robert_Tarjan)), I'm presenting you the Tarjan table:

```ruby
[[0, 1], [1, 2], [2, 5], [0, 6], nil, [1, 3], [3, 7], [3, 4]]
```

Remember him? This is the same data from our "not-so-good-looking" sparse matrix presented in a different form. A bit sweeter, don't you think?

Here's the secret recipe for constructing such "tables". We take the data from our initial matrix and present it as rows of packages where a package is a construct of the form `[column_number, value]` and value is not `nil`. We insert these package in the first available position of the new table so that all of the packages in the row could fit in the table (the places where we're inserting them are empty). I know how clear this last sentence is so let's break it into pieces:

1. We start with empty table - `[]`.
2. We take the first row of packages `[[0, 1]]` and try to fit it in the table. It fits nicely in the first position - `[[0, 1]]`. Sweet!
3. We take the second row of packages `[[1, 2], [2, 5]]`. It doesn't fit in the first and second positions `cause the first one is already taken. Second and third however are empty, so we shove it there - `[[0, 1], [1, 2], [2, 5]]`.
4. We take the third row of packages `[[0, 6], [3, 7]]` and try to fit it in the table. Since it's first element's index is 0 and it's second element's index is 3 we need to find two empty spots in the table that are 3 elements apart. First and fourth are no good since first is taken. Second and fifth are no good either since second is taken. Third is not free too. Fourth and seventh however seem fine. Let's put it there - `[[0, 1], [1, 2], [2, 5], [0, 6], nil, nil, [3, 7]]`. See how we left some positions empty? This is because we preserve the distance that the elements of a package are apart. This is key ingredient to making Tarjan tables work!
5. The last row of packages is `[[1, 3], [3, 4]]`. Following the same steps we position them in sixth and eighth slots respectively.

This is how we end up with `[[0, 1], [1, 2], [2, 5], [0, 6], nil, [1, 3], [3, 7], [3, 4]]`. Now we need some code for telling the machine how to do this tedious computation so that we could enjoy our lifes in a more appropriate manner.

We want you to solve the mistery of the sparse matrices and we want you to do it as a MONKEY PATCH!. `Array#compress` is what we'll call it. It will produce a Tarjan table out of a matrix. Be careful... HERE BE DRAGONS!

```ruby
[[1, nil, nil, nil],
 [nil, 2, 5, nil],
 [6, nil, nil, 7],
 [nil, 3, nil, 4]].compress #=> [[0, 1], [1, 2], [2, 5], [0, 6], nil, [1, 3], [3, 7], [3, 4]]
```

Good luck!
