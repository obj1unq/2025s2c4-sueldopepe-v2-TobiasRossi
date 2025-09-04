//PERSONAS

object pepe {
	var property categoria = cadete 
    var property tipoBonoResultados = porcentaje 
    var property tipoBonoPresentismo = normal
    var property faltas = 1

    method sueldo() = self.sueldoNeto() + self.bonoResultados(self) + self.bonoPresentismo(self)

    method sueldoNeto() = categoria.neto()
    method bonoResultados(empleado) = tipoBonoResultados.resultado(empleado)
    method bonoPresentismo(empleado) = tipoBonoPresentismo.presentismo(empleado)
}

object sofia {
	var property categoria = cadete 
    var property tipoBonoResultados = porcentaje
    var property superioridadNeto = 1.3

    method sueldo() = self.sueldoNeto() + self.bonoResultados(self)

    method sueldoNeto() = categoria.neto() * superioridadNeto
    method bonoResultados(empleado) = tipoBonoResultados.resultado(empleado)
}

object roque {
    var property tipoBonoResultados = porcentaje 

    method sueldo() = self.sueldoNeto() + self.bonoResultados(self) + 9000

    method sueldoNeto() = 28000
    method bonoResultados(empleado) = tipoBonoResultados.resultado(empleado)
}

object ernesto {
    var property categoria = compañero.categoria()
    var property compañero = sofia
    var property tipoBonoPresentismo = normal
    const faltas = 0 

    method sueldo() = self.sueldoNeto() + self.bonoPresentismo(self)

    method sueldoNeto() = categoria.neto()
    method bonoPresentismo(empleado) = tipoBonoPresentismo.presentismo(empleado)
}


//CATEGORIAS
object gerente {
    method neto() = 15000
}

object cadete {
    method neto() = 20000
}

object vendedor {
    var aplicaAumento = false

    method activarAumentoPorMuchasVentas() {
        aplicaAumento = true
    }

    method desactivarAumentoPorMuchasVentas() {
        aplicaAumento = false
    }

    method neto() {
        if (aplicaAumento) {
            return 16000 * 1.25
        } else {
            return 16000
        }
    }
}

object medioTiempo {
  var categoriaBase = null
  
  method categoriaBase(categoria) {
    categoriaBase = categoria
  }
  
  method neto() {
    return categoriaBase.neto() / 2
  }
}


//BONOS POR RESULTADO
object porcentaje {
    method resultado(empleado) = empleado.sueldoNeto() * 0.1
}

object monto {
    method resultado(empleado) = 800
}

object nuloResultado {
    method resultado(empleado) = 0
}


//BONOS POR PRESENTISMO

object normal {
    method presentismo(empleado) = if (empleado.cantidadDeFaltas() == 0) {2000} else if (empleado.cantidadDeFaltas() == 1 ) {1000} else {0}
}

object ajuste {
    method presentismo(empleado) = if (empleado.cantidadDeFaltas() == 0) {100} else {0}
}

object demagogico {
    method presentismo(empleado) = if (empleado.sueldoNeto() < 18000) {500} else {300}
}

object nuloPresentismo {
    method presentismo(empleado) = 0
}