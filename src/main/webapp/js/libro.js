
//Modal Autor
var myModal = document.getElementById('modalAutor')
var myInput = document.getElementById('modalAutor')

myModal.addEventListener('shown.bs.modal', function () {
  myInput.focus()
})

function enviarFormularioModal() {
    var codd= document.getElementById("book-aautor-id").value;
    var nomm = document.getElementById("book-aautor-name").value;
    var apee = document.getElementById("book-aautor-lastname").value;
    
    // Construir datos del formulario
    var formData = new FormData();
    formData.append('CodA', codd);
    formData.append('NomA', nomm);
    formData.append('ApeA', apee);

    // Realizar la solicitud fetch
    fetch('LibrosController?command=addAutor&CodA='+codd + "&NomA=" +nomm + "&ApeA="+apee, {
        method: 'POST',
        body: formData
    })

    // Cerrar el modal 
    $('#modalAutor').modal('hide');
}

//Modal Categoria
var miModal = document.getElementById('modalCategoria')
var miInput = document.getElementById('modalCategoria')

miModal.addEventListener('shown.bs.modal', function () {
  miInput.focus()
})

function enviarFormularioModal2() {
    var idd = document.getElementById("book-cate-id").value;
    var catee = document.getElementById("book-cate-name").value;

    // Construir datos del formulario
    var formData = new FormData();
    formData.append('CodC', idd);
    formData.append('NomC', catee);

    // Realizar la solicitud fetch
    fetch('LibrosController?command=addCate&CodC='+ idd + "&NomC=" + catee, {
        method: 'POST',
        body: formData
    })

    // Cerrar el modal 
    $('#modalCategoria').modal('hide');
}


function recargar(){
	ventana = confirm("Se perderán los elementos llenados en el formulario principal. ¿Seguro de realizar esta acción?"
			+ " Puedes marcar un por defecto y después modificarlo desde la lista");
	
	if(ventana == true){
		location.reload(true);
	}
}

function previewImages(event) {
  let input = event.target;
  let previewContainer = document.getElementById('preview-container');
  previewContainer.innerHTML = ''; // Clear previous previews

  if (input.files && input.files.length > 0) {
    for (let i = 0; i < input.files.length; i++) {
      let reader = new FileReader();
      let img = document.createElement('img');
      img.className = 'img-preview';

      reader.onload = (function(image) {
        return function(e) {
          image.src = e.target.result;
        };
      })(img);

      reader.readAsDataURL(input.files[i]);
      previewContainer.appendChild(img);
    }
  }
}
