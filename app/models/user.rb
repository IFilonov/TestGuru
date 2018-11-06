class User < ApplicationRecord
  def tests(level)
    Test.where({ level: level })
  end
end
