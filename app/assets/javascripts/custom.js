 
$(document).ready(function(){
    $(".up").click(function(){
        var pli = $(this).parent('li');
        pli.insertBefore(pli.prev());
        return false
    });
    $(".down").click(function(){
        var pli = $(this).parent('li');
        pli.insertAfter(pli.next());
        return false
    });
});
 