
$(function(){
    const mainMenu = $('.nav > li')

    mainMenu.hover(
        function(){
            $('.submenu, .nav .back').stop().slideDown()
        },
        function(){
            $('.submenu, .nav .back').stop().slideUp()
        }
    )
})