// To create 1.json, 2.json, etc run this in the chrome console
/*
var array = [];
var links = document.getElementsByTagName("a");
for(var i=0; i<links.length; i++) {
    if(links[i].href.indexOf(".zip") > -1)
      array.push(links[i].href);
}

copy(JSON.stringify(array))
*/

var links1 = require('1.json'), links2 = require('2.json'), links3 = require('3.json'),
    links4 = require('4.json'), links5 = require('5.json');
var links = links1.concat(links2).concat(links3).concat(links4).concat(links5);
var casper = require('casper').create();


/*casper.start().each(links, function(self, link, i) {
    this.download(link, i  + '.zip');
});*/

casper.start('http://www3.inegi.org.mx/sistemas/biblioteca/sfi/detalle2.aspx?s=est&upc=0&pf=prod&ef=0&f=2&cl=0&tg=3604&c=265&ct=201100000&titulo=nacional', function() {
    for(i=0; i<links.length; i++) {
        this.download(links[i], 'zip/' + i + '.zip');
    }
});

casper.run(function() {
    this.echo('Done.').exit();
});
