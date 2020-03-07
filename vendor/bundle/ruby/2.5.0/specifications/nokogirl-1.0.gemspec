# -*- encoding: utf-8 -*-
# stub: nokogirl 1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "nokogirl".freeze
  s.version = "1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Aaron Patterson, Mike Dalessio".freeze]
  s.date = "2009-03-04"
  s.description = "".freeze
  s.email = ["aaronp@rubyforge.org".freeze, "mike.dalessio@gmail.com".freeze]
  s.extra_rdoc_files = ["lib/nokogirl.rb".freeze]
  s.files = ["lib/nokogirl.rb".freeze]
  s.homepage = "".freeze
  s.post_install_message = "\n********************************************\nIt's actually spelled nokogiri, not nokogirl\n********************************************\n\n".freeze
  s.rdoc_options = ["--line-numbers".freeze, "--inline-source".freeze, "--title".freeze, "Nokogirl".freeze]
  s.rubyforge_project = "dojo".freeze
  s.rubygems_version = "2.7.7".freeze
  s.summary = "".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
  end
end
