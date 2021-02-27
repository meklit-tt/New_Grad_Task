class AddAttachmentRestImgToRestaurants < ActiveRecord::Migration[5.2]
  def self.up
    change_table :restaurants do |t|
      t.attachment :rest_img
    end
  end

  def self.down
    remove_attachment :restaurants, :rest_img
  end
end
