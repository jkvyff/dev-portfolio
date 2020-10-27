$(document).on("turbolinks:load", () => {
  const containers = document.getElementsByClassName("card-container");
  const cards = document.getElementsByClassName("project-card");
  const images = document.querySelectorAll("img");
  const titles = document.querySelectorAll(".card-text");


  for (let idx in containers) {
    // Animate on hover
    containers[idx].addEventListener("mousemove", (e) => {
      const B = containers[idx].getBoundingClientRect();
      const centerX = B.left + B.width / 2;
      const centerY = B.top + B.height / 2;
      const xAxis = (centerX - e.pageX) / 35;
      const yAxis = (centerY + window.scrollY - e.pageY) / 35;
  
      cards[idx].style.transform = `rotateY(${-xAxis}deg) rotateX(${yAxis}deg)`;
    })

    // On leave transition to neutral
    containers[idx].addEventListener("mouseleave", (e) => {
      cards[idx].style.transform = 'rotateY(0deg) rotateX(0deg)';
      cards[idx].style.transition = 'all 0.5s ease';
      images[idx].style.transform = 'translateZ(0px)';
      titles[idx].style.transform = 'translateZ(0px)';
      
    })

    // Keep no transition speed while interacting
    containers[idx].addEventListener("mouseenter", (e) => {
      cards[idx].style.transition = 'none';
      images[idx].style.transform = 'translateZ(30px)';
      titles[idx].style.transform = 'translateZ(15px)';
    })
  }
});
