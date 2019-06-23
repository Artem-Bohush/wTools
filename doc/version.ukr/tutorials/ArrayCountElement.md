# Рутина arrayCountElement

Рутина для підрахунку кількості входжень елемента в масив.

Рутина `arrayCountElement` є членом модуля `Tools`, вона виконує підрахунок кількості входжень указаного елемента в переданому масиві.

Рутина приймає чотири аргументи:

- `srcArray` - масив елементів, в якому ведеться пошук визначеного елемента;
- `element` - елемент порівняння, рутина безпосередньо порівнює значення елементів масиву зі значенням `element`. Аргумент приймає рядкові і числові значення;
- `onEvaluate1` - аргумент який може виконувати функції [еквалайзера](../concept/Equalizer.md) або задати умову пошуку [евалуатора](../concept/Evaluator.md);
- `onEvaluate2` - в аргумент передається рутина, що перетворює аргумент `element` до потрібного вигляду.

Аргументи `srcArray` i `element` обов'язкові, а `onEvaluate1` i `onEvaluate2` використовуються опціонально. Якщо в рутину передається аргрумент `onEvaluate1` - він має бути еквалайзером, а якщо `onEvaluate1` i `onEvaluate2` - частинами евалуатора.

Після виконання рутина `arrayCountElement` повертає кількість входжень елемента в масив.

### Використання рутини

<details>
  <summary><u>Структура файлів</u></summary>

```
arrayCountElement
        ├── ArrayCountElement.js
        └── package.json

```

</details>

Створіть приведену конфігурацію для дослідження рутини `arrayCountElement`.

<details>
  <summary><u>Код файла <code>ArrayCountElement.js</code></u></summary>

```js
require( 'wTools' );

// without equalizer or evalutor

let arr1 = [ 1, 2, 'a', 'b', true, 6, 1 ];
let elem1 = 1;

console.log( wTools.arrayCountElement( arr1, elem1 ) );

// with equilizer

let arr2 = [ 'a', 'b', 'c', 1, 2, true, 'd', 3, false ];
let elem2 =  'str';
let equalizer = ( elem2, arr2 ) => typeof elem2 === typeof arr2;

console.log( wTools.arrayCountElement( arr2, elem2, equalizer ) );

// with evalutor

let arr3 = [ [ 0, 'a' ], [ 'b', 0 ], [ 2, 0 ], [ 0, true ], [ 4, 'a', 0 ] ];
let elem3 =  0;
let evalutor1 = ( arr3 ) => arr3[ 0 ];
let evalutor2 = ( elem3 ) => elem3;

console.log( wTools.arrayCountElement( arr3, elem3, evalutor1, evalutor2 ) );

```

</details>

Внесіть приведений вище код в файл `ArrayCountElement.js`. 

### Структура коду

Код файла структурно ділиться на чотири частини.

Перша секція - підключення залежностей. Для використання рутини треба підключити модуль `Tools`. Скопіюйте приведений нижче код в файл `package.json`.

<details>
    <summary><u>Код файла <code>package.json</code></u></summary>

```json    
{
  "dependencies": {
    "wTools": ""
  }
}

```

</details>

Для встановлення залежностей скористуйтесь командою `npm install`. Після встановлення залежностей модуль готовий до роботи.

Друга секція - підрахунок кількості входжень без використання еквалайзера або евалуатора.

Змінна `arr1` позначає масив, в якому буде вестись пошук. Масив одномірний, має сім елементів. Елементи масиву мають числовий, рядковий і булевий тип даних.

Змінна `elem1` - елемент порівняння, має числове значення `1`. В масиві `arr1` є два елементи зі значенням `1`.

Змінні винесені за межі рутини `arrayCountElement` для наглядності.

Третя секція коду - підрахунок кількості входжень з еквалайзером.

Масив `arr2` складається з елементів різного типу. Якщо рутині передати тільки аргументи `arr2` i `elem2`, то кількість входжень буде рівною нулю. Це викликано тим, що рутина безпосередньо порівнює значення елемента масиву і елемент порівняння `str`. 

При використанні еквалайзера значення елементів масиву і елемента порівняння перетворюються вказаною рутиною. В коді файла еквалайзер має вигляд

```js
let equalizer = ( elem2, arr2 ) => typeof elem2 === typeof arr2;
```
Вказана рутина порівнює типи даних елемента порівняння і елементу масиву, лічильник рутини збільшується при співпадінні цих значень. Відповідно, рутина має порахувати чотири елементи з типом `String`.

Еквалайзер завжди має два аргумента. Перший з них елемент порівняння, а другий застосовується до елементів масиву.

Четверта секція - підрахунок кількості входжень з евалуатором.

Масив `arr3` - двомірний, він складається з п'яти елементів різного величини. Рутина веде пошук по елементам першого рівня вкладеності тому, переданий елемент `elem3` зі значенням `0` не буде знайдений. Для пошуку кількості входжень використовується евалуатор.

Евалуатор складається з двох частин. Перша вказує де має вестись пошук елемента

```js
let evalutor1 = ( arr3 ) => arr3[ 0 ];
```

тобто, серед елементів масиву з індексом `0`.

Друга вказує як має бути перетворений елемент порівняння

```js
let evalutor2 = ( elem3 ) => elem3;
```

Дана рутина не змінює форми елемента порівняння.

Таким чином, рутина `arrayCountElement` має знайти два включення в масиві `arr3`.

### Виконання файла

Для того, щоб перевірити роботу рутини запустіть виконання файла `ArrayCountElement.js` в інтерпретаторі `NodeJS`.

<details>
  <summary><u>Вивід команди <code>node ArrayCountElement.js</code></u></summary>

```
[user@user ~]$ node ArrayCountElement.js
2
4
2
```

</details>

Виконайте команду `node ArrayCountElement.js` в директорії модуля та порівняйте вивід консолі.

Як було зазначено, в першому масиві знайдено два включення, в другому - чотири, а в третьому два.

### Підсумок

- Рутина `arrayCountElement` повертає кількість входжень елемента в указаному масиві.
- Рутина `arrayCountElement` приймає чотири аргументи. Два обов'язкових - масив і елемент порівняння, та два за необхідністю - еквалайзер або евалуатор.
- Рутину `arrayCountElement` можна запустити лише з двома аргументами - масивом `srcArray` і елементом порівняння `element` - `wTools.arrayCountElement( srcArray, element );`.
- Рутину `arrayCountElement` можна запустити додатково указавши еквалайзер - `wTools.arrayCountElement( srcArray, element, equalizer );`. Еквалайзер - рутина, що приймає два аргументи для їх подальшого перетворення. Перший аргумент - елемент порівняння, другий - елемент масиву.
- Рутину `arrayCountElement` можна запустити додатково указавши евалуатор, що складається з двох частин - `wTools.arrayCountElement( srcArray, element, evalutor1, evalutor2 );`. Кожна з рутин евалуатора приймає один аргумент: `evalutor1` приймає аргумент з елементом масива, `evalutor2` - з елементом порівняння..