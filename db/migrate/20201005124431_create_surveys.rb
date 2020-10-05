class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.string :name
      t.date :date_init
      t.date :date_end

      t.timestamps
    end
  end
end
