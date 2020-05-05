class AddInfoToContact < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :email, :string
    add_column :contacts, :message, :text
    add_column :contacts, :name, :string
    add_column :contacts, :tel, :string
  end
end
