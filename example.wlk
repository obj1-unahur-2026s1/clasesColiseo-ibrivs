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
class Grupo {
  const nombre
  const miembros = #{}
  var cantPeleas = 0
  method agregar(gladiador){
    miembros.add(gladiador)
  }
  method quitar(gladiador) {
    miembros.remove(gladiador)
  }
  method puedenCombatir() = miembros.filter({g => g.vida() > 0})
  method campeon() = self.puedenCombatir().mac({g => g.poderAtaque()})
  method combatirCon(grupo){
    self.campeon().pelearCon(grupo.campeon())
    self.campeon().pelearCon(grupo.campeon())
    self.campeon().pelearCon(grupo.campeon())
    cantPeleas += 1
  }
}

object coliseo {
  method combatirGrupos(grupo1, grupo2){
    grupo1.combatirCon(grupo2)
  }
  method combatirConCampeon(grupo, campeon) {
    grupo.miembros().forEach({g=> g.pelearCon(campeon)})
  }
  method curarGrupo(grupo){
    grupo.miembros().forEach({g=> g.curar()})
  }
  method curarGladiador(gladiador) {
    gladiador.curar()
  }
}
