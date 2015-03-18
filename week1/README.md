# Week 1

Hello, and welcome to the first week of our humble little Ruby on Rails class.

![RUBYYYY](https://raw.github.com/HackBulgaria/Ruby-On-Rails-1/master/week1/.ruby.jpg)

# Setup

Installing [Ruby 2.2] or [Rails 4.2], isn't newbie friendly. Here are our tips
on how to install it on your favourite OS.

## Windows

The easiest way to get [Ruby 2.2] on Windows is this [Ruby Installer][]. Don't
forget to add the `C:\Ruby-221\bin` to the beginning of `%PATH%`.
[Here][Windows Path] is how to do it.

Alternatively, you can use [Rails Installer] and bundle a [Rails 4.2]
application.

## Linux & OSX

Follow the instructions on [rbenv installation page][]. After rbenv is
installed, run the following in a fresh terminal session.

```bash
rbenv install 2.2.1 && rbenv global 2.2.1
gem install rails
```

[Rails 4.2]: http://rubyonrails.org
[Ruby 2.2]: https://www.ruby-lang.org
[Ruby Intaller]: http://rubyinstaller.org
[Rails Installer]: http://railsinstaller.org
[Windows Path]: http://www.computerhope.com/issues/ch000549.htm
[rbenv installation page]: https://github.com/sstephenson/rbenv#installation
