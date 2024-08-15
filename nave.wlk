import example.*
import wollok.game.*
import monedas.*

object nave {
	var property score = 0
	var property position = game.at(5,3)
	var property monedas = 0

	method image() = "nave1.png"

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
	
	method sumarScore(){ 
		score += 1
		if (self.score() == 15 and pantalla.monedas() >= 3){
			game.removeTickEvent("aparece Nave")
			game.removeTickEvent("aparece moneda")
			game.removeVisual(self)
			keyboard.v().onPressDo{game.stop()}
			game.addVisual(ganar)
		}
		else{
			if(self.score() == 15 and pantalla.monedas()< 3){
			game.removeTickEvent("aparece Nave")
			game.removeTickEvent("aparece moneda")
			game.removeVisual(self)
			game.addVisual(gameover)
			game.onTick(1000,"cerrar",{game.stop()})
			}
		}
	}
	
}
object choquenave2 {
	var property monedas = 0

	method position() = nave.position().up(3)
	method sumaMonedas() {monedas += 1}
}

object choquenave3 {
	var property monedas = 0

	method position() = nave.position().left(1).up(1)
	method sumaMonedas() {monedas += 1}
}

object choquenave4 {
	var property monedas = 0
	
	method position() = nave.position().right(1).up(1)
	method sumaMonedas() {monedas += 1}
}

object choquenave5 {
	var property monedas = 0
	
	method position() = nave.position().right(1).down(1)
	method sumaMonedas() {monedas += 1}
}

object choquenave6 {
	var property monedas = 0

	method position() = nave.position().left(1).down(1)
	method sumaMonedas() {monedas += 1}
}