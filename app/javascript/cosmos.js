import * as THREE from 'three';

let ambient, directionalLight, 
    cloudGeo, cloudMaterial, cloudParticles = [], 
    rain, rainGeo, rainMaterial, rainDrop, rainCount = 15000,
    flash;
let scene, camera, renderer;

function init() {
  scene = new THREE.Scene();
  camera = new THREE.PerspectiveCamera(60,window.innerWidth / window.innerHeight, 1, 1000);
  camera.position.z = 1;
  camera.rotation.x = 1.16;
  camera.rotation.y = -0.12;
  camera.rotation.z = 0.27;
  ambient = new THREE.AmbientLight(0x555555);
  scene.add(ambient);
  directionalLight = new THREE.DirectionalLight(0xffeedd);
  directionalLight.position.set(0,0,1);
  scene.add(directionalLight);
  flash = new THREE.PointLight(0x062d89, 30, 500 ,1.7);
  flash.position.set(200,300,100);
  scene.add(flash);
  renderer = new THREE.WebGLRenderer();
  scene.fog = new THREE.FogExp2(0x11111f, 0.002);
  renderer.setClearColor(scene.fog.color);
  renderer.setSize(window.innerWidth, window.innerHeight);
  document.getElementById('background').appendChild(renderer.domElement);
  rainGeo = new THREE.Geometry();
  for(let i=0;i<rainCount;i++) {
    rainDrop = new THREE.Vector3(
      Math.random() * 400 - 200,
      Math.random() * 500 - 250,
      Math.random() * 400 - 200
    );
    rainDrop.velocity = {};
    rainDrop.velocity = 0;
    rainGeo.vertices.push(rainDrop);
  }
  rainMaterial = new THREE.PointsMaterial({
    color: 0xaaaaaa,
    size: 0.1,
    transparent: true
  });
  rain = new THREE.Points(rainGeo,rainMaterial);
  scene.add(rain);
  let loader = new THREE.TextureLoader();
  loader.load("assets/smoke-1-0da65e55c2d0358c753763fa515c2536692065c5beaa19696024d2b322474a02.png", function(texture){
    cloudGeo = new THREE.PlaneBufferGeometry(500,500);
    cloudMaterial = new THREE.MeshLambertMaterial({
      map: texture,
      transparent: true
    });
    for(let p=0; p<25; p++) {
      let cloud = new THREE.Mesh(cloudGeo,cloudMaterial);
      cloud.position.set(
        Math.random()*800 - 400,
        500,
        Math.random()*500 - 450
      );
      cloud.rotation.x = 1.16;
      cloud.rotation.y = -0.12;
      cloud.rotation.z = Math.random()*360;
      cloud.material.opacity = 0.6;
      cloudParticles.push(cloud);
      scene.add(cloud);
    }
    animate();
  });
}
function animate() {
  cloudParticles.forEach(p => {
    p.rotation.z -=0.002;
  });
  rainGeo.vertices.forEach(p => {
    p.velocity -= 0.1 + Math.random() * 0.1;
    p.y += p.velocity;
    if (p.y < -200) {
      p.y = 200;
      p.velocity = 0;
    }
  });
  rainGeo.verticesNeedUpdate = true;
  rain.rotation.y +=0.002;
  if(Math.random() > 0.93 || flash.power > 100) {
    if(flash.power < 100) 
      flash.position.set(
        Math.random()*400,
        300 + Math.random() *200,
        100
      );
    flash.power = 50 + Math.random() * 500;
  }
  renderer.render(scene, camera);
  requestAnimationFrame(animate);
}

function clearThree(obj){
  while(obj.children.length > 0){ 
    clearThree(obj.children[0])
    obj.remove(obj.children[0]);
  }
  if(obj.geometry) obj.geometry.dispose()

  if(obj.material){ 
    Object.keys(obj.material).forEach(prop => {
      if(!obj.material[prop])
        return         
      if(obj.material[prop] !== null && typeof obj.material[prop].dispose === 'function')                                  
        obj.material[prop].dispose()                                                        
    })
    obj.material.dispose()
  }
}   

$(document).on("turbolinks:load", () => {
  if (document.getElementById('background')) {
    console.log(document.getElementById('background'))
    init();
  }
});

$(document).on("turbolinks:change", () => {
  clearThree(scene);
});