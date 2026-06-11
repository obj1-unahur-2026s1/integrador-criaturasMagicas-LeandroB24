class Colonia {
    const criaturas = []
    method atacar(unArea){
        if(self.poderOfensivo() > unArea.poderDefensivo()){
            unArea.serUsurpadaPor(self)
        }else{
            criaturas.forEach({c=> c.perder15PorCiento()})
        }
    }
    method poderOfensivo() = criaturas.sum({c=> c.poderOfensivo()})
    method cantCriaturasFormidables() = criaturas.count({c=> c.esFormidable()})
}

class Area {
    var coloniaHabitando = new Colonia()
    method poderDefensivo()
    method serUsurpadaPor(unaColonia) {coloniaHabitando = unaColonia}
}

class Castillo inherits Area {
    override method poderDefensivo() = 200 * coloniaHabitando.cantCriaturasFormidables()
}

class Claro inherits Area {
    override method poderDefensivo() = 100 + coloniaHabitando.poderOfensivo()
}

//Esto se podria ampliar en un examen, ej:
//class ClaroDelNorte inherits Area
//class ClaroDelSur inherits Area