# pry-pipeline

Pipeline for pry. This adds `_pipe_` and `|` methods to String and Symbol.

## Installation

Add this line to your application's Gemfile:

```ruby
group :development do
  gem 'pry-pipeline'
end
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```sh
$ gem install pry-pipeline
```

## Simple usage

This usage is simple but unuseful.

```
$ pry
[1] pry(main)> 'Pry.run_command' | '$'

From: /Users/toqoz/.rbenv/versions/1.9.3-p327-perf/lib/ruby/gems/1.9.1/gems/pry-0.9.10/lib/pry/pry_class.rb @ line 217:
Number of lines: 12
Owner: #<Class:Pry>
Visibility: public

def self.run_command(command_string, options={})
  options = {
    :context => TOPLEVEL_BINDING,
    :show_output => true,
    :output => Pry.output,
    :commands => Pry.commands
  }.merge!(options)

  output = options[:show_output] ? options[:output] : StringIO.new

  Pry.new(:output => output, :input => StringIO.new(command_string), :commands => options[:commands], :prompt => proc {""}, :hooks => Pry::Hooks.new).rep(options[:context])
end
=> nil
```

## Useful usage(with [ruby-anything](https://github.com/ToQoz/ruby-anything))

*You can select method interactively and see its source!!!*

```
$ pry
[1] pry(main)> 'Pry.' + _anything_(Pry.methods) | '$'
>>>>>>> select method with anything interface >>>>>>>
>>>>>>> select `run_command`                  >>>>>>>
From: /Users/toqoz/.rbenv/versions/1.9.3-p327-perf/lib/ruby/gems/1.9.1/gems/pry-0.9.10/lib/pry/pry_class.rb @ line 217:
Number of lines: 12
Owner: #<Class:Pry>
Visibility: public

def self.run_command(command_string, options={})
  options = {
    :context => TOPLEVEL_BINDING,
    :show_output => true,
    :output => Pry.output,
    :commands => Pry.commands
  }.merge!(options)

  output = options[:show_output] ? options[:output] : StringIO.new

  Pry.new(:output => output, :input => StringIO.new(command_string), :commands => options[:commands], :prompt => proc {""}, :hooks => Pry::Hooks.new).rep(options[:context])
end
=> nil
```

## Tips

In your pry.(if you use [ruby-anything](https://github.com/ToQoz/ruby-anything))

```ruby
begin
  require 'ruby-anything'
  require 'pry-pipeline'
rescue LoadError => err
  puts "Failed to require. in #{__FILE__}"
end

def method_source(obj)
  "#{obj.inspect}." + _anything_(obj.methods) | '$'
end

def instance_method_source(cls)
  "#{cls.inspect}#" + _anything_(cls.instance_methods) | '$'
end
```

Start pry.

```
$ pry
[1] pry(main)> ams Pry
>>>>>>> select method with anything interface >>>>>>>
>>>>>>> select `run_command`                  >>>>>>>
From: /Users/toqoz/.rbenv/versions/1.9.3-p327-perf/lib/ruby/gems/1.9.1/gems/pry-0.9.10/lib/pry/pry_class.rb @ line 217:
Number of lines: 12
Owner: #<Class:Pry>
Visibility: public

def self.run_command(command_string, options={})
  options = {
    :context => TOPLEVEL_BINDING,
    :show_output => true,
    :output => Pry.output,
    :commands => Pry.commands
  }.merge!(options)

  output = options[:show_output] ? options[:output] : StringIO.new

  Pry.new(:output => output, :input => StringIO.new(command_string), :commands => options[:commands], :prompt => proc {""}, :hooks => Pry::Hooks.new).rep(options[:context])
end
=> nil
```

:)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
