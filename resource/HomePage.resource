*** Settings ***
Library    SeleniumLibrary  


*** Keywords ***
Add product to shopping cart
    [Arguments]    ${id}
    Mouse Over    xpath:(//div[@class="product-image-container"])[${id}]
    Click Link    css:ul#homefeatured a[data-id-product="${id}"]

Check out product
    Wait Until Element Is Visible    css:a[title="Proceed to checkout"]    5 seconds
    Click Link    css:a[title="Proceed to checkout"]