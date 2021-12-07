function negativeFunction() {
  var checkBox = document.getElementById("negBox");
  var backgrounds = document.getElementsByClassName("negative");

  if (checkBox.checked == true){
    for (var i = 0; i < backgrounds.length; i++) {
        backgrounds[i].style.backgroundColor = '#E1ECE3';
        backgrounds[i].style.color = 'black';
     }
  } else {
        for (var i = 0; i < backgrounds.length; i++) {
        backgrounds[i].style.backgroundColor = '#191414';
        backgrounds[i].style.color = 'white';
        
     }
  }
}

function positiveFunction() {
  var checkBox = document.getElementById("posBox");
  var backgrounds = document.getElementsByClassName("positive");

  if (checkBox.checked == true){
    for (var i = 0; i < backgrounds.length; i++) {
        backgrounds[i].style.backgroundColor = '#61D088';
        backgrounds[i].style.color = 'black';
     }
  } else {
        for (var i = 0; i < backgrounds.length; i++) {
        backgrounds[i].style.backgroundColor = '#191414';
        backgrounds[i].style.color = 'white';
        
     }
  }
}

function neutralFunction() {
  var checkBox = document.getElementById("neutBox");
  var backgrounds = document.getElementsByClassName("neutral");

  if (checkBox.checked == true){
    for (var i = 0; i < backgrounds.length; i++) {
        backgrounds[i].style.backgroundColor = '#457E59';
        backgrounds[i].style.color = 'black';
     }
  } else {
        for (var i = 0; i < backgrounds.length; i++) {
        backgrounds[i].style.backgroundColor = '#191414';
        backgrounds[i].style.color = 'white';
        
     }
  }
}

function drugsFunction() {
  var checkBox = document.getElementById("drugBox");
  var topics = document.getElementsByClassName("drugs");

  if (checkBox.checked == true){
    for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = '#509BF5';
        topics[i].style.fontWeight = 'bold';
     }
  } else {
        for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = 'white';
        topics[i].style.fontWeight = 'normal';
        
     }
  }
}

function deathFunction() {
  var checkBox = document.getElementById("deathBox");
  var topics = document.getElementsByClassName("death");

  if (checkBox.checked == true){
    for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = '#FE4632';
        topics[i].style.fontWeight = 'bold';
     }
  } else {
        for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = 'white';
        topics[i].style.fontWeight = 'normal';
        
     }
  }
}

function familyFunction() {
  var checkBox = document.getElementById("familyBox");
  var topics = document.getElementsByClassName("family");

  if (checkBox.checked == true){
    for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = '#FFC464';
        topics[i].style.fontWeight = 'bold';
     }
  } else {
        for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = 'white';
        topics[i].style.fontWeight = 'normal';
        
     }
  }
}

function religionFunction() {
  var checkBox = document.getElementById("religionBox");
  var topics = document.getElementsByClassName("religion");

  if (checkBox.checked == true){
    for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = '#84c2b4';
        topics[i].style.fontWeight = 'bold';
     }
  } else {
        for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = 'white';
        topics[i].style.fontWeight = 'normal';
        
     }
  }
}

function moneyFunction() {
  var checkBox = document.getElementById("moneyBox");
  var topics = document.getElementsByClassName("money");

  if (checkBox.checked == true){
    for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = '#CDF563';
        topics[i].style.fontWeight = 'bold';
     }
  } else {
        for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = 'white';
        topics[i].style.fontWeight = 'normal';
        
     }
  }
}

function povertyFunction() {
  var checkBox = document.getElementById("povertBox");
  var topics = document.getElementsByClassName("poverty");

  if (checkBox.checked == true){
    for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = '#A0C3D2';
        topics[i].style.fontWeight = 'bold';
     }
  } else {
        for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = 'white';
        topics[i].style.fontWeight = 'normal';
        
     }
  }
}

function wealthFunction() {
  var checkBox = document.getElementById("wealthBox");
  var topics = document.getElementsByClassName("wealth");

  if (checkBox.checked == true){
    for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = '#F7E32C';
        topics[i].style.fontWeight = 'bold';
     }
  } else {
        for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = 'white';
        topics[i].style.fontWeight = 'normal';
        
     }
  }
}

function violenceFunction() {
  var checkBox = document.getElementById("violenceBox");
  var topics = document.getElementsByClassName("violence");

  if (checkBox.checked == true){
    for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = '#5d24ff';
        topics[i].style.fontWeight = 'bold';
     }
  } else {
        for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = 'white';
        topics[i].style.fontWeight = 'normal';
        
     }
  }
}

function socialFunction() {
  var checkBox = document.getElementById("socialBox");
  var topics = document.getElementsByClassName("social_issues");

  if (checkBox.checked == true){
    for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = '#AB3F9C';
        topics[i].style.fontWeight = 'bold';
     }
  } else {
        for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = 'white';
        topics[i].style.fontWeight = 'normal';
        
     }
  }
}

function gangsFunction() {
  var checkBox = document.getElementById("gangsBox");
  var topics = document.getElementsByClassName("gangs");

  if (checkBox.checked == true){
    for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = '#5722E5';
        topics[i].style.fontWeight = 'bold';
     }
  } else {
        for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = 'white';
        topics[i].style.fontWeight = 'normal';
        
     }
  }
}

function ambiguousFunction() {
  var checkBox = document.getElementById("ambiguousBox");
  var topics = document.getElementsByClassName("ambiguous");

  if (checkBox.checked == true){
    for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = '#48937E';
        topics[i].style.fontWeight = 'bold';
     }
  } else {
        for (var i = 0; i < topics.length; i++) {
        topics[i].style.color = 'white';
        topics[i].style.fontWeight = 'normal';
        
     }
  }
}

