class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login_id
      t.string :password
      t.boolean :terms_of_service_accepted, :default => true
      t.boolean :password_change_required, :default => true
      t.timestamps
    end
  end
end
