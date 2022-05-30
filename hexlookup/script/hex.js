function changeBG(e) {
    
    var hexcode = "#".concat(document.getElementById('field').value);
    var container = document.getElementById('container');
    
    if (hexcode.length === 4 || hexcode.length === 7) {
        container.style.backgroundColor = hexcode;
        
    }
    else if(hexcode.length === 1) {
        container.style.backgroundColor = "#fff";
    }
    else {
        return;
    }
    
}


addEventListener('keyup',changeBG);