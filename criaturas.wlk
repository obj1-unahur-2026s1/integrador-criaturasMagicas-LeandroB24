import roles.*
import mascotas.*
import coloniasYAreas.*

class Criatura {
  var poderMagico
  const astucia
  var rol
  method poderMagico() = poderMagico
  method poderOfensivo() = poderMagico * 10 + rol.extra()
  method esFormidable() = self.esAstuta() || self.esExtraordinaria()
  method esAstuta()
  method esExtraordinaria() = rol.esExtraordinario(self)
  method cambiarDeRol() {rol = rol.siguienteRol()}
  method perder15PorCiento() {poderMagico = poderMagico  * 0.85}
}

class Duende inherits Criatura{
  override method poderOfensivo() = super() * 1.1
  override method esAstuta() = false
}

class Hada inherits Criatura {
  var kilometros = 2
  method aumentarKilometros(unValor) {kilometros = 25.min(kilometros + unValor)}
  override method esAstuta() = astucia > 50
  override method esExtraordinaria() = super() and kilometros > 10
}