Feature: Login Test - Magento
  This is login test

  Scenario: Login with valid credentials
    Given driver 'https://kera-ae.cnnbsolutions.com/BO_KerAE21'
    And input("//*[@id='username']","ragini")
    And input("//*[@id='login']","Welcomepoi1!")
    When click("//span[normalize-space()='Sign in']")
    When click("//button[@class='action-close']/span")
    When click("//ul[@id='nav']/li[3]/a/span")
    When click("//li[@data-ui-id='menu-magento-sales-sales-order']//a")
    Then match driver.title == 'Orders / Operations / Sales / Magento Admin'

    When click("//button[contains(text(),'Filters')]")
    And input("//input[@name='ngl_hip_source_order_number']", "Ragini_testOrder_7833")
    When click("//button[@class='action-secondary']")
    When click("//table[@class='data-grid data-grid-draggable']/tbody[1]/tr[1]/td[1]/label[1]/input[1]")
    When click("//div[@class='col-xs-2']//span[@class='action-menu-item'][normalize-space()='Cancel']")

