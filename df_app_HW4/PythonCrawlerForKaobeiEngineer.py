import requests
from bs4 import BeautifulSoup

def htmlPaserAndDownloader(CategoryTag,pathFix):

    url = 'https://kaobei.engineer/rankings/+'+ CategoryTag
    tag = '.col-block a img'
    result = requests.get(url)
    soup = BeautifulSoup(result.text, 'html.parser')

    index = 0
    for img in soup.select(tag):
        index += 1
        img_data = requests.get(img.get('src')).content
        with open('./data/'+pathFix+'/'+pathFix+'_{}.jpg'.format(index), 'wb') as handler:
            handler.write(img_data)



if __name__ == '__main__':
    print("Execute locally")