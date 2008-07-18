class CreateQisQuestions < ActiveRecord::Migration
  def self.up
    create_table :qis_questions do |t|
      t.string :prompt

      t.timestamps
    end
  end

  def self.down
    drop_table :qis_questions
  end
end
