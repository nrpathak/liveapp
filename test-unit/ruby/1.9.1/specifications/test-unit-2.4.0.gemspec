# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{test-unit}
  s.version = "2.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Kouhei Sutou}, %q{Haruka Yoshihara}]
  s.date = %q{2011-09-18}
  s.description = %q{Ruby 1.9.x bundles minitest not Test::Unit. Test::Unit
bundled in Ruby 1.8.x had not been improved but unbundled
Test::Unit (test-unit 2) will be improved actively.
}
  s.email = [%q{kou@cozmixng.org}, %q{yoshihara@clear-code.com}]
  s.executables = [%q{testrb}]
  s.extra_rdoc_files = [%q{README.textile}, %q{TODO}]
  s.files = [%q{bin/testrb}, %q{README.textile}, %q{TODO}]
  s.homepage = %q{http://test-unit.rubyforge.org/}
  s.licenses = [%q{Ruby's and PSFL (lib/test/unit/diff.rb)}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{test-unit}
  s.rubygems_version = %q{1.8.9}
  s.summary = %q{test-unit 2 - Improved version of Test::Unit bundled in Ruby 1.8.x.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end
