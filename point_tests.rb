require_relative './point'

require "minitest/autorun"

class PointTests < Minitest::Test


  def test_that_original_problem_is_solved_correctly
    points  =  [Point.new(0, 1), Point.new(3, 5), Point.new(6, 7), Point.new(5, 6),Point.new(3, 7) ]
    assert_equal([Point.new(0, 1), Point.new(3, 7)], merge_overlapping_pts(points))
  end

  def test_that_ending_without_merge_works
    points  =  [Point.new(0, 2), Point.new(2, 3), Point.new(4, 5)]
    assert_equal([Point.new(0, 3), Point.new(4, 5)], merge_overlapping_pts(points))
  end

  def test_that_full_merge_works
    points  =  [Point.new(1, 2), Point.new(3, 4), Point.new(1, 4)]
    assert_equal([Point.new(1, 4)], merge_overlapping_pts(points))
  end

  def test_that_empty_array_works
    points  =  []
    assert_equal([], merge_overlapping_pts(points))
  end

  def test_that_element_array_works
    points  =  [Point.new(1,5)]
    assert_equal([Point.new(1,5)], merge_overlapping_pts(points))
  end

  def test_that_zero_merge_works
    points  =  [Point.new(0,1),Point.new(2,3),Point.new(4,5)].reverse
    assert_equal(points.sort, merge_overlapping_pts(points))
  end
end


=begin
while j < points.size
  point = points[j]
  i = 0
  new_end = point.end_pt
  puts "new_end starting as #{point.end_pt}"
  pt_created = false
  puts "Processing point: #{point.inspect}"
  while i < points.size
    pt_next = points[i]
    if pt_next.start_pt <= point.end_pt
      #merge
      new_end = [new_end, pt_next.end_pt].max
      puts "new_end is #{new_end}"
    else
      new_points << Point.new(point.start_pt, new_end)
      pt_created = true
      break
    end
    i += 1
  end
  puts "new points is: ============ #{new_points.inspect}"
  if pt_created == false
    new_points << Point.new(point.start_pt, new_end)
  end
  j += 1
end
=end
#p points
#p new_points







