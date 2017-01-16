module IamsellekClHelper
  # Attempt to restore settings from previous version.
  def restore_settings(gem_name)
    lines_pretty_print "I see that you have a previous #{gem_name} installation on this machine."
    lines_pretty_print Rainbow('Would you like to restore its settings?').yellow

    answered = false

    until answered
      answer = STDIN.gets.strip!

      single_space

      if answer == 'yes' || answer == 'y' || answer == 'no' || answer == 'n'
        answered = true
      else
        lines_pretty_print Rainbow('Please input either \'yes\' or \'no\'.').yellow
      end
    end

    return if answer == 'no' || answer == 'n'

    lines_pretty_print 'One moment, please.'

    single_space

    all_gems = Dir.glob("#{@app_directory.chomp("/#{gem_name}-#{VERSION}")}/wielder_of_anor*")

    # glob orders things in the array alphabetically, so the second-to-last one in the array is the
    # most recent version that is not the current version.
    previous_config_file = "#{all_gems[-2]}/lib/config.yaml"
    config = YAML.load_file(previous_config_file)
    new_config_file = File.open("#{@app_directory}/lib/config.yaml", 'w')

    YAML.dump(config, new_config_file)
    new_config_file.close

    lines_pretty_print 'Done! Please run me again when you\'re ready.'

    abort
  end

  def second_argument_missing?(arguments)
    arguments[1].nil? || arguments[1] == ''
  end

  def delete_arguments(arguments, number_to_delete)
    (1..number_to_delete).each do
      # Deleting the first one each time because the array shifts left when one is deleted.
      arguments.delete_at(0)
    end
  end

  def bash(directory, command)
    # Dir.chdir ensures all bash commands are being run from the correct
    # directory.
    Dir.chdir(directory) { system "#{command}" }
  end

  def set_app_directory
    @app_directory = File.expand_path(File.dirname(__FILE__)).chomp('/lib')
  end

  def lines_pretty_print(string)
    lines = string.scan(/\S.{0,70}\S(?=\s|$)|\S+/)

    lines.each { |line| puts line }
  end

  def single_space
    puts ''
  end

  def double_space
    puts "\n\n"
  end

  def surround_by_double_space(string)
    double_space
    lines_pretty_print(string)
    double_space
  end
end