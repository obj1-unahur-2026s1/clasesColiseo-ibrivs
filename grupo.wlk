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
