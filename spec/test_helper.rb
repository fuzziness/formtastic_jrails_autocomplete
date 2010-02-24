require 'rubygems'

def smart_require(lib_name, gem_name, gem_version = '>= 0.0.0')
  begin
    require lib_name if lib_name
  rescue LoadError
    if gem_name
      gem gem_name, gem_version
      require lib_name if lib_name
    end
  end
end

smart_require 'spec', 'spec', '>= 1.2.6'
smart_require false, 'rspec-rails', '>= 1.2.6'
smart_require 'active_support', 'activesupport', '>= 2.3.4'
smart_require 'action_controller', 'actionpack', '>= 2.3.4'
smart_require 'action_view', 'actionpack', '>= 2.3.4'
smart_require 'formtastic', 'formtastic', '>=0.2.5'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
