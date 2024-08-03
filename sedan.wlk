import example.*
import wollok.game.*
import monedas.*

object sedan {
	var property score = 0
	var property position = game.at(5,3)
	var property monedas = 0

	method image() = "sedan1.png"

	method moverseDerecha() {
		position = position.right(1)
		if (!pantalla.estaEnElTablero(position)){
			position = position.left(1)
		}
			
			}

	method moverseIzquierda() {
		position = position.left(1)
		if (!pantalla.estaEnElTablero(position)){
			position = position.right(1)
	}	
	}
	method sumaMonedas() = { monedas += 1}
	
	method sumarScore(){ // hacer metodo para monedas y cambiar codigo
		score += 1
		if (self.score() == 15 and pantalla.monedas() >= 3){
			game.removeTickEvent("aparece Auto")
			game.removeTickEvent("aparece moneda")
			game.removeVisual(self)
			keyboard.v().onPressDo{game.stop()}
			game.addVisual(ganar)
		}
		else{
			if(self.score() == 15 and pantalla.monedas()< 3){
			game.removeTickEvent("aparece Auto")
			game.removeTickEvent("aparece moneda")
			game.removeVisual(self)
			game.addVisual(gameover)
			game.onTick(1000,"cerrar",{game.stop()})
			}
		}
	}
	
}
object choquesedan2 {
	var property monedas = 0

	method position() = sedan.position().up(3)
	method sumaMonedas() {monedas += 1}
}

object choquesedan3 {
	var property monedas = 0

	method position() = sedan.position().left(1).up(1)
	method sumaMonedas() {monedas += 1}
}

object choquesedan4 {
	var property monedas = 0
	
	method position() = sedan.position().right(1).up(1)
	method sumaMonedas() {monedas += 1}
}

object choquesedan5 {
	var property monedas = 0
	
	method position() = sedan.position().right(1).down(1)
	method sumaMonedas() {monedas += 1}
}

object choquesedan6 {
	var property monedas = 0

	method position() = sedan.position().left(1).down(1)
	method sumaMonedas() {monedas += 1}
}