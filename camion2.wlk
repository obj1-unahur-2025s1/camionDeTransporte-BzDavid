import cosas.*
object camion {
    const property carga = []

    method cargarCosa(unaCosa) {
        carga.add(unaCosa)
    }

    method descargarCosa(unaCosa) {
        carga.remove(unaCosa)
    }

    method pesoDeLaCarga() = carga.sum({cosa => cosa.peso()})

    method pesoTotal() = 1000 + self.pesoDeLaCarga()

    method sonParesLosPesosDeLaCarga() = carga.all({cosa => cosa.peso().even()})

    method hayCosaConPesoDe_(pesoDeLaCosa) = carga.any({cosa => cosa.peso() == pesoDeLaCosa})

    method primerCosaConNivelDePeligro_(peligroDeLaCosa) = carga.findOrElse(
        {cosa => cosa.nivelDePeligro() == peligroDeLaCosa}, {null}
    )

    method listaDeCosasConNivelDePeligroMayorA_(nivelDePeligro) = carga.filter({cosa => cosa.nivelDePeligro() > nivelDePeligro})

    method listaDeCosasQueSuperanElNivelDePeligroDe_(unaCosa) = self.listaDeCosasConNivelDePeligroMayorA_(unaCosa.nivelDePeligro())

    method estaExcedidoDePeso() = self.pesoTotal() > 2500

    method cosaConMayorNivelDePeligro() = carga.max({cosa => cosa.nivelDePeligro()})

    method puedeCircularEnRutaConPeligro(nivelDePeligroPermitido) = not self.estaExcedidoDePeso() and self.cosaConMayorNivelDePeligro() <= nivelDePeligroPermitido

    //también podría haber sido carga.all({cosa => cosa.nivelDePeligrosidad() <= nivelDePeligroPermitido})

    method sobrepasaLaCapacidad() {

    }

    method nivelDePeligrosidad() = 1
}