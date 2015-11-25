var ready = function(){
    $('.accordion').accordion();
}

$(document).ready(ready);
$(document).on('page:change', ready);
