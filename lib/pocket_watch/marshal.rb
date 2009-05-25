module PocketWatch
  module Marshal
    TMP_DIR = "/tmp/cache"

    def marshal(filename,data=nil)
      Dir.chdir(TMP_DIR) do
        if data != nil
          open(filename, "w") { |f| ::Marshal.dump(data, f) }
        elsif File.exists?(filename)
          open(filename) { |f| ::Marshal.load(f) }
        end
      end
    end
    
    def self.included(rec)
      ::FileUtils.mkdir_p TMP_DIR unless ::File.directory?(TMP_DIR)
    end    
  end
end