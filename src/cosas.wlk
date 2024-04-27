
object heladera {
	method precio() { return 200000 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object cama {
	method precio() { return 80000 }
	method esComida() { return false }
	method esElectrodomestico() { return false }	
}

object tiraDeAsado {
	method precio() { return 3500 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object paqueteDeFideos {
	method precio() { return 500 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object plancha {
	method precio() { return 12000 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object unKiloDeMilanesasRebozadas{
	method precio() { return 2600 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object botellaDeSalsaDeTomate {
	method precio() { return 900 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object microondas {
	method precio() { return 42000 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object unKiloDeCebollas {
	method precio() { return 250}
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object compu {
	method precio() { return dolar.precioDeVenta() * 500 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object packDeComida {
	var platoPrincipal
	var aderezo
	
	method setPlato(comida) { platoPrincipal = comida	}
	method setAderezo(comida) { aderezo = comida }
	method precio() { return platoPrincipal.precio() + aderezo.precio() }
	method esComida() { return true }
	method esElectrodomestico() { return false }
}

object dolar {
	method precioDeVenta() { return 1055 }
}