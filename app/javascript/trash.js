window.addEventListener('load', function(){

  const userButton = document.getElementById("trash-btn-icon")

  userButton.addEventListener('click', function(){
    this.setAttribute("style", "background-color:#FFBEDA;")
  })

  userButton.addEventListener('mouseout', function(){
    this.removeAttribute("style", "background-color:#FFBEDA;")
  })
})