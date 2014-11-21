//= require application
//= require support/bind-poly
//= require support/chai
//= require support/mocha-adapter

window.expect = chai.expect;

document.write('<div id="ember-testing-container"></div>');
App.rootElement = "#ember-testing-container";

App.setupForTesting();
App.injectTestHelpers();
