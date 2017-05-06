class AddCopyrightToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :copyright, :string
  end
end
