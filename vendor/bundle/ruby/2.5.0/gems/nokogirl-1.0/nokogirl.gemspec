# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{nokogirl}
  s.version = "1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aaron Patterson, Mike Dalessio"]
  s.date = %q{2009-03-04}
  s.description = %q{}
  s.email = ["aaronp@rubyforge.org", "mike.dalessio@gmail.com"]
  s.extra_rdoc_files = ["lib/nokogirl.rb"]
  s.files = ["lib/nokogirl.rb", "Message", "nokogirl.gemspec", "Rakefile"]
  s.homepage = %q{}
  s.post_install_message = %q{
********************************************
It's actually spelled nokogiri, not nokogirl
********************************************

}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Nokogirl"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{dojo}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
    else
      s.add_dependency(%q<nokogiri>, [">= 0"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 0"])
  end
end
