require 'test_helper'

class KhnueServiceTest < ActiveSupport::TestCase

  def test_week_calculations
    assert_same(KhnueService.calculate_week('01-09-2021'.to_date), 1)
    assert_same(KhnueService.calculate_week('08-09-2021'.to_date), 2)
    assert_same(KhnueService.calculate_week('04-10-2021'.to_date), 6)
  end
end
