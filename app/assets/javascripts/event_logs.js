// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

;(function () {

  'use strict';


  $('#btn-imprimir-pedido').click(function () {
    var conteudo = document.getElementById('print1').innerHTML;
    var conteudo2 = document.getElementById('print2').innerHTML,
      tela_impressao = window.open('about:blank');

      tela_impressao.document.write(conteudo + conteudo2);
      tela_impressao.window.print();
      tela_impressao.window.close();
  });


})();
m
