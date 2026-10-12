const input     = document.getElementById('nombre');
const btnBuscar = document.getElementById('buscar');
const resultado = document.getElementById('resultado');
const cargando  = document.getElementById('cargando');

async function buscarPokemon(nombre) {
  resultado.innerHTML = '';
  cargando.textContent = 'Cargando...';

  try {
    const url = `https://pokeapi.co/api/v2/pokemon/${nombre.toLowerCase().trim()}`;
    const response = await fetch(url);

    if (!response.ok) {
      throw new Error('Pokémon no encontrado');
    }

    const data = await response.json();

    const nombrePk = data.name;
    const imagen   = data.sprites.front_default;
    const tipos    = data.types.map(t => t.type.name).join(', ');
    const pesoKg   = (data.weight / 10).toFixed(2);   // hectogramos → kg
    const alturaM  = (data.height / 10).toFixed(2);   // decímetros → metros

    resultado.innerHTML = `
      <h2>${nombrePk}</h2>
      <img src="${imagen}" alt="${nombrePk}">
      <p><strong>Tipos:</strong> ${tipos}</p>
      <p><strong>Peso:</strong> ${pesoKg} kg</p>
      <p><strong>Altura:</strong> ${alturaM} m</p>
    `;
  } catch (error) {
    resultado.innerHTML = `<p class="error">❌ Error: ${error.message}. Verifica el nombre e intenta nuevamente.</p>`;
  } finally {
    cargando.textContent = '';
  }
}

btnBuscar.addEventListener('click', () => {
  const nombre = input.value.trim();
  if (!nombre) {
    resultado.innerHTML = '<p class="error">⚠️ Escribe un nombre de Pokémon.</p>';
    return;
  }
  buscarPokemon(nombre);
});

input.addEventListener('keypress', (e) => {
  if (e.key === 'Enter') btnBuscar.click();
});