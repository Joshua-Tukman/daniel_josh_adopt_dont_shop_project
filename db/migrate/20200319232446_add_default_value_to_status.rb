class AddDefaultValueToStatus < ActiveRecord::Migration[5.1]
  def up
    change_column :pets, :status, :boolean, default:true
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
