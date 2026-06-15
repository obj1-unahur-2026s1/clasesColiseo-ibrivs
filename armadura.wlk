object casco {
  method defensa(luchador) = 10
}
object escudo {
  method defensa(luchador) = 5 + luchador.destreza() * 0.1
}
