import wollok.game.*
import sedan.*
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
		game.title("Fast and furious: Panamericana Edition")
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
		image= sedan.score().toString() + '.png'
	)	
	
	method monedas() = (sedan.monedas() + choquesedan2.monedas() + choquesedan3.monedas() + choquesedan4.monedas() + choquesedan5.monedas() + choquesedan6.monedas())
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
		game.addVisualCharacter(sedan)
		game.addVisualCharacter(choquesedan2)
		game.addVisualCharacter(choquesedan3)
		game.addVisualCharacter(choquesedan4)
		game.addVisualCharacter(choquesedan5)
		game.addVisualCharacter(choquesedan6)
		game.addVisual(scoreInGame)
		game.addVisual(scoreNumber)			
	}
	method programarTeclas() {
		keyboard.d().onPressDo{sedan.moverseDerecha()}
		keyboard.a().onPressDo{sedan.moverseIzquierda()}
		}
		
	method spawnAutos() {
		game.onTick(3000,"aparece Auto", {new Autos().aparece()})
	}
		
	method spawnMonedas(){
		game.onTick(5000,"aparece moneda",{new Moneda().aparecer()})
	}
	
	
	method definirColisiones3(){
		game.onCollideDo(sedan,{algo => algo.desaparece()})
	}
	
	method definirColisiones4(){
		game.onCollideDo(choquesedan2,{algo => algo.desaparece()})
	}
	method definirColisiones5(){
		game.onCollideDo(choquesedan3,{algo => algo.desaparece()})
	}
	
	method definirColisiones6(){
		game.onCollideDo(choquesedan4,{algo => algo.desaparece()})
	}
	
	method definirColisiones7(){
		game.onCollideDo(choquesedan5,{algo => algo.desaparece()})
	}
	
	method definirColisiones8(){
		game.onCollideDo(choquesedan6,{algo => algo.desaparece()})
	}
	method sumarpuntos(){
		game.onTick(2300,"suma puntos",{sedan.sumarScore()})
	}
		
	method mostrarscore(){
			game.onTick(2300, 'add score', {scoreNumber.changeScoreImage(sedan.score())})
		}
		
	method estaEnElTablero(ubicacion) = ubicacion.x().between(2, game.width()-4) && ubicacion.y().between(-2, game.height())		
}