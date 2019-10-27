*** Settings ***
Library    SeleniumLibrary  
Library    String    


*** Keywords ***
Page load success
    Wait Until Page Contains    Shopping-cart summary    5 seconds
    
Verify total products price
    [Arguments]    ${check_price}
    ${total products price} =    Get Text    id:total_product
    # ${total products price} =    Replace String    ${total products price}    $    ${EMPTY}    
    Should Be Equal As Strings    ${check_price}    ${total products price}    
  
Verify shipping fee
    [Arguments]    ${check_price}
    ${shipping fee} =    Get Text    id:total_shipping
    Should Be Equal As Strings    ${check_price}    ${shipping fee}
    
Verify total price
    [Arguments]    ${check_price}
    ${total price} =    Get Text    id:total_price
    Should Be Equal As Strings    ${check_price}    ${total price}
    
Summery total price
   ${total-products} =     Get Text    id:total_product
   ${total-products} =    Replace String     ${total-products}    $    ${EMPTY}  
   # ${total-products} =    Convert To Number     ${total-products}    
   
   ${total-shipping} =     Get Text    id:total_shipping
   ${total-shipping} =    Replace String     ${total-shipping}    $    ${EMPTY} 
   # ${total-shipping} =    Convert To Number     ${total-shipping} 
     
   ${total-tax} =     Get Text    id:total_tax
   ${total-tax} =    Replace String     ${total-tax}    $    ${EMPTY}   
   # ${total-tax} =    Convert To Number    ${total-tax}
   
   ${total-price} =     Get Text    id:total_price
   ${total-price} =    Replace String     ${total-price}    $    ${EMPTY}   
   # ${total-price} =    Convert To Number    ${total-price}
   
   ${sum}=    Evaluate    ${total-products} + ${total-shipping} + ${total-tax}
   Should Be Equal As Strings   ${sum}    ${total-price}
   


