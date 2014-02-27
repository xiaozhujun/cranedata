function blinkit()
{
    intrvl=0;
    for(nTimes=0;nTimes<1000;nTimes++)
    {
        intrvl += 200;
        setTimeout("$('.btn').css('backgroundColor','#ADFF2F')",intrvl);
        //intrvl += 200;
        // setTimeout("$('.btn').css('backgroundColor','#7FFF00')",intrvl);
        intrvl += 200;
        setTimeout("$('.btn').css('backgroundColor','#66FF00')",intrvl);

        /* 红色*/
        intrvl += 200;
        setTimeout("$('.btn1').css('backgroundColor','#FF6633')",intrvl);
        //intrvl += 200;
        // setTimeout("$('.btn1').css('backgroundColor','#FF0033')",intrvl);
        intrvl += 200;
        setTimeout("$('.btn1').css('backgroundColor','#FF0000')",intrvl);
    }
}