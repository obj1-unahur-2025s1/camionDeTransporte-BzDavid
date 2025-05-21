import camion.*
object knightRider {
    method peso() = 500

    method nivelDePeligro() = 10
}

object bumblebee {
    var estado = estadoAuto

    method transformar() {
        estado = estado.siguienteEstado()
    }

    method peso() = 800

    method nivelDePeligro() = estado.nivelDePeligro()
}
//Estados de Bumblebee
object estadoRobot {
    method nivelDePeligro() = 30

    method siguienteEstado() = estadoAuto
}
object estadoAuto {
    method nivelDePeligro() = 15

    method siguienteEstado() = estadoRobot
}


object paqueteDeLadrillos {
    var cantidadDeLadrillos = 0

    method cantidadDeLadrillos(nuevaCantidad) {
        cantidadDeLadrillos = nuevaCantidad
    }

    method agregarLadrillo() {
        self.cantidadDeLadrillos(cantidadDeLadrillos + 1)
    }

    method quitarLadrillo() {
        self.cantidadDeLadrillos(cantidadDeLadrillos - 1)
    }

    method peso() = cantidadDeLadrillos * 2

    method nivelDePeligro() = 2
}

object arenaAGranel {
    var property peso = 0

    // method peso() = 00

    method nivelDePeligro() = 1
}

object bateriaAntiaerea {
    var misilActual = misil

    method cambiarMisil() {
        misilActual = misilActual.siguienteMisil()
    }

    method peso() = misilActual.peso()

    method nivelDePeligro() = misilActual.nivelDePeligro()
}
//Misiles
object misil {
    method peso() = 300

    method siguienteMisil() = misilDescargado

    method nivelDePeligro() = 100
}

object misilDescargado {
    method peso() = 200 

    method siguienteMisil() = misil

    method nivelDePeligro() = 0
}


object contenedorPortuario {
    const cosasQueContiene = [] 

    method cargarCosa(unaCosa) {
        cosasQueContiene.add(unaCosa)
    }

    method descargarCosa(unaCosa) {
        cosasQueContiene.remove(unaCosa)
    }

    method peso() = 100 + cosasQueContiene.sum({cosa => cosa.peso()})

    method nivelDePeligro() = if(cosasQueContiene.isEmpty()) 0 else cosasQueContiene.max({cosa => cosa.nivelDePeligro()})
}

object residuosRadioactivos {
    var property peso = 0 

    // method peso() = 00

    method nivelDePeligro() = 200
}

object embalajeDeSeguridad {
    var cosaQueEnvuelve = null

    method envolverCosa(unaCosa) {
        if(unaCosa != self)
            cosaQueEnvuelve = unaCosa
    }

    method peso() = cosaQueEnvuelve.peso()

    method nivelDePeligro() = cosaQueEnvuelve.nivelDePeligro() / 2
}