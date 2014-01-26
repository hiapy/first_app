class User < ActiveRecord::Base
	#before_save { self.email = email.downcase }
	#before_save { self.session_token ||= Digest: :SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s) }
	#has_secure_password
	#validates :name, presence: true, length: { maximum: 30}#必填欄位+長度最多30
	#validates :email, format: {with: /\A[^@]+@[^@]+\z/ }, uniqueness: {case_sensitive: false}#唯一性 
	has_many :posts
	has_secure_password
	validates :name, presence: true, length: { maximum: 30 }
	validates :email, format: { with: /\A[^@]+@[^@]+\z/ }, uniqueness: true
	before_save { self.email = email.downcase }
    before_save { self.session_token ||= Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s) }
end
