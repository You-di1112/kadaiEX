require 'dxruby'

require_relative 'player'
require_relative 'target'

font = Font.new(32)
player_img = Image.load("image/player.jpg")
target_img = Image.load("image/target.png")

player = Player.new(10, 10, player_img)
timer = 0 # 追加
targets = []
targets << Target.new(rand(0..(640 - 32 - 1)), rand((480 - 32 - 1)), target_img)
Window.loop do
  if player.score != 10
    timer += 1 # 追加
    player.update
  end

  player.draw

  Sprite.draw(targets)
  time = timer / 60.0
  Window.draw_font(10, 0, "タイム：#{time.round(3)}秒", font) # 追加

  if Input.mouse_push?(M_LBUTTON) && Sprite.check(player, targets)
    targets << Target.new(rand(0..(640 - 32 - 1)), rand((480 - 32 - 1)), target_img)
  end
end