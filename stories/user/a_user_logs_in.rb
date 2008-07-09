require File.join(File.dirname(__FILE__), "../helper")
require File.join(File.dirname(__FILE__), "../steps/misc_steps")

with_steps_for :misc do
   run File.expand_path(__FILE__).gsub(".rb",".txt"), :type => RailsStory
end