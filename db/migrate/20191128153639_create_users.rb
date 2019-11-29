class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.date :dob
      t.date :doj
      t.numeric :sal
      t.string :contact
      t.string :bloodtype
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode
      t.string :ename
      t.string :relation
      t.string :econtact
      t.string :pskill
      t.string :sskill1
      t.string :sskill2
      t.string :role
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
