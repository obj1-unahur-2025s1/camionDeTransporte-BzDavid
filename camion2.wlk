import cosas.*
object camion {
    const property carga = []

    method cargarCosa(unaCosa) {
        carga.add(unaCosa)
        unaCosa.sufrirCarga()
    }

    method descargarCosa(unaCosa) {
        carga.remove(unaCosa)
    }

    method pesoDeLaCarga() = carga.sum(
        {cosa => cosa.peso()}
    )

    method pesoTotal() = 1000 + self.pesoDeLaCarga()

    method sonParesLosPesosDeLaCarga() = carga.all(
        {cosa => cosa.peso().even()}
    )

    method hayCosaConPesoDe_(pesoDeLaCosa) = carga.any(
        {cosa => cosa.peso() == pesoDeLaCosa}
    )

    method primerCosaConNivelDePeligro_(peligroDeLaCosa) = carga.findOrElse(
        {cosa => cosa.nivelDePeligro() == peligroDeLaCosa}, {null}
    )

    method listaDeCosasConNivelDePeligroMayorA_(nivelDePeligro) = carga.filter(
        {cosa => cosa.nivelDePeligro() > nivelDePeligro}
    )

    method listaDeCosasQueSuperanElNivelDePeligroDe_(unaCosa) = self.listaDeCosasConNivelDePeligroMayorA_(unaCosa.nivelDePeligro())

    method estaExcedidoDePeso() = self.pesoTotal() > 2500

    method cosaConMayorNivelDePeligro() = carga.max(
        {cosa => cosa.nivelDePeligro()}
    )

    method puedeCircularConPeligroDeRutaMaximoDe_(nivelDePeligroPermitido) = not self.estaExcedidoDePeso() and self.cosaConMayorNivelDePeligro().nivelDePeligro() <= nivelDePeligroPermitido

    //también podría haber sido carga.all({cosa => cosa.nivelDePeligrosidad() <= nivelDePeligroPermitido})

    method tieneCosaConPesoEntre_Y_(primerPeso, segundoPeso) = carga.any(
        {cosa => (cosa.peso()).between(primerPeso, segundoPeso)}
    )

    method cosaConMayorPeso() = carga.max(
        {cosa => cosa.peso()}
    )

    method totalDeBultos() = carga.sum({cosa => cosa.cantidadDeBultos()})
}