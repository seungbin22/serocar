$(function(){
    $('.mcd').click(function(){
        $('#mcd').css('display','block').fadeIn();
        $('#sgp').css('display','none').fadeOut();
        $('#svd').css('display','none').fadeOut();
        $('#tlb').css('display','none').fadeOut();
        $('#wtc').css('display','none').fadeOut();
        $('#rpt').css('display','none').fadeOut();

    });
    $('.sgp').click(function(){
        $('#sgp').css('display','block').fadeIn();
        $('#mcd').css('display','none').fadeOut();
        $('#tlb').css('display','none').fadeOut();
        $('#svd').css('display','none').fadeOut();
        $('#rpt').css('display','none').fadeOut();
        $('#wtc').css('display','none').fadeOut();
        
    });
    $('.tlb').click(function(){
        $('#sgp').css('display','none').fadeOut();
        $('#mcd').css('display','none').fadeOut();
        $('#svd').css('display','none').fadeOut();
        $('#rpt').css('display','none').fadeOut();
        $('#wtc').css('display','none').fadeOut();
        $('#tlb').css('display','block').fadeIn();
    });
    $('.svd').click(function(){
        $('#svd').css('display','block').fadeIn();
        $('#sgp').css('display','none').fadeOut();
        $('#mcd').css('display','none').fadeOut();
        $('#tlb').css('display','none').fadeOut();
        $('#rpt').css('display','none').fadeOut();
        $('#wtc').css('display','none').fadeOut();  
    });
    $('.rpt').click(function(){
        $('#rpt').css('display','block').fadeIn();
        $('#sgp').css('display','none').fadeOut();
        $('#mcd').css('display','none').fadeOut();
        $('#tlb').css('display','none').fadeOut();
        $('#svd').css('display','none').fadeOut();
        $('#wtc').css('display','none').fadeOut();  
    });
    $('.wtc').click(function(){
        $('#wtc').css('display','block').fadeIn();
        $('#sgp').css('display','none').fadeOut();
        $('#mcd').css('display','none').fadeOut();
        $('#tlb').css('display','none').fadeOut();
        $('#rpt').css('display','none').fadeOut();
        $('#svd').css('display','none').fadeOut();  
    });


    
});

$(function(){
    $('.mcd').click(function(){
        $('.txt1').hide();
        $('.txt2').show();
        $('.txt3').hide();
        $('.txt4').hide();
        $('.txt5').hide();
        $('.txt6').hide();
    }); 
    $('.sgp').click(function(){
        $('.txt1').show();
        $('.txt2').hide();
        $('.txt3').hide();
        $('.txt4').hide();
        $('.txt5').hide();
        $('.txt6').hide();
    });
    $('.tlb').click(function(){
        $('.txt1').hide();
        $('.txt2').hide();
        $('.txt3').show();
        $('.txt4').hide();
        $('.txt5').hide();
        $('.txt6').hide();
    });
    $('.svd').click(function(){
        $('.txt1').hide();
        $('.txt2').hide();
        $('.txt3').hide();
        $('.txt4').show();
        $('.txt5').hide();
        $('.txt6').hide();
    });
    $('.rpt').click(function(){
        $('.txt1').hide();
        $('.txt2').hide();
        $('.txt3').hide();
        $('.txt4').hide();
        $('.txt5').show();
        $('.txt6').hide();
    });
    $('.wtc').click(function(){
        $('.txt1').hide();
        $('.txt2').hide();
        $('.txt3').hide();
        $('.txt4').hide();
        $('.txt5').hide();
        $('.txt6').show();
    });   


    
});



// 
$(function(){
    $('.video-1').click(function(){
        $('.video-img').hide();
    })
})
// 
var swiper = new Swiper('.swiper-container', {
    slidesPerView: 1,
    spaceBetween: 10,
    // init: false,
    pagination: {
      el: '.swiper-pagination',
      clickable: true,
    },
    navigation: {
      prevEl: '.swiper-button-prev',
    nextEl: '.swiper-button-next',
   
  },

});

