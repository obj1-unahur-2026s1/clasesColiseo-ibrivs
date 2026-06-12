class ArmaFilo {
  const longitud
  const filo
  method ataque() = filo * longitud
}
class ArmaContundente {
  const peso 
  method ataque() = peso
}

object casco {
  method defensa(luchador) = 10
}
object escudo {
  method defensa(luchador) = 5 + luchador.destreza() * 0.1
}
class Gladiador {
  var vida = 100
  method atacar(unGladiador) {
    const daño = self.poderAtaque() - unGladiador.defensa()
    unGladiador.perderVida(daño)
  }
  method perderVida(cant){
    vida -= cant
  }
  method defensa()
  method destreza()
  method poderAtaque()
  method pelearCon(unGladiador){
    self.atacar(unGladiador)
    unGladiador.atacar(self)
  }
}
class Mirmillon inherits Gladiador {
  var property arma 
  var property armadura 
  var fuerza
  override method destreza() = 15
  override method defensa() = armadura.defensa(self) + self.destreza()
  method cambiarFuerza(cant) { fuerza = cant }
  override method poderAtaque() = fuerza + arma.ataque()
}
class Dimachaerus inherits Gladiador{
  const armas = []
  var destreza 
  method fuerza() = 10
  override method defensa() = destreza / 2
  override method poderAtaque()= self.fuerza() + armas.sum({a => a.ataque()})
  override method atacar(unGladiador) {
    super(unGladiador)
    destreza += 1
  }
}