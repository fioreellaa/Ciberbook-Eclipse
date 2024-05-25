const inpt = document.querySelector("#searchie");
const btn = document.querySelector("#btnSearch");

if (inpt && btn) {
  const filtrar = (e) => {
    const input = inpt.value.toLowerCase();
    console.log(input.value)
    e.preventDefault();
  }

  btn.addEventListener('click', filtrar);
} else {
  console.error('No se encontraron los elementos necesarios');
}

