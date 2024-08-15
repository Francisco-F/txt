import wollok.game.*
import nave.*
import monedas.*
import Npcs.*
import Score.*

object gameover {
	method image() = "gameover.png"
	method position() = game.at(-1,1)
}

object ganar{
	method position() = game.at(0,-1)
	method image() = "ganar.jpg"
	
}

object juego{
	method empezar(){
		game.height(18)
		game.width(15)
		game.boardGround("ruta.png")
		game.addVisual(menu)
		game.title("Space Race")
		game.start()
		menu.iniciarjuego()	
	}
}

object menu {
	method image() = "menu.jpg"
	method position() = game.at(0.5,-2)
	method iniciarjuego(){
		keyboard.c().onPressDo{
			game.removeVisual(self)
			pantalla.iniciar()		
		}}
}
	
object pantalla {
	
	const scoreInGame = new Score(
		position = game.at(0,17),
		image='score.png'
	)
	const scoreNumber = new Score(
		position = game.at(0, 17),
		image= nave.score().toString() + '.png'
	)	
	
	method monedas() = (nave.monedas() + choquenave2.monedas() + choquenave3.monedas() + choquenave4.monedas() + choquenave5.monedas() + choquenave6.monedas())
	method position() = game.at(-1.5,1)
	method image() = "ruta.png"
	
	method iniciar() {
		self.agregarVisuales()
		self.programarTeclas()
		self.spawnAutos()
		self.definirColisiones3()
		self.definirColisiones4()
		self.definirColisiones5()
		self.definirColisiones6()
		self.definirColisiones7()
		self.definirColisiones8()
		self.spawnMonedas()
		self.sumarpuntos()
		self.mostrarscore()
		}
		
	method agregarVisuales() {
		game.addVisualCharacter(nave)
		game.addVisualCharacter(choquenave2)
		game.addVisualCharacter(choquenave3)
		game.addVisualCharacter(choquenave4)
		game.addVisualCharacter(choquenave5)
		game.addVisualCharacter(choquenave6)
		game.addVisual(scoreInGame)
		game.addVisual(scoreNumber)			
	}
	method programarTeclas() {
		keyboard.d().onPressDo{nave.moverseDerecha()}
		keyboard.a().onPressDo{nave.moverseIzquierda()}
		}
		
	method spawnAutos() {
		game.onTick(3000,"aparece Nave", {new Naves().aparece()})
	}
		
	method spawnMonedas(){
		game.onTick(5000,"aparece moneda",{new Moneda().aparecer()})
	}
	
	
	method definirColisiones3(){
		game.onCollideDo(nave,{algo => algo.desaparece()})
	}
	
	method definirColisiones4(){
		game.onCollideDo(choquenave2,{algo => algo.desaparece()})
	}
	method definirColisiones5(){
		game.onCollideDo(choquenave3,{algo => algo.desaparece()})
	}
	
	method definirColisiones6(){
		game.onCollideDo(choquenave4,{algo => algo.desaparece()})
	}
	
	method definirColisiones7(){
		game.onCollideDo(choquenave5,{algo => algo.desaparece()})
	}
	
	method definirColisiones8(){
		game.onCollideDo(choquenave6,{algo => algo.desaparece()})
	}
	method sumarpuntos(){
		game.onTick(2300,"suma puntos",{nave.sumarScore()})
	}
		
	method mostrarscore(){
			game.onTick(2300, 'add score', {scoreNumber.changeScoreImage(nave.score())})
		}
		
	method estaEnElTablero(ubicacion) = ubicacion.x().between(2, game.width()-4) && ubicacion.y().between(-2, game.height())		
}


