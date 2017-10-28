Pod::Spec.new do |spec|
  spec.name = "ISBNValidator"
  spec.version = "1.0.0"
  spec.summary = "Simple framework for validating ISBN numbers."
  spec.homepage = "https://github.com/timd/ISBNValidator.git"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Your Name" => 'tim@duckett.de' }
  spec.social_media_url = "http://twitter.com/timduckett"

  spec.platform = :ios, "11.1"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/timd/ISBNValidator.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "ISBNValidator/**/*.{h,swift}"
end