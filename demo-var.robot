*** Test Cases ***
demo scalar
    ${username}   BuiltIn.Set Variable    num1234   
    ${password}    Set Variable    1234567
    log    Hello ${username}
    
demo list
    @{list}    Create List    A  B  C
    Log Many    @{list}
    log    ${list[0]}

demo dicyionary
    &{user}    Create Dictionary    username=num111    password=12345
    log    ${user.username}