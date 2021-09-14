class Player < Sprite
    attr_accessor :score # 追加
  
    def initialize(x, y, image) # 追加
      Input.setMousePos(320,240)
      @score = 0
      super
    end
  
    def update
      self.x = Input.mouse_x
      self.y = Input.mouse_y
    end
  
    def shot # 追加
      @score += 1
    end
  end