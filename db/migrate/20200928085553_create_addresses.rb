class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postcode         ,null:false
      t.integer     :area_id          ,null:false
      t.string      :city             ,null:false
      t.string      :road             ,null:false
      t.string      :building
      t.string      :phone            ,null:false
      t.references  :purchase         ,foreign_key:true
      t.timestamps
    end
  end
end
