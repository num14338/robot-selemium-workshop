*** Settings ***
Library    SeleniumLibrary  
Resource    ../resource/Common.resource
Resource    ../resource/HomePage.resource
Resource    ../resource/OrderPage.resource
# Resource    ../StepDef/PerProduct_Step.robot
Suite Setup    Ecommerce Suite Setup
Suite Teardown    Close All Browsers
# Test Setup     Ecommerce Test Setup
Test Teardown    Capture Page Screenshot

*** Test Cases ***
Demo Page 
    HomePage.Add product to shopping cart    1
    HomePage.Check out product
    OrderPage.Page load success
    OrderPage.Verify total products price    $16.51
    OrderPage.Verify shipping fee    $2.00
    OrderPage.Verify total price    $18.51
    
Demo math
    OrderPage.Summery total price

# Demo ATDD test script
    # # [Tags]    ignore
    # Given Unaunthen user add product "1" should calculate total price
    # # And Unaunthen user add product "2" should calculate total price
    # When I Checkout product
    # Then I should see total product price equal to "$16.51"
    # # And  I should see total shipping fee equal to "$2.00"
    # # And  I should see total price equal to "$18.51"
    # # And  I should see total price equal to summery

# Normal User checkout multiple product should calculate total price and shipping fee
    # Mouse Over    xpath:(//div[@class="product-image-container"])[1]
    # Click Link    css:ul#homefeatured a[data-id-product="1"]
    # Wait Until Element Is Visible    css:a[title="Proceed to checkout"]    5 seconds
    # Click Link    css:a[title="Proceed to checkout"]
    # Wait Until Page Contains    Shopping-cart summary    5 seconds

  