class CreateUsersUrlsTables < ActiveRecord::Migration
  def change
    create_table :urls do |url|
      url.string :full_url,:short_url
      url.integer :user_id
    end

    create_table :users do |user|
      user.string :email, :encrypted_password
    end
  end
end
