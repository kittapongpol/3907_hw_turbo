class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :status, default: 'incomplete'
      t.references :category, foreign_key: true  

      t.timestamps
    end
  end
end

class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
