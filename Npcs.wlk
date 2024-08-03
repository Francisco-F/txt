import wollok.game.*
import example.*



class Autos {
	
	var property evento = "Aparece auto"
	var property position = null
	var property image = null
	var property monedas = 0

	
	method sumaMonedas() {}
	
	method aparece(){
		image = ["simple-travel-car-top_view.png","sedan.png"].anyOne()
		const x = (3 .. game.width() - 4).anyOne()
		const y = game.height() - 2
		position = game.at(x,y)
		game.addVisual(self)
		game.onTick(50,evento,{self.avanza()})		
	}
	
	
	method desaparece(){
		if (game.hasVisual(self)){
			game.removeTickEvent("aparece Auto")
			//game.removeTickEvent("aparece Auto1")
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
	