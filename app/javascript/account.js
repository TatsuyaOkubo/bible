window.addEventListener('load', function(){

  const userButton = document.getElementById("account")
  userButton.addEventListener('mouseover', function(){
    this.setAttribute("style", "background-color:#FFBEDA;")
  })

  userButton.addEventListener('mouseout', function(){
    this.removeAttribute("style", "background-color:#FFBEDA;")
  })
})