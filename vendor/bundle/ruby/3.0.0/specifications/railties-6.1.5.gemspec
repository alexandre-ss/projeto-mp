# -*- encoding: utf-8 -*-
# stub: railties 6.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "railties".freeze
  s.version = "6.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/rails/rails/issues", "changelog_uri" => "https://github.com/rails/rails/blob/v6.1.5/railties/CHANGELOG.md", "documentation_uri" => "https://api.rubyonrails.org/v6.1.5/", "mailing_list_uri" => "https://discuss.rubyonrails.org/c/rubyonrails-talk", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/rails/rails/tree/v6.1.5/railties" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["David Heinemeier Hansson".freeze]
  s.bindir = "exe".freeze
  s.date = "2022-03-10"
  s.description = "Rails internals: application bootup, plugins, generators, and rake tasks.".freeze
  s.email = "david@loudthinking.com".freeze
  s.executables = ["rails".freeze]
  s.files = ["exe/rails".freeze]
  s.homepage = "https://rubyonrails.org".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--exclude".freeze, ".".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.2.3".freeze
  s.summary = "Tools for creating, working with, and running Rails applications.".freeze

  s.installed_by_version = "3.2.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activesupport>.freeze, ["= 6.1.5"])
    s.add_runtime_dependency(%q<actionpack>.freeze, ["= 6.1.5"])
    s.add_runtime_dependency(%q<rake>.freeze, [">= 12.2"])
    s.add_runtime_dependency(%q<thor>.freeze, ["~> 1.0"])
    s.add_runtime_dependency(%q<method_source>.freeze, [">= 0"])
    s.add_development_dependency(%q<actionview>.freeze, ["= 6.1.5"])
  else
    s.add_dependency(%q<activesupport>.freeze, ["= 6.1.5"])
    s.add_dependency(%q<actionpack>.freeze, ["= 6.1.5"])
    s.add_dependency(%q<rake>.freeze, [">= 12.2"])
    s.add_dependency(%q<thor>.freeze, ["~> 1.0"])
    s.add_dependency(%q<method_source>.freeze, [">= 0"])
    s.add_dependency(%q<actionview>.freeze, ["= 6.1.5"])
  end
end
