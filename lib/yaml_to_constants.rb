# 1) Loads all files out of config/yaml_autoload/**/*.yaml
# 2) Uses namespace based on file structure (overseer/blah.yaml) becomes
#    Configuration::Overseer::Blah
# 3) Only loads configuration for locale or generic configuration
# 4) Checks for environment names at top level for environment specific configuration
module YamlToConstants
  class << self
    @@constants_created = Set.new
    @@default_namespace = "Configuration"

    #functional methods
    def loaded_file_paths
      @@loaded_file_paths ||= begin
                                path = self.directory_load_path
                                path += "/**/*" if self.recursive?
                                Dir.glob(path).select { |fn| File.file?(fn) }
                              end
    end

    def initilize_all_files
      loaded_file_paths.each do |file_path|
        new_constant = constant_from_file_path(file_path)
        new_constant_full = new_constant.join('::')
        full_path = []
        new_constant.each do |const|
          full_path << const
          full_path_text = full_path.join("::")

          unless @@constants_created.include?(full_path_text)
            Kernel.eval("#{full_path_text} =  Module.new")
            @@constants_created.add(full_path_text)
          end
        end

        to_eval = ("#{new_constant_full} = YamlToConstants.methods_from_file('#{file_path}') ")
        puts to_eval
        Kernel.eval(to_eval)
        @@constants_created.add(new_constant_full)
      end
    end

    def purge!
      puts "PURGE " <<  @@constants_created.inspect
      @@constants_created = Set.new
      #Purge all objects created from the system for reset
      #Need to figure this out
#     Object.send(:remove_const, "#{default_namespace}".to_sym) if defined?(default_namespace.to_sym)
    end

    #Configuration variables
    def load_configurations
      #reset defaults
      @@configuration_constants = nil
      @@loaded_file_paths = nil
      @@recursive = true
      #Clean any left over constants from previous setup
      purge!

      #Assign options
      yield self

      #Create new constants with yaml values
      initilize_all_files
    end

    def directory_load_path=(directory_path)
      @@directory_load_path = directory_path
    end

    def recursive=(bool)
      @@recursive = bool
    end

    def namespace=(name_space)
      name_space = if name_space.is_a?(String)
                     name_space.constantize = Module.new
                   else
                     name_space
                   end

      @@constants_created << name_space
      @@default_namespace = name_space
    end

    def recursive?
      @@recursive
    end

    def default_namespace
      @@default_namespace
    end

    def directory_load_path
      @@directory_load_path
    end

    #defined? Constant will check to see if it exists
    def parse_file(file_path)
      Psych.load_file(file_path)
    end

    def methods_from_file(file_path)
      RecursiveOpenStruct.new(parse_file(file_path), :recurse_over_arrays => true)
    end

    def constant_from_file_path(file_path)
      cst = file_path.gsub(directory_load_path, "").split(/\/|\./).compact
      [default_namespace, cst].flatten.reject{|k|
        k =~ /yaml/i
      }.map(&:classify).compress
    end

  end


end
