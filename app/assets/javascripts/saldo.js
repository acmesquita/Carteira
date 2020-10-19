var novoSaldo = $('div#novo-saldo');
if(novoSaldo){
  var btn = $('button')
  btn.addEventListener('click', function(){
    var token = $('meta[name="csrf-token"]').attr('content');
    var inputs = document.querySelectorAll('input');
    var data = new FormData()
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
    })

    history.back()
  })
}