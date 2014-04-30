# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: yaml_constant_creation 0.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "yaml_constant_creation"
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Robert R. Meyer"]
  s.date = "2014-04-30"
  s.description = "Parses yaml files in a given diretory and turns them into constants with methods"
  s.email = "Blue.Dog.Archolite@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "LICENSE.txt",
    "README.md",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".ruby-gemset",
    ".ruby-version",
    "Gemfile",
    "LICENSE",
    "LICENSE.txt",
    "README.md",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/yaml_constant_creation.rb",
    "lib/yaml_to_constants.rb",
    "test/helper.rb",
    "test/test_yaml_constant_creation.rb",
    "test/yaml_autoload/level_2/test_a.yaml",
    "test/yaml_autoload/level_2/test_b.yaml",
    "test/yaml_autoload/test_a.yaml",
    "test/yaml_autoload/test_b.yaml",
    "test/yaml_autoload/test_c.yaml",
    "test/yaml_to_constants_test.rb"
  ]
  s.homepage = "http://github.com/Blue-Dog-Archolite/yaml_constant_creation"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "TODO: one-line summary of your gem"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end

