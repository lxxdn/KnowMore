class CreateQuestionnaire <  ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires do |t|
      t.integer :progress, default: 0
      t.string :attribute1
      t.string :attribute2
      t.string :attribute3

      t.timestamps
    end
  end
end
