describe('Product Page', () => {
  it('can navigate from the home page to the product detail page by clicking on a product', () => {
    cy.visit('/');
    cy.get('article').first().click();

    cy.url().should('include', '/products/');
  });
});