require 'rubygems'
require 'fileutils'
require 'rmagick'

# banner generation
canvas = Magick::ImageList.new
canvas.new_image(1024, 500, Magick::GradientFill.new(0,0,0,0, "red", "black"))

puts("Enter source of your app logo:\nE.g. /home/ashwin/logos/mylogo.png")
logoSrc = gets.chomp()
src = Magick::ImageList.new( logoSrc )
src = src.minify
banner = canvas.composite(src, Magick::CenterGravity, 0, -50, Magick::OverCompositeOp)

# add text
Text = "Your App Name\nE.g. My New App"
text = Magick::Draw.new
text.font_family = 'helvetica'
text.pointsize = 52
text.gravity = Magick::CenterGravity
text.annotate(banner, 0,0,0,150, Text) {
  self.fill = "white"
}

# final output banner
puts("Enter destination directory\nE.g. /home/ashwin/banners/")
dest = gets.chomp()

banner.write(dest+'banner.png')