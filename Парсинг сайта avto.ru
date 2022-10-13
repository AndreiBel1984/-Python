from selenium import webdriver
import time
from selenium.webdriver.common.by import By
import re  # Регулярные выражения

# Можно добавить опцию --headless => тогда не будет видно окна
browser = webdriver.Chrome()  # Создаем браузера
browser.maximize_window()
# 1.Открываем сайт auto.ru
browser.get("https://auto.ru/")   
time.sleep(30)

#2.Переходим по ссылке Лада
LADA = browser.find_element(By.CSS_SELECTOR, "div.IndexMarks__col:nth-child(2) > a:nth-child(1) > div:nth-child(1)").click();
time.sleep(5)

#3.Выбираем в кредит
kredit = browser.find_element(By.CSS_SELECTOR, ".Checkbox_size_l > span:nth-child(1) > span:nth-child(2)")
kredit.click()
time.sleep(5)

#4.Кликните по кнопке “Показать предложения”
Button = browser.find_element(By.CSS_SELECTOR, ".Button_color_blue")
Button.click()
time.sleep(5)

#5.Распарсите и выведите на экран цены на автомобили, используйте функцию find_elements
price = browser.find_elements(By.CLASS_NAME, "ListingItemPrice__content")

for kar_price in price:
    print(f'цены на авто:{kar_price.text}')
    rubles = re.sub(r"\D", "", kar_price.text)  # Замена
    print(int(rubles))

#6.Выведите модель самого дешевого автомобиля
liist = []
for kar_price in price:
    rubles = re.sub(r"\D", "", kar_price.text)  # Замена
    liist.append(int(rubles))
print()
print(f'минимальная цена: {min(liist)}')
