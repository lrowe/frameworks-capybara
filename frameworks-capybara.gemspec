# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{frameworks-capybara}
  s.version = "0.1.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["mcrmfc"]
  s.date = %q{2012-02-01}
  s.description = %q{gem to aid setup of Capybara for testing bbc sites}
  s.email = %q{mcrobbins@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "frameworks-capybara.gemspec",
    "lib/frameworks-capybara.rb",
    "lib/frameworks/capybara.rb",
    "lib/frameworks/cucumber.rb",
    "lib/monkey-patches/capybara-mechanize-patches.rb",
    "lib/monkey-patches/capybara-patches.rb",
    "lib/monkey-patches/cucumber-patches.rb",
    "lib/monkey-patches/mechanize-patches.rb",
    "lib/monkey-patches/send-keys.rb",
    "lib/monkey-patches/webdriver-patches.rb",
    "lib/tasks/frameworks-tasks.rake",
    "schemas/xhtml-lat1.ent",
    "schemas/xhtml-rdfa-1.dtd",
    "schemas/xhtml-special.ent",
    "schemas/xhtml-symbol.ent",
    "schemas/xhtml1-strict.dtd",
    "schemas/xhtml1-strict.xsd",
    "schemas/xhtml1-transitional.dtd",
    "schemas/xml.xsd",
    "spec/frameworks_capybara_spec.rb",
    "spec/frameworks_cucumber_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/mcrmfc/frameworks-capybara}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.0}
  s.summary = %q{gem to aid setup of Capybara for testing bbc sites}
  s.test_files = [
    "spec/frameworks_capybara_spec.rb",
    "spec/frameworks_cucumber_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<capybara>, ["< 1.0.0"])
      s.add_development_dependency(%q<capybara-mechanize>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<selenium-webdriver>, [">= 0"])
      s.add_runtime_dependency(%q<capybara>, [">= 0"])
      s.add_runtime_dependency(%q<capybara-mechanize>, [">= 0"])
      s.add_runtime_dependency(%q<headless>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 2.6.0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<capybara>, ["< 1.0.0"])
      s.add_dependency(%q<capybara-mechanize>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<selenium-webdriver>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<capybara-mechanize>, [">= 0"])
      s.add_dependency(%q<headless>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 2.6.0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<capybara>, ["< 1.0.0"])
    s.add_dependency(%q<capybara-mechanize>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<selenium-webdriver>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<capybara-mechanize>, [">= 0"])
    s.add_dependency(%q<headless>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 2.6.0"])
  end
end

