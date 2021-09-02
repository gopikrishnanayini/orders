class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
    	t.string :name
       	t.string :email
       	t.string :phone_number
       	t.string :order_number
       	t.string :address_line1
       	t.string :address_line2
       	t.string :pincode
       	t.string :state
       	t.string :city
       	t.string :place
       	t.decimal :total_cost

      	t.timestamps
    end
  end
end
