describe('View the product detail page', () => {

  beforeEach(() => {
    cy.visit("/");
  });

  it("should navigate to the product detail page by clicking on a product", () => {
    cy.get(".products article")
      .first()
      .click()
      .contains('Scented Blade')
  });

})