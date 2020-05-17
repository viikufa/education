# education

описание слайдов и полезные ссылки

## Слайд 1: 

Всем привет меня зовут Ямщиков Виталий
Я работаю в группе разработки мобильных приложений iOS
Сегодня мы с вами обсудим разработку под мобильную платформу iOS и обсудим первые шаги и с чего стоит начать

За 20 минут будет сложно рассказать все про мобильную разработку под iOS, но в данной презентации будут все необходимые ссылки для самостоятельного изучения.
После лекции вам будет представлена запись этой лекции а также сама презентация совсем необходимым материалом.

## Слайд 2: 


### Для разработки нам потребуется Xcode.

Xcode - это эта среда разработки под операционной системы macOS, iOS, watchOS, Apple TV OS. 
К сожалению, Xcode работает только под управлением macOS и для этого нам потребуется либо компьютер с яблочком, либо, если же вы пользователь Windows, воспользоваться вирталкой с Hacintosh
В сети вы без проблем можете найти образы Hacintosh для виртуальных машин VMWare или VirtualBox.
[установка Hacintosh в VMWare](https://bit.ly/3cGm78K)

Однако стоит заметить что разработка под Hacintosh можно вставлять некоторую боль и желательно иметь mac для комфортной разработки 

## Слайд 3: 


### Давайте обсудим как на каких языках можно нативно разрабатывать под iOS
Вы можете конечно писать на Objective-С, но сейчас Apple широко продвигает и пропагандируют язык разработки и Swift для своих платформ
На мой взгляд, для быстрого старта всё-таки стоит начать с языка Swift а в дальнейшем можете спокойно углубиться в Objective-С

## Слайд 4: 


Для примера покажу использование этих языков у нас в банке
Как видите уже менее 80 % проекта содержит Objective-С и 23% - Swift
И доля Swift продолжает расти, ввиду того, что новые модули приложения разрабатываются на нём

## Слайд 5: 


Я не буду глубоко вдаваться в подробности и особенности языка.
Просто скажу что Swift мне очень понравился и подкупил своей лаконичностью.
С официальной документации вы можете ознакомиться на [https://docs.swift.org/swift-book/](https://bit.ly/368fUjA)
На [https://swiftbook.ru/content/docs/](https://bit.ly/3cGE5Ia) вы можете познакомиться с переводом на русский язык. 
Так же вы можете посмотреть плэйлист на YouTube на канале [The Swift Developers](https://bit.ly/3bHD1T8)
На этом же канале в разделе плейлистов вы можете найти плейлисты по темам архитектуры и UIKit, которые в дальнейшем вам также понадобятся для разработки

## Слайд 6: 


### UIKit
Чтобы построить мобильное приложение под iOS нам потребуется конечно же стройматериалы.
Apple подготовила нам два фреймворка для построения UI это UIKit и SwiftUI.
SwiftUI мы не особо используем потому как поддержка его возможно только на устройствах с начиная с 13-го iOS.
В связи с этим большой популярностью пользуются UIKit.
Давайте взглянем на основные компоненты UIKit
Видеоуроки по UIKit [https://www.youtube.com/watch?v=FNTDQ6FJUqg&list=PLmTuDg46zmKD6nI5Meg0_atl0qY-UgTtP](https://bit.ly/3fUO2DX)

## Слайд 7: 


### UIApplication

UIApplication является системным объектом и запускает наше мобильное приложение в главном потоке и управляет его жизненным циклом. В структуре проекта вы его не найдете и будете взаимодействовать непосредственно с AppDelegate - класс реализация протокола UIApplicationDelegate.

Использовать его для решения таких задач как:
- Инициализация корневых структур данных вашего приложения.
Конфигурирование сцен вашего приложения.
Реагирование на уведомления, поступающие извне приложения, такие как предупреждения о нехватке памяти, уведомления о завершении загрузки и т. д.
Реагирование на события, которые нацелены на само приложение и не относятся к сценам, представлениям или контроллерам вашего приложения.
Регистрация для любых необходимых служб во время запуска, таких как служба Apple Push Notification. 

Подробнее можно почитать тут [https://developer.apple.com/documentation/uikit/app_and_environment/responding_to_the_launch_of_your_app](https://apple.co/3dU1Mgx)

## Слайд 8: 


### UIWindow UIWindow - это класс наследник UIView который является неким пано для добавления UI элементов.

Забегая далеко вперед скажу, что тут мы можем программно создать объект UIWindow в application(_:didFinishLaunchingWithOptions:) AppDelegate, положить в него начальный контроллер и сделать его ключевым и видимым.

Сейчас так как мы новички проще будет ничего тут не менять и использовать storyboard для навигации. В структуре проекта по умолчанию создается главный Main.storyboard внутри которого можно увидеть контроллер помеченный как входная точка

Просто для понимая стоит знать что корневым элементом интерфейса является UIWindow UIViewController - класс который уже содержит внутри себя view на который накладываются элементы сцены.
Внутри него вы будете взаимодействовать с графическими элементами:
управлять иерархией компонентов
определять расположение элементов внутри view
отрисовывать нужный текст в лэйблах
обрабатывать нажатия на кнопки, жесты
реагировать на события жизненного цикла ViewController

Подробнее тут [https://developer.apple.com/documentation/uikit/uiwindow](https://apple.co/3cAYWg9)

## Слайд 9: 

### UIViewController lifecycle
В UIViewController мы можнем обрабатывать события жизненного цикла

События на картинке - event’ы отрабатывающие при показе или скрытии контроллера

Чаще всего многие используют просто viewDidLoad как входную точку. но важно понимать что именно происходит с контроллером

подробнее [https://developer.apple.com/documentation/uikit/view_controllers/displaying_and_managing_views_with_a_view_controller](https://apple.co/2WFMF4u)

## Слайд 10: 
 ### UITabBarController - контроллер который является неким контейнером контроллеров

Многие уже не раз видели его.
Особенностью его является то что он выполняет роль навигации по контроллерам с использованием кнопок в нижней части экрана.

Контроллеры для отображения хранятся в массиве viewControllers
И по индексу нажатой кнопки отображается нужный контроллер из массива

Для вложенных контроллеров лучше всего использовать UINavigationController c нужным контроллером внутри.
описание UITabBarController [https://developer.apple.com/documentation/uikit/uitabbarcontroller](https://apple.co/2WF7woL)

## Слайд 11: 

### UINavigationController

UINavigationController - тоже контроллер своего рода контейнер.
Он служит для того чтоб упростить навигацию внутри приложения.

Внутри себя он содержит стэк(массив) контроллеров по которым мы можем передвигаться последовательно вверх и вниз

Контроллер всегда инициализируются с rootViewController.
В вехрней части характерно отображение NavigationBar.
Он состоит из 3х основных областей 
левая - как правило при навигации тут отображается кнопка назад с заголовком предыдущего контроллера в стоке
центральная часть - для отображения заголовка экрана
правая часть - для отображения кастомных кнопок (UIBarButtonItem)

Подробнее - [https://developer.apple.com/documentation/uikit/uinavigationcontroller](https://apple.co/2LDdSi4)

Тут уже есть отсылка к следующему слайду =)

## Слайд 12: 


### UTableViewController

С подобного рода контроллером тоже много уже сталкивались.
Представляет из себя таблицу в один столбец, включающий в себя различные ячейки и секции.
Для экономии памяти ячейки и секции являются переиспользуемыми компонентами и при прокрутке вниз новые объекты не создаются, а переиспользуются. 

#### SectionHeader

- Ячейки могут быть сгруппированы в секции, помечены пользовательским заголовком и / или помечены нижним колонтитулом. Заголовок может быть установлен со строковым значением или может быть предоставлено настраиваемое представление, чтобы обеспечить другой макет или стиль.

#### Cells
Ячейки являются основным элементом пользовательского интерфейса для таблицы. При правильной реализации ячейки используются повторно для повышения эффективности памяти. Существует четыре встроенных стиля ячеек, и вы можете создавать свои собственные ячейки.

#### SectionFooter
- Дополнительный нижний колонтитул раздела может быть установлен со строковым значением, или может быть предоставлено настраиваемое представление, чтобы учесть другой макет или стиль. Заголовки и нижние колонтитулы могут быть установлены независимо.

#### Index
- Индекс отображается в виде полосы символов по правому краю таблицы. Касание или перетаскивание по указателю ускоряет прокрутку к этой части таблицы. Индекс не является обязательным, но рекомендуется для навигации по длинным спискам. Индекс обычно не используется со сгруппированным стилем.

#### Режим редактирования

Существует несколько различных функций редактирования:

- Проведите пальцем, чтобы удалить отдельные ячейки.
- Вход в режим редактирования для отображения кнопок удаления в каждой строке
- Вход в режим редактирования, чтобы показать элементы переупорядочения.
- Вставка новых ячеек (с анимацией).
Хорошая статья по работе с UITableView для начинающих тут [https://habr.com/ru/post/436390/](https://bit.ly/2yXW1jc)

## Слайд 13: 


### UICollectionViewController

Принцип работы его практически такой же как и у таблиц, но с тем отличием что ячейки могут располагаться не только одна под другой.

Можно сделать чтоб ячейки располагались горизонтально, друг за другом и даже разных размеров.
На этом надолго останавливаться не будем, просто оставлю ссылочку [https://developer.apple.com/documentation/uikit/uicollectionview](https://apple.co/2LB4tYf)

## Слайд 14: 


### Views and Controls

Ну и собственно сами компоненты которые мы можем использовать.

Вкратце расскажу что есть большое число элементов. 
Вы можете найти их в InterfaceBuider при добавлении элементов из библиотеки
Список компонентов схожи 

Весь список и документация по ним доступны тут [https://developer.apple.com/documentation/uikit/views_and_controls](https://apple.co/367bCsJ)

## Слайд 15: 


### Networking

В работе с сетью вам будут полезны следующие темы 
протоколы Encodable и Decodable. Служат для кодирования/декодирования объектов в JSON
JSONEncoder и JSONDecoder
URLSession - для отправки запросов

Полезные ссылки: 
[https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types](https://apple.co/2yXWxh8)
[https://developer.apple.com/documentation/foundation/archives_and_serialization/using_json_with_custom_types](https://apple.co/3cF5URr)
[https://developer.apple.com/documentation/foundation/url_loading_system](https://apple.co/2X3nd8a)

# Еще ссылочки на обучение
Канал Алексея Скутаренко - [https://www.youtube.com/user/AlexSkutarenko/playlists](https://bit.ly/2WEoCmr)
Канал The swift developers - [https://www.youtube.com/channel/UCiyiEAeWUuuPj6tt_jePALQ/playlists](https://bit.ly/3bHD1T8)
Канал SwiftBool - https://www.youtube.com/channel/UCXlCPCsB09ftBA5bQfiSWoQ/videos

Курсы Raywenderlich - https://www.raywenderlich.com/
Курсы SwiftBook - http://swiftbook.ru
