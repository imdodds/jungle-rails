describe('Add item to cart', () => {

  beforeEach(() => {
    cy.visit("/");
  });

  it("should add item to cart by clicking on the add button", () => {
    cy.get(".products article").first().find(".btn").click({ force: true })
    cy.contains("My Cart (1)");
  });

})