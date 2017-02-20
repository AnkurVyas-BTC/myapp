class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :header
      t.string :navbar
      t.string :footer

      t.timestamps
    end
  end
end
