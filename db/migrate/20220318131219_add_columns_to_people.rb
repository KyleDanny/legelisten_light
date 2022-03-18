class AddColumnsToPeople < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :legal_name, :string
    add_column :people, :birth_date, :string
  end
end
