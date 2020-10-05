class CreatePollAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :poll_answers do |t|
      t.references :survey, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true
      t.inet :user_ip

      t.timestamps
    end
  end
end
