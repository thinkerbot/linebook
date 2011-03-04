require 'erb'

# Generated by Linecook, do not edit.
module Linebook
  module Os
    module Ubuntu
      require 'linebook/os/linux'
      include Linux
      
      def package(name, version=nil)
        #  sudo apt-get -q -y install <%= name %><%= blank?(version) ? nil : "=#{version}" %>
        #  <% check_status %>
        _erbout.concat "sudo apt-get -q -y install "; _erbout.concat(( name ).to_s); _erbout.concat(( blank?(version) ? nil : "=#{version}" ).to_s); _erbout.concat "\n"
        check_status ;
        self
      end
      
      def _package(*args, &block) # :nodoc:
        capture { package(*args, &block) }
      end
    end
  end
end
