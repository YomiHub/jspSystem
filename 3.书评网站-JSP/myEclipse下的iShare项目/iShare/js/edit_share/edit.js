window.onload = function() {
    MV.app.toInput();
}

var MV = {}; 


MV.app = {}; 


MV.app.toInput = function() {
    var inputOne = document.getElementById('searchOne');
    var inputTwo = document.getElementById('searchTwo');

    MV.ui.textChange(inputOne, 'Search website');
    MV.ui.textChange(inputTwo, 'Search website');

}

MV.ui = {}; 
MV.ui.textChange = function(obj, str) {
    obj.onfocus = function() {
        if (this.value == str) {
            this.value = '';
        }
    }

    obj.onblur = function() {
        if (this.value == '') {
            this.value = str;
        }
    }
}