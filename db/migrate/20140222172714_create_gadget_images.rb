class CreateGadgetImages < ActiveRecord::Migration
  def change
    create_table :gadget_images do |t|
      t.string     :name,         :null => false
      t.belongs_to :gadget
      t.binary     :data,         :null => false
      t.string     :filename
      t.string     :mime_type

      t.timestamps
    end
  end
end
