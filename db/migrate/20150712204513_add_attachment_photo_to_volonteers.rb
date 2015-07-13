class AddAttachmentPhotoToVolonteers < ActiveRecord::Migration
  def self.up
    change_table :volonteers do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :volonteers, :photo
  end
end
