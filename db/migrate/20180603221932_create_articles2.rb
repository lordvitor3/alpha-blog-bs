class CreateArticles2 < ActiveRecord::Migration[5.2]
  def change
    create_table :articles2 do |t|
          t.string :title
          t.text :description 

    end
  end
end
