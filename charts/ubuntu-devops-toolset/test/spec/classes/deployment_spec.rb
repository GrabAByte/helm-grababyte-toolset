#|/usr/bin/env ruby
require 'YAML'
require 'minitest/autorun'

def manifest
  YAML.load_file(ARGV[0])
end

describe 'manifest' do
  describe 'metadata' do
    it 'must declare name' do
      assert_equal 'ubuntu-devops-toolset', manifest['metadata']['name']
    end
  end
end
