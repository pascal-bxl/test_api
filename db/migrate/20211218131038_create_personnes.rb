class CreatePersonnes < ActiveRecord::Migration[5.2]
  def change
    create_table :personnes do |t|
      t.string :prenom
      t.string :nom

      t.timestamps
    end
  end
end
