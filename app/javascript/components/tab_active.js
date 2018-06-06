function addTabClassActive() {
  const anchor = location.hash.replace("#","")
  if ( anchor ) {
    document.querySelectorAll(".tab-pane").forEach(function(tab) {
      tab.classList.remove("active")
    })
    document.getElementById(anchor).classList.add("active")
    document.getElementById(`nav-${anchor}`).classList.add("active")
  } else {
    document.querySelector(".nav-tabs li").classList.add("active")
  }
}

export { addTabClassActive };
