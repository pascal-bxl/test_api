require 'test_helper'

class PersonnesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personne = personnes(:one)
  end

  test "should get index" do
    get personnes_url, as: :json
    assert_response :success
  end

  test "should get filtered prenom index" do
    get personnes_url(filter: 'cal'), as: :json

    data = JSON.parse(@response.body)
    assert_equal 'Pascal', data.first["prenom"]
  end

  test "should get filtered nom index" do
    get personnes_url(filter: 'fre'), as: :json

    data = JSON.parse(@response.body)
    assert_equal 'Pascal', data.first["prenom"]
  end

  test "should create personne" do
    assert_difference('Personne.count') do
      post personnes_url, params: { personne: { nom: @personne.nom, prenom: @personne.prenom } }, as: :json
    end

    assert_response 201
  end

  test "shouldn't create personne without nom" do
    post personnes_url, params: { personne: { nom: '', prenom: @personne.prenom } }, as: :json
    assert_response 422
  end

  test "shouldn't create personne without prenom" do
    post personnes_url, params: { personne: { nom: @personne.nom, prenom: '' } }, as: :json
    assert_response 422
  end

  test "should show personne" do
    get personne_url(@personne), as: :json
    assert_response :success
  end

  test "should update personne" do
    patch personne_url(@personne), params: { personne: { nom: @personne.nom, prenom: @personne.prenom } }, as: :json
    assert_response 200
  end

  test "shouldn't update personne without nom" do
    patch personne_url(@personne), params: { personne: { nom: '', prenom: @personne.prenom } }, as: :json
    assert_response 422
  end

  test "shouldn't update personne without prenom" do
    patch personne_url(@personne), params: { personne: { nom: @personne.nom, prenom: '' } }, as: :json
    assert_response 422
  end

  test "should destroy personne" do
    assert_difference('Personne.count', -1) do
      delete personne_url(@personne), as: :json
    end

    assert_response 204
  end
end
