/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
const tablaTitulos = document.getElementById("cvTable");
tablaTitulos.addEventListener("click", verificarClic);

const tableBody = document.getElementById('cvTableBody');
const caption = document.getElementById("cvTotalTitulos");

const agregarButton = document.getElementById("agregarButton");



agregarButton.addEventListener("click", (e)=>{
    if(e.target.matches(".agregarBoton")){
        const tIndex = e.target.parentNode.parentNode.rowIndex;
        tablaTitulos.deleteRow(tIndex);
        setTableCount();
}});



function verificarClic(e){
    if(e.target.matches(".eliminarRow")){
        // console.log("Eliminar la Fila")
        
        // console.log(e.target.parentNode.parentNode.rowIndex)
        
        const tIndex = e.target.parentNode.parentNode.rowIndex;
        tablaTitulos.deleteRow(tIndex);
        setTableCount();
    }
}

function setTableCount(){
    const tableBody = document.getElementById('cvTableBody');
    const tableBodyCount = tableBody.rows.length;
    const caption = document.getElementById("cvTotalTitulos");
    caption.textContent = "Titulos agregados:" + tableBodyCount;
}

