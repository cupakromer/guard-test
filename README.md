Issue
-----

I've been trying to get [Guard](https://github.com/guard/guard) setup. It runs,
but I've been facing a frustrating issue where all of the tests run twice. I've
tried to reduce this to the simplest setup that reproduces the issue. This is
that setup.

Additionally, I'm running OS X 10.8.1.

  `Darwin 12.1.0 Darwin Kernel Version 12.1.0: Tue Aug 14 13:29:55 PDT 2012; root:xnu-2050.9.2~1/RELEASE_X86_64 x86_64`


Steps to Reproduce
------------------

  1. Clone the git repo

    `git clone https://github.com/cupakromer/guard-test.git`
    
  * Run `bundle` to install all the Gems
  * Start `guard` in debug mode
  
    `bundle exec guard --debug`

  * Edit the spec file `spec/lib/hello_spec.rb`
  * Just add a line that says `nil` anywhere in the file, then save.

    ```ruby
    require 'spec_helper'
    nil

    describe Hello do
      describe "#speak" do
        it "should say 'Hello friend'" do
          h = Hello.new
          h.speak("friend").should be "Hello friend"
        end
      end
    end
    ```


My Shell Output
---------------

  ```shell
  › bundle exec guard --debug
  DEBUG (19:20:26): Command execution: emacsclient --eval '1' 2> /dev/null || echo 'N/A'
  Guard could not detect any of the supported notification libraries.
  Guard is now watching at '/Users/aaron/dev/guard-test'
  DEBUG (19:20:26): Hook :start_begin executed for Guard::RSpec
  Guard::RSpec is running, with RSpec 2!
  Running all specs
  DEBUG (19:20:26): Command execution: bundle exec rspec --help
  DEBUG (19:20:27): Command execution: bundle exec rspec -f progress -r /Users/aaron/.rvm/gems/ruby-1.9.3-p194@guard-test/gems/guard-rspec-1.2.1/lib/guard/rspec/formatters/notification_rspec.rb -f Guard::RSpec::Formatter::NotificationRSpec --out /dev/null --failure-exit-code 2 spec 
  F

  Failures:

    1) Hello#speak should say 'Hello friend'
       Failure/Error: h.speak("friend").should be "Hello friend"
         
         expected #<String:70114716289980> => "Hello friend"
              got #<String:70114716290140> => "Hello friend"
         
         Compared using equal?, which compares object identity,
         but expected and actual are not the same object. Use
         'actual.should eq(expected)' if you don't care about
         object identity in this example.
       # ./spec/lib/hello_spec.rb:7:in `block (3 levels) in <top (required)>'

  Finished in 0.00159 seconds
  1 example, 1 failure

  Failed examples:

  rspec ./spec/lib/hello_spec.rb:5 # Hello#speak should say 'Hello friend'
  DEBUG (19:20:27): Start interactor
  [Listen warning]:
    Missing dependency 'rb-fsevent' (version '~> 0.9.1')!
    Please add the following to your Gemfile to satisfy the dependency:
      gem 'rb-fsevent', '~> 0.9.1'
    
    For a better performance, it's recommended that you satisfy the missing dependency.
    Listen will be polling changes. Learn more at https://github.com/guard/listen#polling-fallback.

  DEBUG (19:20:54): Stop interactor
  DEBUG (19:20:54): Trying to run Guard::RSpec#run_on_modifications with ["spec/lib/hello_spec.rb"]
  DEBUG (19:20:54): Hook :run_on_changes_begin executed for Guard::RSpec
  Running: spec/lib/hello_spec.rb
  DEBUG (19:20:54): Command execution: bundle exec rspec -f progress -r /Users/aaron/.rvm/gems/ruby-1.9.3-p194@guard-test/gems/guard-rspec-1.2.1/lib/guard/rspec/formatters/notification_rspec.rb -f Guard::RSpec::Formatter::NotificationRSpec --out /dev/null --failure-exit-code 2 spec/lib/hello_spec.rb 
  F

  Failures:

    1) Hello#speak should say 'Hello friend'
       Failure/Error: h.speak("friend").should be "Hello friend"
         
         expected #<String:70099667757200> => "Hello friend"
              got #<String:70099667757360> => "Hello friend"
         
         Compared using equal?, which compares object identity,
         but expected and actual are not the same object. Use
         'actual.should eq(expected)' if you don't care about
         object identity in this example.
       # ./spec/lib/hello_spec.rb:8:in `block (3 levels) in <top (required)>'

  Finished in 0.00092 seconds
  1 example, 1 failure

  Failed examples:

  rspec ./spec/lib/hello_spec.rb:6 # Hello#speak should say 'Hello friend'
  DEBUG (19:20:55): Start interactor
  DEBUG (19:20:55): Stop interactor
  DEBUG (19:20:55): Trying to run Guard::RSpec#run_on_modifications with ["spec/lib/hello_spec.rb"]
  DEBUG (19:20:55): Hook :run_on_changes_begin executed for Guard::RSpec
  Running: spec/lib/hello_spec.rb
  DEBUG (19:20:55): Command execution: bundle exec rspec -f progress -r /Users/aaron/.rvm/gems/ruby-1.9.3-p194@guard-test/gems/guard-rspec-1.2.1/lib/guard/rspec/formatters/notification_rspec.rb -f Guard::RSpec::Formatter::NotificationRSpec --out /dev/null --failure-exit-code 2 spec/lib/hello_spec.rb 
  F

  Failures:

    1) Hello#speak should say 'Hello friend'
       Failure/Error: h.speak("friend").should be "Hello friend"
         
         expected #<String:70188309812360> => "Hello friend"
              got #<String:70188309812420> => "Hello friend"
         
         Compared using equal?, which compares object identity,
         but expected and actual are not the same object. Use
         'actual.should eq(expected)' if you don't care about
         object identity in this example.
       # ./spec/lib/hello_spec.rb:8:in `block (3 levels) in <top (required)>'

  Finished in 0.00098 seconds
  1 example, 1 failure

  Failed examples:

  rspec ./spec/lib/hello_spec.rb:6 # Hello#speak should say 'Hello friend'
  DEBUG (19:20:56): Start interactor
  ```
