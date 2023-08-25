$(function () {
$('#datepicker').datepicker({
        startDate: '-0m'
        
        //endDate: '+2d'
    }).on('changeDate', function(ev){
        $('#sDate1').text($('#datepicker').data('date'));
        $('#datepicker').datepicker('hide');
    });

});