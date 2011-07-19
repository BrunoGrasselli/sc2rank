Feature: Admin pages

  Scenario: Using all pages
    Given there is no player
    And an user exists
    And I am on the admin page
    When I fill in "Email" with "test@email.com"
    And I fill in "Password" with "123456"
    And I press "Sign in"
    Then I should see "Signed in successfully"

    When I follow "Cadastrar novo"
    And I fill in "Pontos iniciais" with "100"
    And I fill in "Perfil" with "http://profile.com/1"
    And I press "Create Player"
    Then I should see "Player was successfully created"

    When I follow "Lista de jogadores"
    And I follow "Editar"
    And I fill in "Pontos iniciais" with "200"
    And I fill in "Perfil" with "http://profile.com/2"
    And I press "Update Player"
    Then I should see "Player was successfully updated"

    When I follow "Lista de jogadores"
    And I follow "Excluir"
    Then I should see "Player was successfully destroyed"
    But I should not see "Editar"
