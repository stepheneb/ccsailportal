#!/usr/bin/env ruby
ENV["RAILS_ENV"] = "test"
this_dir = File.expand_path(File.dirname(__FILE__))
require this_dir + "/../config/environment"
require 'spec/rails/story_adapter'
require 'spec/story'
# require this_dir + "/helper"
require this_dir + "/steps/misc_steps"

# Make visible for testing
ApplicationController.send(:public, :logged_in?, :current_user, :authorized?)

with_steps_for :misc do
  story_files = Dir[File.join(this_dir, "user", '*.story')]
  story_files.each do |file|
    run file, :type => RailsStory 
  end
end
