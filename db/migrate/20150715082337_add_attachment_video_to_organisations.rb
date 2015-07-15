class AddAttachmentVideoToOrganisations < ActiveRecord::Migration
  def self.up
    change_table :organisations do |t|
      t.attachment :video
    end
  end

  def self.down
    remove_attachment :organisations, :video
  end
end
