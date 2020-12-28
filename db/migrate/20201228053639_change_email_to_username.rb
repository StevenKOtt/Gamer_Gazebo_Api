class ChangeEmailToUsername < ActiveRecord::Migration[6.1]
  def change

    rename_column :basic_user_infos, :email, :username unless BasicUserInfo.column_names.include?('username')
  end
end
