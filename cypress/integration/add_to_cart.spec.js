describe('Add to Cart', () => {
  it('should add an item to the cart', () => {
    cy.visit('/');
    cy.get('article').first().contains('Add').click({ force: true })

    cy.contains('My Cart (1)');
  });
});