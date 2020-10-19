const novoSaldo = document.querySelector('div#novo-saldo');
if(novoSaldo){

  const btn = document.querySelector('button')

  btn.addEventListener('click', function(event){
    const token = $('meta[name="csrf-token"]').attr('content');
    const inputs = document.querySelectorAll('input');
    const data = new FormData()
    data.append('data', new Date() + 1)
    inputs.forEach(input => {
      data.append('bancos[]id', input.id)
      data.append('bancos[]valor', input.value)
    });

    fetch('/saldo/create', {
      method: 'POST',
      headers: {
        'X-CSRF-Token': token,
      },
      body: data
    }).then(() => {
      history.back()
    }).catch(()=>{
      history.back()
    })
  })
}