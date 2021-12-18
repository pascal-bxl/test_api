class CreatePersonnes < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :personnes, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.string :prenom
      t.string :nom

      t.timestamps
    end
  end
end
