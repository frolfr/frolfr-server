describe("Smoke test", function() {

  beforeEach(function() {
    App.reset();
  });

  it("renders the template", function() {
    visit('/');
    andThen(function() {
      var title = find('#title');
      expect(title.text()).to.equal("Frolfr");
    });
  });
});

