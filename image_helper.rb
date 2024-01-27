# frozen_string_literal: true

require 'chunky_png'

# The method image_diff shows the percentage difference in pixels between two pictures. Use method ImageHelper.image_diff
# The type of arguments is string ('./data/image/1.png')
# Make sure chunky_png gem is installed: https://rubygems.org/gems/chunky_png/versions/1.3.5

# https://habr.com/ru/articles/117789/
module ImageHelper
  extend ChunkyPNG::Color
  MAX = 0xff

  def self.image_diff(path1, path2)
    images = [
      ChunkyPNG::Image.from_file(path1),
      ChunkyPNG::Image.from_file(path2)
    ]
    output = ChunkyPNG::Image.new(images.first.width, images.first.height, ChunkyPNG::Color::WHITE)

    diff = []

    images.first.height.times do |y|
      images.first.row(y).each_with_index do |pixel, x|
        next if pixel == images.last[x, y]

        score = calculate_score(images.last[x, y], pixel)

        output[x, y] = grayscale(MAX - (score * MAX).round)
        diff << score
      end
    end

    (diff.inject(0.0) { |sum, value| sum + value } / images.first.pixels.length) * 100
  end

  def self.calculate_score(pixel1, pixel2)
    Math.sqrt(
      (r(pixel2) - r(pixel1))**2 +
      (g(pixel2) - g(pixel1))**2 +
      (b(pixel2) - b(pixel1))**2
    ) / Math.sqrt(MAX**2 * 3)
  end

  def self.grayscale(value)
    ChunkyPNG::Color.rgb(value, value, value)
  end
end
