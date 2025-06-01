import camion.*
object knightRider {
    method peso() = 500

    method nivelDePeligro() = 10

    method cantidadDeBultos() = 1

    method sufrirCarga() {}
}

object bumblebee {
    var estado = estadoAuto

    method transformar() {
        estado = estado.siguienteEstado()
    }

    method peso() = 800

    method nivelDePeligro() = estado.nivelDePeligro()

    method cantidadDeBultos() = 2

    method sufrirCarga() {
        estado = estadoRobot
    }
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
//---


object paqueteDeLadrillos {
    var cantidadDeLadrillos = 0

    method cantidadDeLadrillos(nuevaCantidad) {
        cantidadDeLadrillos = 0.max(nuevaCantidad)
    }

    method peso() = cantidadDeLadrillos * 2

    method nivelDePeligro() = 2

    method cantidadDeBultos() {
        if(cantidadDeLadrillos.between(0, 100)) {
            return 1
        }
        else if(cantidadDeLadrillos.between(101, 300)) {
            return 2
        }
        else {
            return 3
        }
    }

    method sufrirCarga() {
        cantidadDeLadrillos += 12
    }
}

object arenaAGranel {
    var peso = 0

    method peso() = peso

    method peso(nuevoPeso) {
        peso = 0.max(nuevoPeso)
    }

    method nivelDePeligro() = 1

    method cantidadDeBultos() = 1

    method sufrirCarga() {
        self.peso(peso - 10)
    }
}

object bateriaAntiaerea {
    var misilActual = misil

    method cambiarMisil() {
        misilActual = misilActual.siguienteMisil()
    }

    method peso() = misilActual.peso()

    method nivelDePeligro() = misilActual.nivelDePeligro()

    method cantidadDeBultos() = misilActual.cantidadDeBultos()

    method sufrirCarga() {
        misilActual = misil
    }
}
//Misiles
    object misil {
        method peso() = 300

        method siguienteMisil() = misilDescargado

        method nivelDePeligro() = 100

        method cantidadDeBultos() = 2
    }

    object misilDescargado {
        method peso() = 200 

        method siguienteMisil() = misil

        method nivelDePeligro() = 0

        method cantidadDeBultos() = 1
    }
//---

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

    method cantidadDeBultos() = 1 + cosasQueContiene.sum({cosa => cosa.cantidadDeBultos()}) 

    method sufrirCarga() {
        cosasQueContiene.forEach({cosa => cosa.sufrirCarga()})
    }
}

object residuosRadioactivos {
    var peso = 0

    method peso() = peso

    method peso(nuevoPeso) {
        peso = 0.max(nuevoPeso)
    }

    method nivelDePeligro() = 200

    method cantidadDeBultos() = 1

    method sufrirCarga() {
        peso += 15
    }
}

object embalajeDeSeguridad {
    var cosaQueEnvuelve = null

    method envolverCosa(unaCosa) {
        if(unaCosa != self)
            cosaQueEnvuelve = unaCosa
    }

    method peso() = cosaQueEnvuelve.peso()

    method nivelDePeligro() = cosaQueEnvuelve.nivelDePeligro() / 2

    method cantidadDeBultos() = 2

    method sufrirCarga() {}
}