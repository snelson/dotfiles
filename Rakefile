require 'rake'
require 'erb'
require 'fileutils'

EXCLUDE_FILES = %w[Rakefile README.md LICENSE Brewfile config].freeze

desc "Install the dot files into user's home directory"
task :install do
  replace_all = false

  # Handle regular dotfiles
  Dir['*'].each do |file|
    next if EXCLUDE_FILES.include? file

    target = File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")

    if File.exist?(target)
      if File.identical?(file, target)
        puts "identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file(file, target)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file, target)
        when 'y'
          replace_file(file, target)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file, target)
    end
  end

  # Handle config directory (for ~/.config)
  setup_config_dir
end

desc "Install Homebrew dependencies from Brewfile"
task :brew do
  if File.exist?('Brewfile')
    puts "Installing Homebrew dependencies..."
    system 'brew bundle'
  else
    puts "No Brewfile found"
  end
end

desc "Full setup: brew install + dotfiles install"
task :setup => [:brew, :install]

def replace_file(file, target)
  system %Q{rm -rf "#{target}"}
  link_file(file, target)
end

def link_file(file, target)
  if file =~ /.erb$/
    puts "generating #{target}"
    File.open(target, 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking #{target}"
    system %Q{ln -s "$PWD/#{file}" "#{target}"}
  end
end

def setup_config_dir
  config_source = File.join(Dir.pwd, 'config')
  return unless File.directory?(config_source)

  # Handle each subdirectory in config/
  Dir.entries(config_source).each do |entry|
    next if entry.start_with?('.')

    source = File.join(config_source, entry)
    next unless File.directory?(source)

    config_home = ENV['XDG_CONFIG_HOME'] || File.join(ENV['HOME'], '.config')
    FileUtils.mkdir_p(config_home)

    target = File.join(config_home, entry)

    if File.exist?(target) || File.symlink?(target)
      if File.symlink?(target) && File.readlink(target) == source
        puts "identical #{target}"
      else
        print "overwrite #{target}? [yn] "
        case $stdin.gets.chomp
        when 'y'
          FileUtils.rm_rf(target)
          puts "linking #{target}"
          File.symlink(source, target)
        else
          puts "skipping #{target}"
        end
      end
    else
      puts "linking #{target}"
      File.symlink(source, target)
    end
  end
end
