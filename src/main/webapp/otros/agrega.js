

//cargamos los valores de canvas y botones

let canvasInteres = document.getElementById("offcanvasDark");

let botonInteres = document.getElementById("listaInteres");

//cambiamos el hide por show del canvas al apretar boton
botonInteres.addEventListener("click", event => {

    canvasInteres.classList.remove("hide", "show");

    canvasInteres.classList.add("show");


});

//cambiamos el show por hide al apretar la x cerrar del canvas
let botonInteresC = document.getElementById("cerrarCanvas");

botonInteresC.addEventListener("click", event2 => {

    canvasInteres.classList.replace("show", "hide");

});





//eliminamos las ventas que tocamos
function EliminarV() {


    const parrafos = interes.querySelectorAll('p');

    parrafos.forEach(parrafo => {
        parrafo.addEventListener('click', event => {
            // const dato = parrafo.textContent;
            const dato = event.target.textContent;
            //hacemos visible el alert con su titulo y color
            let suceso = "Se elimino del carrito";
            let tipoAlert = "alert-danger";
            alertAgrego(dato, suceso, tipoAlert);

            const index = interesAgregado.indexOf(dato);


            if (index > -1) {

                interesAgregado.splice(index, 1);
                interesPrecioAgregado.splice(index, 1);

                actualizarCarrito();

            }
            else {
                console.log("no se elimino");

            };


            // Eliminar el elemento <p> del contenedor
            parrafo.parentNode.removeChild(parrafo);
        });
    });


};





//actualizamos el carrito

function actualizarCarrito() {
    total();
    agregarC();
    const conjuntoExistente = new Set();

    interesPrecioAgregado.forEach(ia => {
        const parrafoExistente = Array.from(interes2.getElementsByTagName("p")).find(
            parrafo => parrafo.textContent === ia
        );

        if (parrafoExistente) {
            parrafoExistente.textContent = ia;
        } else {
            const parrafo = document.createElement("p");
            parrafo.textContent = ia;
            interes2.appendChild(parrafo);
        }

        conjuntoExistente.add(ia); // Agregar el valor al conjunto existente
    });

    // Eliminar los párrafos sobrantes del contenedor
    Array.from(interes2.getElementsByTagName("p")).forEach(parrafo => {
        if (!conjuntoExistente.has(parrafo.textContent)) {
            interes2.removeChild(parrafo);

        };
    });
};



//funcion alert personalizada

function alertAgrego(titAlert, suceso, tipoAlert) {
    //ponemos el titulo del producto en el alert
    let alertTitulo = document.getElementById("alertTit");
    alertTitulo.textContent = `${titAlert} `;

    //ponemos el suceso del alert- sea danger o sucess
    let alertSuceso = document.getElementById("alertSuceso");
    alertSuceso.textContent = `${suceso} `;

    let alertAgrego = document.getElementById("alertAgrego");
    //hacemos el alert visible 
    alertAgrego.classList.remove("hide", "show");

    alertAgrego.classList.remove("alert-success", "alert-danger");
    alertAgrego.classList.add(tipoAlert);

    alertAgrego.classList.add("show");

    //Colocamos el timpo del alert antes de desactivarse
    setTimeout(() => {
        alertAgrego.classList.remove("hide", "show");

        alertAgrego.classList.add("hide");


    }, 2000);





function cargarDatosBack(){

    
}



};
