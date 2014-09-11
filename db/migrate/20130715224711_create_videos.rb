class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
		t.string :name
		t.string :attachment
		t.text   :meta_info
	  
		t.timestamps
    end
  end
end
