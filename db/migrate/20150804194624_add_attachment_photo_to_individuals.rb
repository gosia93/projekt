class AddAttachmentPhotoToIndividuals < ActiveRecord::Migration
  def self.up
    change_table :individuals do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :individuals, :photo
  end
end
