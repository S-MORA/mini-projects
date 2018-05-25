class CreateTodosTable < ActiveRecord::Migration[5.2]
    def change
        create_table :todos do |t| #todos is name of table
          t.string :name #string column called name
          t.string :description #string column called description - automatically create id and increments
    end
end
