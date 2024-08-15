import wollok.game.*
import example.*



class Naves {
	
	var property evento = "Aparece Nave"
	var property position = null
	var property image = null
	var property monedas = 0

	
	method sumaMonedas() {}
	
	method aparece(){
		image = ["simple-travel-nave-top_view.png","nave.png"].anyOne()
		const x = (3 .. game.width() - 4).anyOne()
		const y = game.height() - 2
		position = game.at(x,y)
		game.addVisual(self)
		game.onTick(50,evento,{self.avanza()})		
	}
	
	
	method desaparece(){
		if (game.hasVisual(self)){
			game.removeTickEvent("aparece Nave")
			//game.removeTickEvent("aparece Nave1")
			game.removeTickEvent("aparece moneda")
			game.addVisual(gameover)
			game.onTick(1500,"se cierra",{game.stop()})
		}
	}
	
	method desaparecer(){
		if (game.hasVisual(self)){
			game.removeTickEvent(evento)
			game.removeVisual(self)
		}
		
		}
	
	method avanza(){
		position = self.position().down(0.5)
		if (!pantalla.estaEnElTablero(position)){self.desaparecer()
		}
		}
		
	}
	