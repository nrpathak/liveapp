# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ffi}
  s.version = "1.0.9"
  s.platform = %q{x86-mingw32}

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Wayne Meissner}]
  s.date = %q{2011-05-21}
  s.description = %q{Ruby-FFI is a ruby extension for programmatically loading dynamic
libraries, binding functions within them, and calling those functions
from Ruby code. Moreover, a Ruby-FFI extension works without changes
on Ruby and JRuby. Discover why should you write your next extension
using Ruby-FFI here[http://wiki.github.com/ffi/ffi/why-use-ffi].}
  s.email = %q{wmeissner@gmail.com}
  s.extra_rdoc_files = [%q{README.rdoc}, %q{LICENSE}]
  s.files = [%q{README.rdoc}, %q{LICENSE}]
  s.homepage = %q{http://wiki.github.com/ffi/ffi}
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{ffi}
  s.rubygems_version = %q{1.8.9}
  s.summary = %q{Ruby-FFI is a ruby extension for programmatically loading dynamic libraries, binding functions within them, and calling those functions from Ruby code}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
