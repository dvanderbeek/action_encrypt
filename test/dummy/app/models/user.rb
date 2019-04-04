class User < ApplicationRecord
  has_encrypted :ssn
end
