# Recipe

A DSL for cooking recipes.

Describe your recipe, then use a Recipe::Printer to render it however you would like.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'recipe'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install recipe

## Usage

``` ruby
require "recipe"

Recipe::DSL.new do |recipe|
  recipe.name "Example Recipe"

  recipe.mix "Toast"
  recipe.ingredient "Bread", "2 slices"
  recipe.instruction "Place bread in toaster."

  recipe.printer Recipe::RubyistPrinter # TODO: Add more printers
end

```

## Contributing

1. Fork it ( https://github.com/cyberarm/recipe/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
