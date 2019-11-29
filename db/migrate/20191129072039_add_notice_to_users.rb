class AddNoticeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :notice, :integer
  end
end
