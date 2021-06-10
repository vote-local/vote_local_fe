class CreateTwitterReps < ActiveRecord::Migration[5.2]
  def change
    create_table :twitter_reps do |t|
      t.string :name
      t.string :api_id
      t.string :twitter
      t.string :zip_code
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
