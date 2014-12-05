// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require maskedinput

$(function() {
  $("#game_game_date").mask("99/99/9999");

  var gamesTable = $(".games-table");

  $(".game-filter").on("click", "li a", function() {
    var $this = $(this)
      , targetClass = "." + $this.attr('href').substring(1)
      , trs = gamesTable.find("tr"+targetClass)
      , parent = $this.parent('li')
    ;

    parent.addClass('active');
    parent.siblings().removeClass('active');

    console.info(trs);

    trs.siblings().hide();
    trs.show();
  });
});