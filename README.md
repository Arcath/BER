# BER [![Build Status](https://travis-ci.org/Arcath/BER.png?branch=master)](https://travis-ci.org/Arcath/BER)

Implementation of Basic Encoding Rules (BER) in ruby

## Installation

Install via Rubygems:

    $ gem install ber
	
Or add as a dependency to your gem 

## Usage

Adds a `to_ber` to the supported classes e.g.

    "Foo".to_ber
	>> "\x04\x03foo"

Which in BER means that the supplied data is a string of length 3.

BER extends all the supported classes so all you need to do is require it somewhere in your gem.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
