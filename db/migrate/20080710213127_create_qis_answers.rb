class CreateQisAnswers < ActiveRecord::Migration
  def self.up
    create_table :qis_answers do |t|
      t.integer :owners_version
      t.integer :offering_id
      # this is redundant because we have an offering we can find our question
      t.integer :question_id
      t.string :answer

      t.timestamps
    end
  end

  def self.down
    drop_table :qis_answers
  end
end
