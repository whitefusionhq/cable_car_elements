require_relative 'lib/cable_car_elements/version'

Gem::Specification.new do |spec|
  spec.name          = "cable_car_elements"
  spec.version       = CableCarElements::VERSION
  spec.authors       = ["Jared White"]
  spec.email         = ["jared@whitefusion.studio"]

  spec.summary       = %q{Advanced page actions using Ruby, HTML-over-the-wire, custom elements, and CableReady}
  spec.homepage      = "https://github.com/whitefusionhq/cable_car_elements"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/whitefusionhq/cable_car_elements"
  spec.metadata["changelog_uri"] = "https://github.com/whitefusionhq/cable_car_elements/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "cable_ready", ">= 5.0.0.pre2"
end
