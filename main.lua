
-- Funcao responsavel por carregar td quando iniciar um jogo
-- Por exemplo, configuraçao de tam d janela e etc aq
function love.load()
  button = {}
  button.x = 200
  button.y = 200
  button.size = 50

  score = 0
  timer = 10
  gameState = 1 -- Qnd é 1 está no menu, caso contrario, está em game

  myFont = love.graphics.newFont(40)
end

-- Funcao que será responsável por atualizar 60 vzs a cd segundo o jogo
function love.update(dt)

  if gameState == 2 then
    if timer > 0 then
      timer = timer - dt
    end

    if timer < 0 then
      timer = 0
      gameState = 1
      score = 0
    end
  end
end

-- Funcao responsável por img/desenhos do jogo
function love.draw()

  if gameState == 2 then
    love.graphics.setColor(0, 0, 1)
    love.graphics.circle("fill", button.x, button.y, button.size)
  end

  love.graphics.setFont(myFont)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("Score: " .. score)
  love.graphics.print("Time: " .. math.ceil(timer), 300, 0)

  if gameState == 1 then
    love.graphics.printf("Clique na tela para começar :D", 0, love.graphics.getHeight()/2, love.graphics.getWidth(), "center")
  end
end

function love.mousepressed(x, y, btn, isTouch)
   if btn == 1 and gameState == 2 then
        -- vamos testar se o click do mouse está dentro do circulo
        -- Isso significa que, se a distancia do ponto do mouse pro centro do circulo
        -- for menor que o raio do circle entao o mouse está dentro do circulo
        if dist(button.x, button.y, love.mouse.getX(), love.mouse.getY()) < button.size then
            score = score + 1
            button.x = math.random(button.size, love.graphics.getWidth() - button.size)
            button.y = math.random(button.size, love.graphics.getHeight() - button.size)
        end
   end

   if gameState == 1 then
     gameState = 2;
     timer = 10
   end
end

-- Funcao distancia entre pontos [pontos do circulo: x1, y1 pontos do mouse : x2, y2]
function dist(x1, y1, x2, y2)
  return math.sqrt(((y2 - y1) * (y2 - y1)) + ((x2 - x1) * (x2 - x1)))
end
