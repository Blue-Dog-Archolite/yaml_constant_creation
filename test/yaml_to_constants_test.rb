require "test_helper"

describe YamlToConstants do
  let(:path) { "#{Rails.root}/test/data/config/yaml_autoload" }

  it "responds to load_configurations" do
    YamlToConstants.load_configurations do |config|
      config.directory_load_path= path
      config.recursive = true
    end

    assert_equal path, YamlToConstants.directory_load_path
    YamlToConstants.initilize_all_files
    refute_nil defined?(Configuration::TestA)
    refute_nil defined?(Configuration::TestB)
    refute_nil defined?(Configuration::TestC)
  end
#
#  describe "Once configured with recursive" do
#    before do
#      YamlToConstants.stubs(:initilize_all_files).returns({})
#      YamlToConstants.load_configurations do |config|
#        config.directory_load_path= path
#        config.recursive = true
#      end
#    end
#
#    it "correctly lists files in directory to be loaded" do
#      assert YamlToConstants.recursive?
#      assert_equal Dir.glob(path + "/**/*").select { |fn| File.file?(fn) }, YamlToConstants.loaded_file_paths
#    end
#
#    it "creates objects" do
#      refute_nil defined?(Configuration::TestA)
#      refute_nil defined?(Configuration::TestB)
#      refute_nil defined?(Configuration::TestC)
#      raise YamlToConstants.purge!
#    end
#  end
#
#  describe "Once configured without recursion"  do
#    before do
#      YamlToConstants.load_configurations do |config|
#        config.directory_load_path= path
#        config.recursive = false
#      end
#    end
#
#    it "correctly lists files in directory to be loaded" do
#      refute YamlToConstants.recursive?
#      assert_equal Dir.glob(path).select { |fn| File.file?(fn) }, YamlToConstants.loaded_file_paths
#    end
#
#    it "creates objects from parsed yaml" do
#      refute_nil defined?(Configuration::TestA)
#      refute_nil defined?(Configuration::TestB)
#      refute_nil defined?(Configuration::TestC)
#    end
#  end
end
