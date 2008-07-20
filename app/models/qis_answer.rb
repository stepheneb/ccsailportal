class QisAnswer < ActiveRecord::Base
  include Item
  include QisArItem

  belongs_to :question, :class_name => "QisQuestion"
  
end
