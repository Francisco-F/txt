import wollok.game.*
import example.*
import nave.*


class Moneda {
	
	var property evento = "aparece Moneda"
	var property position = null
	var property image = "coin.png"
	
	method desaparece(){
		game.removeTickEvent(evento)
		game.removeVisual(self)
	}
	
	
	method cuantasMonedas(){
		game.say(choquenave2, "Tengo " + pantalla.monedas().toString() + " monedas!")
	}

	method aparecer(){
		position = [game.at(4,14),game.at(7,17),game.at(8,17),game.at(11,17)].anyOne()
		game.addVisual(self)
		game.onTick(100,evento,{self.avanzar()})
		game.onCollideDo(self,{algo => algo.sumaMonedas()})
		game.onCollideDo(choquenave2,{algo => self.cuantasMonedas()})
		game.onCollideDo(choquenave3,{algo => self.cuantasMonedas()})
		game.onCollideDo(choquenave4,{algo => self.cuantasMonedas()})
		
		
		
		
		
}
	method avanzar(){
		position = self.position().down(1)
		if (!pantalla.estaEnElTablero(position)){self.desaparece()
		}
		}

}
	