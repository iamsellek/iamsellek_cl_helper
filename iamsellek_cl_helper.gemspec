# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iamsellek_cl_helper/version'

Gem::Specification.new do |spec|
  spec.name           = 'iamsellek_cl_helper'
  spec.version        = IamsellekClHelper::VERSION
  spec.authors        = ['Chris Sellek']
  spec.email          = ['iamsellek@gmail.com']

  spec.summary        = 'Common/helper methods for my command-line apps.'
  spec.description    = 'None.'
  spec.homepage       = 'https://github.com/iamsellek/iamsellek_cl_helper'
  spec.license        = 'MIT'

  spec.files          = `git ls-files`.split($/)
  spec.executables    = ['iamsellek_cl_helper']
  spec.test_files     = []
  spec.require_paths  = ['lib']

  spec.add_dependency 'rainbow'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
end