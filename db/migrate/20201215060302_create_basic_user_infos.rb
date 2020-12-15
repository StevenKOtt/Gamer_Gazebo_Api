class CreateBasicUserInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :basic_user_infos do |t|
      t.date :birthdate
      t.string :pronoun
      t.string :email
      t.string :country
      t.string :about_me
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
