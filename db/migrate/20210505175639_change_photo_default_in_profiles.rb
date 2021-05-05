class ChangePhotoDefaultInProfiles < ActiveRecord::Migration[6.1]
  def change
    change_column_default :profiles, :photo, 'https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg'
  end
end
