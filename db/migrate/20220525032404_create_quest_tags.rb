class CreateQuestTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name
    end

    create_table :quest_tags do |t|
      t.references :question, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
    end
  end
end
