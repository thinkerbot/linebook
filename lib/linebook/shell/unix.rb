require 'erb'

# Generated by Linecook, do not edit.
module Linebook
  module Shell
    module Unix
      require 'linebook/shell/posix'
      include Posix
      
      def shell_path
        @shell_path ||= '/bin/sh'
      end
      
      def env_path
        @env_path ||= '/usr/bin/env'
      end
      
      def target_format
        @target_format ||= "%s"
      end
      
      def target_path(target_name)
        target_format % super(target_name)
      end
      
      def close
        unless closed?
          section " (#{target_name}) "
        end
        
        super
      end
      
      # Executes 'cat' with the sources.
      def cat(*sources)
        cmd 'cat', *sources
        self
      end
      
      def _cat(*args, &block) # :nodoc:
        capture { cat(*args, &block) }
      end
      
      def chmod(mode, target)
        if mode
          cmd 'chmod', mode, target
        end
        self
      end
      
      def _chmod(*args, &block) # :nodoc:
        capture { chmod(*args, &block) }
      end
      
      def chown(user, group, target)
        if user || group
          cmd 'chown', "#{user}:#{group}", target
        end
        self
      end
      
      def _chown(*args, &block) # :nodoc:
        capture { chown(*args, &block) }
      end
      
      def cp(source, target)
        cmd 'cp', source, target
        self
      end
      
      def _cp(*args, &block) # :nodoc:
        capture { cp(*args, &block) }
      end
      
      def cp_f(source, target)
        cmd 'cp', '-f', source, target
        self
      end
      
      def _cp_f(*args, &block) # :nodoc:
        capture { cp_f(*args, &block) }
      end
      
      def cp_r(source, target)
        cmd 'cp', '-r', source, target
        self
      end
      
      def _cp_r(*args, &block) # :nodoc:
        capture { cp_r(*args, &block) }
      end
      
      def cp_rf(source, target)
        cmd 'cp', '-r', '-f', source, target
        self
      end
      
      def _cp_rf(*args, &block) # :nodoc:
        capture { cp_rf(*args, &block) }
      end
      
      def directory?(path)
        #  [ -d "<%= path %>" ]
        _erbout.concat "[ -d \""; _erbout.concat(( path ).to_s); _erbout.concat "\" ]";
        self
      end
      
      def _directory?(*args, &block) # :nodoc:
        capture { directory?(*args, &block) }
      end
      
      # Echo the args.
      def echo(*args)
        #  echo '<%= args.join(' ') %>'
        #  
        _erbout.concat "echo '"; _erbout.concat(( args.join(' ') ).to_s); _erbout.concat "'\n"
        self
      end
      
      def _echo(*args, &block) # :nodoc:
        capture { echo(*args, &block) }
      end
      
      def exists?(path)
        #  [ -e "<%= path %>" ]
        _erbout.concat "[ -e \""; _erbout.concat(( path ).to_s); _erbout.concat "\" ]";
        self
      end
      
      def _exists?(*args, &block) # :nodoc:
        capture { exists?(*args, &block) }
      end
      
      def file?(path)
        #  [ -f "<%= path %>" ]
        _erbout.concat "[ -f \""; _erbout.concat(( path ).to_s); _erbout.concat "\" ]";
        self
      end
      
      def _file?(*args, &block) # :nodoc:
        capture { file?(*args, &block) }
      end
      
      def ln(source, target)
        cmd 'ln', source, target
        self
      end
      
      def _ln(*args, &block) # :nodoc:
        capture { ln(*args, &block) }
      end
      
      def ln_s(source, target)
        cmd 'ln', '-s', source, target
        self
      end
      
      def _ln_s(*args, &block) # :nodoc:
        capture { ln_s(*args, &block) }
      end
      
      # Make a directory
      def mkdir(path)
        cmd 'mkdir', path
        self
      end
      
      def _mkdir(*args, &block) # :nodoc:
        capture { mkdir(*args, &block) }
      end
      
      # Make a directory, and parent directories as needed.
      def mkdir_p(path)
        cmd 'mkdir', '-p', path
        self
      end
      
      def _mkdir_p(*args, &block) # :nodoc:
        capture { mkdir_p(*args, &block) }
      end
      
      def mv(source, target)
        cmd 'mv', source, target
        self
      end
      
      def _mv(*args, &block) # :nodoc:
        capture { mv(*args, &block) }
      end
      
      def mv_f(source, target)
        cmd 'mv', '-f', source, target
        self
      end
      
      def _mv_f(*args, &block) # :nodoc:
        capture { mv_f(*args, &block) }
      end
      
      def quiet()
        #  set +x +v<% if block_given? %>
        #  <% indent { yield } %>
        #  set $LINECOOK_OPTS > /dev/null<% end %>
        #  
        #  
        _erbout.concat "set +x +v";  if block_given? ; _erbout.concat "\n"
        indent { yield } 
        _erbout.concat "set $LINECOOK_OPTS > /dev/null";  end ; _erbout.concat "\n"
        _erbout.concat "\n"
        self
      end
      
      def _quiet(*args, &block) # :nodoc:
        capture { quiet(*args, &block) }
      end
      
      # Unlink a file.
      def rm(path)
        cmd 'rm', path
        self
      end
      
      def _rm(*args, &block) # :nodoc:
        capture { rm(*args, &block) }
      end
      
      # Unlink a file or directory.
      def rm_r(path)
        cmd 'rm', '-r', path
        self
      end
      
      def _rm_r(*args, &block) # :nodoc:
        capture { rm_r(*args, &block) }
      end
      
      # Unlink a file or directory, forcefully.
      def rm_rf(path)
        cmd 'rm', '-rf', path
        self
      end
      
      def _rm_rf(*args, &block) # :nodoc:
        capture { rm_rf(*args, &block) }
      end
      
      def section(comment="")
        n = (78 - comment.length)/2
        str = "-" * n
        #  #<%= str %><%= comment %><%= str %><%= "-" if comment.length % 2 == 1 %>
        #  
        _erbout.concat "#"; _erbout.concat(( str ).to_s); _erbout.concat(( comment ).to_s); _erbout.concat(( str ).to_s); _erbout.concat(( "-" if comment.length % 2 == 1 ).to_s); _erbout.concat "\n"
        self
      end
      
      def _section(*args, &block) # :nodoc:
        capture { section(*args, &block) }
      end
      
      # == Notes
      # Use dev/null on set such that no options will not dump ENV into stdout.
      def shebang(options={})
        @target_format = '$LINECOOK_DIR/%s'
        #  #! <%= shell_path %>
        #  <% section %>
        #  <%= check_status_function %>
        #  
        #  export LINECOOK_DIR=${LINECOOK_DIR:-$(cd $(dirname $0); pwd)}
        #  export LINECOOK_OPTS=${LINECOOK_OPTS:--v}
        #  
        #  usage="usage: %s: [-hqvx]\n"
        #  option="       %s   %s\n"
        #  while getopts "hqvx" opt
        #  do
        #    case $opt in
        #    h  )  printf "$usage" $0
        #          printf "$option" "-h" "prints this help"
        #          printf "$option" "-q" "quiet (set +v +x)"
        #          printf "$option" "-v" "verbose (set -v)"
        #          printf "$option" "-x" "xtrace (set -x)"
        #          exit 0 ;;
        #    q  )  LINECOOK_OPTS="$LINECOOK_OPTS +v +x";;
        #    v  )  LINECOOK_OPTS="$LINECOOK_OPTS -v";;
        #    x  )  LINECOOK_OPTS="$LINECOOK_OPTS -x";;
        #    \? )  printf "$usage" $0
        #          exit 2 ;;
        #    esac
        #  done
        #  shift $(($OPTIND - 1))
        #  
        #  <% if options[:info] %>
        #  echo >&2
        #  echo "###############################################################################" >&2
        #  echo "# $SHELL" >&2
        #  echo "# $(whoami)@$(hostname):$(pwd)" >&2
        #  
        #  <% end %>
        #  set $LINECOOK_OPTS > /dev/null
        #  <% section " #{target_name} " %>
        #  
        #  
        _erbout.concat "#! "; _erbout.concat(( shell_path ).to_s); _erbout.concat "\n"
        section 
        _erbout.concat(( check_status_function ).to_s)
        _erbout.concat "\n"
        _erbout.concat "export LINECOOK_DIR=${LINECOOK_DIR:-$(cd $(dirname $0); pwd)}\n"
        _erbout.concat "export LINECOOK_OPTS=${LINECOOK_OPTS:--v}\n"
        _erbout.concat "\n"
        _erbout.concat "usage=\"usage: %s: [-hqvx]\\n\"\n"
        _erbout.concat "option=\"       %s   %s\\n\"\n"
        _erbout.concat "while getopts \"hqvx\" opt\n"
        _erbout.concat "do\n"
        _erbout.concat "  case $opt in\n"
        _erbout.concat "  h  )  printf \"$usage\" $0\n"
        _erbout.concat "        printf \"$option\" \"-h\" \"prints this help\"\n"
        _erbout.concat "        printf \"$option\" \"-q\" \"quiet (set +v +x)\"\n"
        _erbout.concat "        printf \"$option\" \"-v\" \"verbose (set -v)\"\n"
        _erbout.concat "        printf \"$option\" \"-x\" \"xtrace (set -x)\"\n"
        _erbout.concat "        exit 0 ;;\n"
        _erbout.concat "  q  )  LINECOOK_OPTS=\"$LINECOOK_OPTS +v +x\";;\n"
        _erbout.concat "  v  )  LINECOOK_OPTS=\"$LINECOOK_OPTS -v\";;\n"
        _erbout.concat "  x  )  LINECOOK_OPTS=\"$LINECOOK_OPTS -x\";;\n"
        _erbout.concat "  \\? )  printf \"$usage\" $0\n"
        _erbout.concat "        exit 2 ;;\n"
        _erbout.concat "  esac\n"
        _erbout.concat "done\n"
        _erbout.concat "shift $(($OPTIND - 1))\n"
        _erbout.concat "\n"
        if options[:info] 
        _erbout.concat "echo >&2\n"
        _erbout.concat "echo \"###############################################################################\" >&2\n"
        _erbout.concat "echo \"# $SHELL\" >&2\n"
        _erbout.concat "echo \"# $(whoami)@$(hostname):$(pwd)\" >&2\n"
        _erbout.concat "\n"
        end 
        _erbout.concat "set $LINECOOK_OPTS > /dev/null\n"
        section " #{target_name} " 
        _erbout.concat "\n"
        self
      end
      
      def _shebang(*args, &block) # :nodoc:
        capture { shebang(*args, &block) }
      end
      
      def verbose()
        #  set -v<% if block_given? %>
        #  <% indent { yield } %>
        #  set $LINECOOK_OPTS > /dev/null<% end %>
        #  
        #  
        _erbout.concat "set -v";  if block_given? ; _erbout.concat "\n"
        indent { yield } 
        _erbout.concat "set $LINECOOK_OPTS > /dev/null";  end ; _erbout.concat "\n"
        _erbout.concat "\n"
        self
      end
      
      def _verbose(*args, &block) # :nodoc:
        capture { verbose(*args, &block) }
      end
      
      def xtrace()
        #  set -x<% if block_given? %>
        #  <% indent { yield } %>
        #  set $LINECOOK_OPTS > /dev/null<% end %>
        #  
        #  
        _erbout.concat "set -x";  if block_given? ; _erbout.concat "\n"
        indent { yield } 
        _erbout.concat "set $LINECOOK_OPTS > /dev/null";  end ; _erbout.concat "\n"
        _erbout.concat "\n"
        self
      end
      
      def _xtrace(*args, &block) # :nodoc:
        capture { xtrace(*args, &block) }
      end
    end
  end
end
