import grupo.*
class Gladiador {
  var vida = 100
  method vida() = vida
  method atacar(unGladiador) {
    const daño = self.poderAtaque() - unGladiador.defensa()
    unGladiador.perderVida(daño)
  }
  method perderVida(cant){
    vida -= cant
  }
  method pelearCon(unGladiador){
    self.atacar(unGladiador)
    unGladiador.atacar(self)
  }
  method curar() {
    vida = 100
  }
  method defensa()
  method destreza()
  method poderAtaque()
  method crearGrupoCon(gladiador)
}

class Mirmillon inherits Gladiador {
  var property arma 
  var property armadura 
  var fuerza
  override method destreza() = 15
  override method defensa() = armadura.defensa(self) + self.destreza()
  method cambiarFuerza(cant) { fuerza = cant }
  override method poderAtaque() = fuerza + arma.ataque()
  override method crearGrupoCon(gladiador) = new Grupo(nombre="Mirmillolandia", miembros = #{self, gladiador})
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
  override method crearGrupoCon(gladiador) = new Grupo(nombre = "D-" + (self.poderAtaque() + gladiador.poderAtaque()), miembros = #{self, gladiador})
}
