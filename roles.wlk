import criaturas.*
import mascotas.*

object guardian {
    method extra() = 100
    method esExtraordinario(unaCriatura) = unaCriatura.poderMagico() > 50
    method siguienteRol(){
        return new Domador(mascotas = [new MascotaMitologica(edad=1, tieneCuernos=false)])
    }
}

object hechicero {
    method extra() = 0
    method esExtraordinario(unaCriatura) = true
    method siguienteRol() = guardian
}

class Domador {
    const mascotas = []
    method extra() = 150 * mascotas.count({m=> m.tieneCuernos()})
    method agregarMascota(unaMascota) {mascotas.add(unaMascota)}
    //Se pone Domador como clase porque sino en agregarMascota siempre se va a agregar lo mismo para todos.
    //Ej: 
    //const dom1 = new Duende(poderMagico=10,astucia=5,rol= new Domador(mascotas =[new MascotaMitologica(edad=20,tieneCuernos=true)]))
    method esExtraordinario(unaCriatura) = unaCriatura.poderMagico() >= 15 and self.todasMascotasVeteranas()
    method todasMascotasVeteranas() = mascotas.all({m=> m.esVeterana()})
    method siguienteRol(){
        if(!self.alMenosUnaConCuernos()) self.error("No se puede cambiar de rol!!!")
        return hechicero
    }
    method alMenosUnaConCuernos() = mascotas.any({m=> m.tieneCuernos()})
}   