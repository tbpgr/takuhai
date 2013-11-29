require "takuhai/version"
require "takuhai_dsl"
require "date"

module Takuhai
  class Core
    TAKUHAI_FILE = "Takuhaifile"

    TAKUHAI_TEMPLATE =<<-EOS
# encoding: utf-8

# write your ssh login user name. this attribute is required.
# ex:user "app"
user "TODO: user"

# write your ssh login server_name name or ip. this attribute is required.
# ex1:server "some_server"
# ex2:user "192.168.10.11"
server "TODO: server"

# write your targets. this attribute is required.
# ex1:targets "app.log-2011-10-*"
# ex2:targets "app.log-2011-10-01 app.log-2011-10-02 app.log-2011-10-05"
targets "TODO: targets"

# write your log directory. this attribute is required.
# ex:target_dir "/home/app/some_system/log/production"
target_dir "TODO: target_dir"

# write your output_base_name.this value is using in tarball file name and output file name. this attribute is required.
# ex:output_base_name "server_log"
output_base_name "output"

# write output file's extension.this attribute is required.
# ex:output_extension "tsv"
output_extension "txt"

# if you want to execute some logic for line data, edit following code. this attribute is option.
# ex: if line have "ERROR", append !!ERROR!! to line String.
# block do |file, line|
#   line = "!!ERROR!!" + line if line.include?("ERROR")
#   line
# end
block do |file, line|
  line
end
    EOS

    def init
      File.open(TAKUHAI_FILE, "w") {|f|f.puts TAKUHAI_TEMPLATE}
    end

    def collect
      src = read_collect_define
      @dsl = Takuhai::Dsl.new
      @dsl.instance_eval src

      @outtime = DateTime.now.strftime("%Y%m%d%H%M%S")
      @target_dir_name = "#{@dsl._output_base_name}#{@outtime}"
      @tar_gz_name = "#{@dsl._output_base_name}.#{@outtime}.tar.gz"

      tar_compress_log
      down_load_tar
      create_target_dir
      move_tar
      move_to_target_dir
      extract_tar
      read_line_and_execute_defined_login
    end

    private
    def read_collect_define
      File.open(TAKUHAI_FILE) {|f|f.read}
    end

    def tar_compress_log
      `ssh #{@dsl._user}@#{@dsl._server} 'cd #{@dsl._target_dir};tar czvf #{@tar_gz_name} #{@dsl._targets}'`
    end

    def down_load_tar
      `scp #{@dsl._user}@#{@dsl._server}:#{@dsl._target_dir}/#{@tar_gz_name} .`
    end

    def create_target_dir
      Dir.mkdir(@target_dir_name) unless File.exists? @target_dir_name
    end

    def move_tar
      `mv #{@tar_gz_name} ./#{@target_dir_name}`
    end

    def move_to_target_dir
      Dir.chdir("./#{@target_dir_name}")
    end

    def extract_tar
      `tar xvfz #{@tar_gz_name}`
    end

    def read_line_and_execute_defined_login
      total_rets = []
      targets = @dsl._targets.split(" ")
      targets.each do |target|
        Dir.glob("./#{target}") do |f|
          lines = File.open(f) {|f|f.read}
          lines.each_line {|line|total_rets << @dsl._block.call(f, line)}
        end
        File.open("../#{@target_dir_name}.#{@dsl._output_extension}", "w") {|f| f.puts total_rets.join}
      end
    end
  end
end
