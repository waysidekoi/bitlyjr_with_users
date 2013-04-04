class Url < ActiveRecord::Base
  URL_REGEX = /^(http|https):\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?$/
  
  belongs_to :user
  validates :shortened_url, :uniqueness => true
  validates :full_url, :format => { :with => URL_REGEX,
                                    :message => "needed (include http://)" }

end
