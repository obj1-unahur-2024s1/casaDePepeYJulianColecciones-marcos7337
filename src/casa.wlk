import cosas.*
const cosas = []
object casaDePepeYJulian {
	var cuentaDeLaCasa
	
	method setCuenta(cuenta) { cuentaDeLaCasa = cuenta }
	method comprar(cosa) {
		if (cosa.precio() <= self.dineroDisponible()) {
			cosas.add(cosa)
			self.gastar(cosa.precio())
		}
	}
	method cantidadDeCosasCompradas() { return cosas.size()}
	method tieneComida() { return cosas.any({cosa => cosa.esComida()}) }
	method vieneDeEquiparse() { return (cosas.last().esElectrodomestico() || cosas.last().precio() > 50000)}
	method esDerrochosa() { return cosas.sum({cosa => cosa.precio()}) > 90000 }
	method compraMasCara() { return cosas.max({cosa => cosa.precio()}) }
	method electrodomesticosComprados() {
		const electrodomesticos = []
		electrodomesticos.addAll(cosas.filter({cosa => cosa.esElectrodomestico()}))
		return electrodomesticos
	}
	method malaEpoca() { return cosas.all({cosa => cosa.esComida()}) }
	method queFaltaComprar(lista) { return lista.difference(cosas) }
	method faltaComida() { return cosas.count({cosa => cosa.esComida()}) < 2 }
	method gastar(importe) { cuentaDeLaCasa.extraer(importe) }
	method dineroDisponible() { return cuentaDeLaCasa.saldo() }
}

// CUENTAS BANCARIAS

object cuentaCorriente {
	var saldo = 200000
	
	method depositar(importe) { saldo += importe }
	method extraer(importe) { saldo -= importe }
	method saldo() = saldo
}

object cuentaConGastos {
	var saldo = 300000
	
	method depositar(importe) { saldo += importe - 200}
	method extraer(importe) {
		const comision = if(importe > 10000) importe * 0.02 else 200 
		saldo = saldo - (importe + comision)
	}
	method saldo() = saldo
}

object cuentaCombinada {
	var cuentaPrimaria
	var cuentaSecundaria
	
	method setPrimaria(cuenta) {
		cuentaPrimaria = cuenta
		if (cuentaSecundaria == cuenta) cuentaSecundaria = null
	}
	method setSecundaria(cuenta) {
		cuentaSecundaria = cuenta
		if (cuentaPrimaria == cuenta) cuentaPrimaria = null
	}
	method depositar(importe) { cuentaPrimaria.depositar(importe)}
	method extraer(importe) {
		if(importe > cuentaPrimaria.saldo()) {
			cuentaSecundaria.extraer((importe - cuentaPrimaria.saldo()))
			cuentaPrimaria.extraer((cuentaPrimaria.saldo()))
		} else {
			cuentaPrimaria.extraer(importe)
		}
	}
	method saldo() { return cuentaPrimaria.saldo() + cuentaSecundaria.saldo()}
}
