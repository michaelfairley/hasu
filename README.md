# Hasu

Helps you develop [Gosu](http://www.libgosu.org/) games more quickly.

## How?

### Hot code loading

Normally, when you change the code for a Gosu game, you have to close and restart the game for the code to take affect.
With Hasu, modified source files will be reloaded each time through the game loop.

### Exception catching

When an exception bubbles up out of your game loop, Gosu will crash.
When an exception occurs in a Hasu game, Hasu pauses your game, prints the exception details into your window, and resumes your game once the code that fixes it is loaded.

### Reset

Hot code loading unfortunately is worthless for your `initialize` method since your window will only be initialized once,
Instead of putting your game's setup code in `initialize`, place it in `reset` and press R whenever you want to re-initialize your game state.

## Using Hasu

__The above features only work on Ruby 2+, though Hasu will still load on earlier versions (in case you want to pack up your game with Releasy).__

### 0: Install Hasu

Add this line to your application's Gemfile:

    gem hasu

Or install it yourself as:

    $ gem install hasu

### 1: Subclass `Hasu::Window` (or prepend `Hasu::Guard`).

Instead of subclassing `Gosu::Window`, use `Hasu::Window`:

```ruby
class Game < Hasu::Window
  def initialize
    super(640, 480, false)
  end

  def reset
    # ...
  end

  def update
    # ...
  end

  def draw
    # ...
  end
end
```

If you're using Chingu (or another library which has its own window subclass), you can prepend `Hasu::Guard` onto your window for the same effect:

```ruby
class Game < Chingu::Window
  prepend Hasu::Guard

  def initialize
    super(640, 480, false)
  end

  def reset
    # ...
  end

  def update
    # ...
  end

  def draw
    # ...
  end
end
```

### 2: Use `Hasu.load` to require your game's files.

For the files you want to be hot loaded, use `Hasu.load` instead of `require`.

```ruby
Hasu.load "ball.rb"
```

### 3: Run your game with `.run`

Instead of `Game.new.show`, run your Hasu game with `Game.run`.
