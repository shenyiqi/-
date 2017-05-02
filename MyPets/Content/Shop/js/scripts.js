
jQuery(document).ready(function() {

    /*
        Background slideshow ±³¾°½¥±ä
    */
    $.backstretch([
      "../Content/Shop/img/backgrounds/1.jpg"
    , "../Content/Shop/img/backgrounds/2.jpg"
    , "../Content/Shop/img/backgrounds/3.jpg"
    ], {duration: 3000, fade: 750});

   
    $('.links a.home').tooltip();
    $('.links a.blog').tooltip();

});


