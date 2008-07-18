class CreateQisAnswers < ActiveRecord::Migration
  def self.up
    create_table :qis_answers do |t|
      t.integer :question_id
      t.string :answer

      t.timestamps
    end
  end

  def self.down
    drop_table :qis_answers
  end
end
