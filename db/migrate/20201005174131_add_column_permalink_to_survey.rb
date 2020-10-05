class AddColumnPermalinkToSurvey < ActiveRecord::Migration[6.0]
  def change
    add_column :surveys, :permalink, :string
  end
end
