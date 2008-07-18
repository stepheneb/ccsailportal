require 'question_item_service_helper'

class QisAnswer < ActiveRecord::Base
  belongs_to :question, :class_name => "QisQuestion"
  has_one :item_reference, :as => :item, :dependent => :destroy
  has_one :parent_offering, :through => :item_reference, :source => :parent_offering
  include QisItem
  
end
