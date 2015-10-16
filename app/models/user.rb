class User < ActiveRecord::Base
  has_many :sent_messages, :class_name => 'Message', :foreign_key => 'messager_id'
  has_many :received_messages, :class_name => 'Message', :foreign_key => 'messagee_id'
end
