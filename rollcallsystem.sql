/*
SQLyog Ultimate v12.3.1 (64 bit)
MySQL - 5.5.40 : Database - rollcallsystem
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`rollcallsystem` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `rollcallsystem`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cid` int(2) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`cid`,`type`) values 
(1,'基础阶段'),
(2,'web阶段'),
(3,'框架阶段');

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `id` int(5) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `analysis` varchar(100) DEFAULT NULL,
  `answer` varchar(1200) DEFAULT NULL,
  `extend` varchar(800) DEFAULT NULL,
  `practice` varchar(100) DEFAULT NULL,
  `cid` int(2) DEFAULT NULL,
  KEY `cid` (`cid`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `question` */

insert  into `question`(`id`,`title`,`analysis`,`answer`,`extend`,`practice`,`cid`) values 
(1,'遍历map的几种方法？','考察Map集合遍历的几种方式,每种方式直接的差别和有确定,以及如何去选择采取哪种方式来进行遍历','1.通过Map.entrySet遍历key和value，在for-each循环中使用entries来遍历;2.通过Map.keySet遍历key，通过键找值value遍历;3.通过Map.keySet或Map.values来实现遍历;4.通过Map.entrySet使用iterator遍历key和value','1.entrySet的方式整体都是比keySet方式要高一些;2.单纯的获取key来说，两者的差别并不大，但是如果要获取value，还是entrySet的效率会更好，因为keySet需要从map中再次根据key获取value，而entrySet一次都全部获取出来；3.iterator的迭代器方式比foreach的效率高;4.foreach的语法只是对iterator进行了简单的包装，使用起来更加方便而已，但是如果在foreach循环体内，对集合元素进行删除添加操作的时候，会报出ConcurrentModificationException，并发修改异常。如果需要在遍历集合的时候对象集合中元素进行删除操作，需要使用iterator的遍历方式，iterator自带的remove删除方式不会报出异常.',NULL,1),
(2,'hashmap的特性？','考察HashMap的工作原理以及特性,明白哪里要用到HashMap,HashTable和HashMap之间的区别','HashMap存储键值对，实现快速存取数据；允许null键/值；非同步；不保证有序(比如插入的顺序)。实现map接口','HashMap是基于hashing的原理，底层使用哈希表（数组 + 链表）实现。里边最重要的两个方法put、get，使用put(key, value)存储对象到HashMap中，使用get(key)从HashMap中获取对象。 Hashtable可以看做是线程安全版的HashMap，两者几乎“等价”（当然还是有很多不同）。Hashtable几乎在每个方法上都加上synchronized（同步锁），实现线程安全。',NULL,1),
(3,'Java虚拟机中的内存模型？','考察Java内存区的构成,以及Java虚拟机运行时内存各部分的作用','Java虚拟机运行时内存主要由五个部分组成,分别为:方法区、堆、虚拟机栈、本地方法栈、程序计数器','方法区用于存储被虚拟机加载的类信息、常量、static变量等数据。字符串常量池就位于方法区。堆用于存储对象实例，java中通new创建的对象实例就保存在堆中。虚拟机栈用于实现方法调用，每次方法调用就对应栈中的一个栈帧，栈帧包含局部变量表、操作数栈、方法接口等于方法相关的信息。本地方法栈类似于虚拟机栈，只是保存的是本地方法（其他语言实现的系统方法）的调用。实际上在HotSpot虚拟机的实现中，虚拟机栈和本地方法栈被合并在一起。程序计数器的功能相当于PC寄存器的功能，如果当前执行的是Java方法，则指示当前字节码指令的地址，如果执行的是本地本地方法，则值为Undefined。其中，方法区和堆是线程共享的内存，虚拟机栈、本地方法栈、程序计数器是线程独立的内存，每个线程只保存自己的数据。',NULL,1),
(4,'简单说说Java中的异常处理机制的简单原理和应用。','考察异常的分类和产生原因以及如何去处理异常','异常指Java程序运行时（非编译）所发生的非正常情况或错误。Java对异常进行了分类，不同类型的异常使用了不同的java类，所有异常的根类为java.lang.Throwable.Throwable派生了2个子类：Error和Exception。Error表示程序本身无法克服和恢复的一种严重错误，程序只有死的份，如内存溢出和死锁问题等系统问题。Exception表示还能克服和恢复，其中又分为系统异常和普通异常。系统异常是软件本身缺陷导致的问题，也就是软件开发问题考虑不周所导致的问题，软件使用者无法克服和恢复这种问题，但这种情况下可以选择让软件继续运行或死掉。如数组越界问题（ArrayIndexOutOfBoundsException）,空指针异常（NullPointerException),类转换异常（ClassCastException);普通异常是运行环境的变化或异常导致的问题，是用户能够克服的问题，如网路掉线、硬盘空间不足、IO异常发生这种异常后程序不应该死掉。','java为系统异常和普通异常提供了不同的解决方案，编译器强制普通异常必须try..catch处理或throws声明继续抛给上层调用方法处理。所以普通异常为checked异常，而系统异常可以处理也可以不处理。编译器不强制用try..catch或throws声明，所以系统异常成为uncheckde异常。5个常见的RuntimeException:NullPionterException、ArrayIndexOutOfBoundsException、StringIndexOutOfBoundsException、ClassCastException、NumberFormatException',NULL,1),
(5,'创建线程的几种方式？','考察线程创建的几种方法，以及各种方法之间的区别','Java使用Thread类代表线程，所有的线程对象都必须是Thread类或其子类的实例。Java可以用三种方式来创建线程，如下所示：1）继承Thread类创建线程，2）实现Runnable接口创建线程，3）使用Callable和Future创建线程','实现Runnable和实现Callable接口的方式基本相同，不过是后者执行call()方法有返回值，后者线程执行体run()方法无返回值，因此可以把这两种方式归为一种这种方式与继承Thread类的方法之间的差别如下：1、线程只是实现Runnable或实现Callable接口，还可以继承其他类。2、这种方式下，多个线程可以共享一个target对象，非常适合多线程处理同一份资源的情形。3、但是编程稍微复杂，如果需要访问当前线程，必须调用Thread.currentThread()方法。4、继承Thread类的线程类不能再继承其他父类（Java单继承决定）。注：一般推荐采用实现接口的方式来创建多线程',NULL,1),
(6,'谈谈你对垃圾回收机制的了解？','考察垃圾回收机制的含义及其特点和原理','垃圾回收机制，顾名思义，所以该机制可以使得Java编程自动释放内存空间，减轻了编程的负担，同时，这也是Java语言安全性策略的一个重要部份。当然，凡是有利必有弊，由于Java虚拟机必须追踪运行程序中有用的对象，最终释放没用的对象。这一过程需要花费处理器的时间，同时也因为垃圾回收算法的不完备性，使得垃圾回收机制的开销影响了程序的性能。不过，由于机器的进步和算法的改进，这些问题会慢慢地被解决的。','垃圾回收机制具有以下的特点：1、 垃圾回收机制只负责回收堆内存，不会回收任何物理资源。2、 程序无法精确控制垃圾回收的进行，会在合适的时候进行。3、 在垃圾回收机制回收的任何对象之前，总会先调用它的finalize()方法。需要强调的一点:垃圾回收回收的是无任何引用的对象占据的内存空间而不是对象本身',NULL,1),
(7,'说说HashCode()、equals()的区别？','考察HashCode()和equals()的区别和作用，分别有什么优缺点，在使用是做到如何取舍','在Java中任何一个对象都具备equals(Object obj)和hashCode()这两个方法，因为他们是在Object类中定义的。 equals(Object obj)方法用来判断两个对象是否“相同”，如果“相同”则返回true，否则返回false。 hashCode()方法返回一个int数，在Object类中的默认实现是“将该对象的内部地址转换成一个整数返回”。','1.hashCode是为了提高在散列结构存储中查找的效率，在线性表中没有作用。2.equals和hashCode需要同时覆盖。 3.若两个对象equals返回true，则hashCode有必要也返回相同的int数。 4.若两个对象equals返回false，则hashCode不一定返回不同的int数,但为不相等的对象生成不同hashCode值可以提高哈希表的性能。5.若两个对象hashCode返回相同int数，则equals不一定返回true。 6.若两个对象hashCode返回不同int数，则equals一定返回false。7.同一对象在执行期间若已经存储在集合中，则不能修改影响hashCode值的相关信息，否则会导致内存泄露问题。',NULL,1),
(8,'LinkedList和ArrayList区别？','考察LinkedList和ArrayList区别和工作原理','1、ArrayList和LinkedList可想从名字分析，它们一个是Array(动态数组)的数据结构，一个是Link(链表)的数据结构，此外，它们两个都是对List接口的实现。前者是数组队列，相当于动态数组；后者为双向链表结构，也可当作堆栈、队列、双端队列。2、当随机访问List时（get和set操作），ArrayList比LinkedList的效率更高，因为LinkedList是线性的数据存储方式，所以需要移动指针从前往后依次查找。3、当对数据进行增加和删除的操作时(add和remove操作)，LinkedList比ArrayList的效率更高，因为ArrayList是数组，所以在其中进行增删操作时，会对操作点之后所有数据的下标索引造成影响，需要进行数据的移动。4、从利用效率来看，ArrayList自由性较低，因为它需要手动的设置固定大小的容量，但是它的使用比较方便，只需要创建，然后添加数据，通过调用下标进行使用；而LinkedList自由性较高，能够动态的随数据量的变化而变化，但是它不便于使用。5、ArrayList主要控件开销在于需要在lList列表预留一定空间；而LinkList主要控件开销在于需要存储结点信息以及结点指针信息。','ArrayList内部是使用可増长数组实现的，所以是用get和set方法是花费常数时间的，但是如果插入元素和删除元素，除非插入和删除的位置都在表末尾，否则代码开销会很大，因为里面需要数组的移动。LinkedList是使用双链表实现的，所以get会非常消耗资源，除非位置离头部很近。但是插入和删除元素花费常数时间。',NULL,1),
(9,'String，StringBuilder，StringBuffer三者的区别？','考察String，StringBuilder，StringBuffer三者在运行速度和线程安全这两方面的区别','1.首先说运行速度，或者说是执行速度，在这方面运行速度快慢为：StringBuilder > StringBuffer > String。String为字符串常量，而StringBuilder和StringBuffer均为字符串变量，即String对象一旦创建之后该对象是不可更改的，但后两者的对象是变量，是可以更改的。StringBuilder和StringBuffer的对象是变量，对变量进行操作就是直接对该对象进行更改，而不进行创建和回收的操作，所以速度要比String快很多。2. 线程安全方面，StringBuilder是线程不安全的，而StringBuffer是线程安全的，如果一个StringBuffer对象在字符串缓冲区被多个线程使用时，StringBuffer中很多方法可以带有synchronized关键字，所以可以保证线程是安全的，但StringBuilder的方法则没有该关键字，所以不能保证线程安全，有可能会出现一些错误的操作。所以如果要进行的操作是多线程的，那么就要使用StringBuffer，但是在单线程的情况下，还是建议使用速度比较快的StringBuilder。','String：适用于少量的字符串操作的情况，StringBuilder：适用于单线程下在字符缓冲区进行大量操作的情况，StringBuffer：适用多线程下在字符缓冲区进行大量操作的情况',NULL,1),
(10,'是否可以从一个static方法内部发出对非static方法的调用？','考察静态方法和非静态方法相关知识，主要是对其生命周期的理解','不可以。因为非static方法是要与对象关联在一起的，必须创建一个对象后，才可以在该对象上进行方法调用，而static方法调用时不需要创建对象，可以直接调用。也就是说，当一个static方法被调用时，可能还没有创建任何实例对象，如果从一个static方法中发出对非static方法的调用，那个非static方法关联到那个对象上的呢？这个逻辑无法成立，所以，一个static方法内部不能发出对非static方法的调用。','static方法是静态方法，是属于类的方法非static方法是属于对象的方法，所以在static方法中想要调用非static方法，要先新创建一个对象，再有这个对象来调用非static方法。',NULL,1),
(11,'java中 sleep 和 wait 的区别？','考官主要想对多线程方面的考核，如线程之间的通信还有线程池的使用，如果处理100万条数据，可以分给每个线程一部分，这样处理比较快','sleep（）实际上知识短暂停顿，不会释放锁；而wait（）是等待，该方法要释放锁。','sleep（）方法只让出了CUP，而并不会释放同步资源锁。Wait（）方法只是调用了notify（）方法，之前调用wait（）的线程才会解除wait（）状态，可以去参与竞争同步资源锁，进而得到执行。',NULL,1),
(12,'实现一个线程有哪几种方式,各有什么优缺点,比较常用的是那种？','考察线程创建的几种方法，以及各种方法之间的区别','1.继承Thread类：优点：代码简单 。 缺点：该类无法集成别的类。2.实现Runnable接口：优点：继承其他类。 同一实现该接口的实例可以共享资源。3.实现Callable接口：优点：可以获得异步任务的返回值。4.线程池方式：实现自动化装配，易于管理，循环利用资源。通常使用线程池获取线程。','实现同步有两种：一种是用同步方法，一种是用同步块。同步方法就是在方法返回类型后面加上synchronized, 比如:public void * synchronized add(){...}。同步块就是直接写:synchronized (这里写需要同步的对象){...}',NULL,1),
(13,'String s = new String(\"xyz\");创建了几个StringObject？是否可以继承String类？','考察String字符串创建的相关知识，以及对常量池的理解','如果String常理池中，已经创建\"xyz\"，则不会继续创建，此时只会在堆中创建了一个对象new String(\"xyz\")；如果String常理池中，没有创建\"xyz\"，则会创建两个对象，一个对象的值是\"xyz\"，放入常量池，一个对象new String(\"xyz\")存在于堆中。String 类是final类，不可以被继承。','被final修饰的类是不支持继承的，有一点是”最后的类”,最后的种族的意思，我们只要记得这一点就可以，其它的地方和其它类的用法是一样的。Java中有许多类是final的，譬如String, Interger以及其他包装类。继承String本身就是一个错误的行为，对String类型最好的重用方式是关联关系（Has-A）和依赖关系（Use-A）而不是继承关系（Is-A）。',NULL,1),
(14,'String s = \"Hello\";s = s + \"world!\";这两行代码执行后，原始的String对象中的内容到底变了没有？','考察对String类的理解','没有。因为String是不可变类（immutable class），不可变类，顾名思义就是说类的实例是不可被修改的。实例的信息是在创建的时候提供，并且在整个生命周期中都不可改变。在这段代码中，s原来指向一个String对象，内容是“hello”，然后我们对s进行了+操作，那么s所指向的那个对象是否发生了改变呢？答案是没有。这时，s不指向原来那个对象了，而指向了另一个String对象，内容为”helloworld！\",原来那个对象还存在内存中，只是s这个引用变量不再指向他了。','如果经常对字符串进行各种各样的修改，或者说，不可预见的修改，那么使用String来代表字符串的话会引起很大的内存开销。因为，String对象建立后不能改变，所以对于每一个不同的字符串，都需要一个String对象来表示。这时，应该考虑使用StringBuffer类，他允许修改，而不是每个不同的字符串都要生成一个新的对象。并且，这两种类的对象转换十分容易。对于字符串常量，如果内容相同，Java认为它们代表同一个String对象。而用关键字new调用构造器，总是会创建一个新的对象，无论内容是否相同。',NULL,1),
(15,'多线程解决同步问题的方式？','考察线程同步中可能存在安全隐患的解决方法','1.同步代码块：使用 synchronized() 对需要完整执行的语句进行“包裹”，synchronized(Obj obj) 构造方法里是可以传入任何类的对象，但是既然是监听器就传一个唯一的对象来保证“锁”的唯一性，因此一般使用共享资源的对象来作为 obj 传入 synchronized(Obj obj) 里；2.同步方法：在方法的申明里申明 synchronized；3.使用同步锁：创建私有的 ReetrantLock 对象，调用 lock() 方法，同步执行体执行完毕之后，需要用 unlock() 释放锁；','HashMap和Hashtable都实现了Map接口，但决定用哪一个之前先要弄清楚它们之间的分别。主要的区别有：线程安全性，同步(synchronization)，以及速度。仅在你需要完全的线程安全的时候使用Hashtable，而如果你使用Java 5或以上的话，请使用ConcurrentHashMap吧。',NULL,1),
(16,'Hashtable 与 HashMap 有什么不同之处？','考察Hashtable和HashMap工作原理，否能够正确使用集合类以及是否可以随机应变使用多种思路解决问题','1.HashMap几乎可以等价于Hashtable，除了HashMap是非synchronized的，并可以接受null(HashMap可以接受为null的键值(key)和值(value)，而Hashtable则不行。','HashMap和Hashtable都实现了Map接口，但决定用哪一个之前先要弄清楚它们之间的分别。主要的区别有：线程安全性，同步(synchronization)，以及速度。仅在你需要完全的线程安全的时候使用Hashtable，而如果你使用Java 5或以上的话，请使用ConcurrentHashMap吧。',NULL,1),
(17,'单例中的懒汉和恶汉模式的区别？','考察对懒汉和恶汉模式理解，两者之间的区别以及各自的优缺点','饿汉式是线程安全的,在类创建的同时就已经创建好一个静态的对象供系统使用,以后不在改变；懒汉式如果在创建实例对象时不加上synchronized则会导致对对象的访问不是线程安全的。从实现方式来讲他们最大的区别就是懒汉式是延时加载,他是在需要的时候才创建对象,而饿汉式在虚拟机启动的时候就会创建。','饿汉式无需关注多线程问题、写法简单明了、能用则用。但是它是加载类时创建实例、所以如果是一个工厂模式、缓存了很多实例、那么就得考虑效率问题，因为这个类一加载则把所有实例不管用不用一块创建。懒汉式的优点是延时加载、缺点是应该用同步',NULL,1),
(18,'类加载机制有了解嘛？','考察类加载机制及其所要经历的过程，每个过程具体执行什么操作','类加载就是JVM将class文件加载到内存,并对数据进行校验转换解析等操作,最终形成可以被虚拟机直接使用的Java类型,这就是虚拟机的类加载机制。VM类加载分为5个过程：加载，验证，准备，解析，初始化，使用，卸载。1.加载主要是将.class文件（并不一定是.class。可以是ZIP包，网络中获取）中的二进制字节流读入到JVM中，在加载阶段，JVM需要完成3件事： 1）通过类的全限定名获取该类的二进制字节流；2）将字节流所代表的静态存储结构转化为方法区的运行时数据结构； 3）在内存中生成一个该类的java.lang.Class对象，作为方法区这个类的各种数据的访问入口。2.验证是连接阶段的第一步，主要确保加载进来的字节流符合JVM规范，验证阶段会完成以下4个阶段的检验动作： 1）文件格式验证 ；2）元数据验证(是否符合Java语言规范) ；3）字节码验证（确定程序语义合法，符合逻辑） ；4）符号引用验证（确保下一步的解析能正常执行）。3.准备是连接阶段的第二步，主要为静态变量在方法区分配内存，并设置默认初始值。4.解析是连接阶段的第三步，是虚拟机将常量池内的符号引用替换为直接引用的过程。4.初始化阶段是类加载过程的最后一步，主要是根据程序中的赋值语句主动为类变量赋值。注： 1）当有父类且父类为初始化的时候，先去初始化父类； 2）再进行子类初始化语句。','什么时候需要对类进行初始化？ 1）使用new该类实例化对象的时候； 2）读取或设置类静态字段的时候（但被final修饰的字段，在编译器时就被放入常量池的静态字段除外static final）； 3）调用类静态方法的时候； 4）使用反射Class.forName(“xxxx”)对类进行反射调用的时候，该类需要初始化； 5） 初始化一个类的时候，有父类，先初始化父类（注：1. 接口除外，父接口在调用的时候才会被初始化；2.子类引用父类静态字段，只会引发父类初始化）； 6） 被标明为启动类的类（即包含main()方法的类）要初始化； 7）当使用JDK1.7的动态语言支持时，如果一个java.invoke.MethodHandle实例最后的解析结果REF_getStatic、REF_putStatic、REF_invokeStatic的方法句柄，并且这个方法句柄所对应的类没有进行过初始化，则需要先触发其初始化。',NULL,1),
(19,'什么是事务？事务常见的并发问题及含义、','考察事务的定义、特性、事务并发引出的问题以及如何解决并发问题','事务是指逻辑上的一组操作，组成这组操作的一系列操作要么全部成功，要么一个都不做。因此，事务的结束有两种，当事务中的所有操作全部成功执行时，事务提交。如果其中一个操作失败，将发生回滚操作，撤消到事务开始时的状态。事务具有四个特征：原子性（ Atomicity ）、一致性（ Consistency ）、隔离性（ Isolation ）和持久性（ Durability ）。这四个特性简称为 ACID 特性。事务并发问题：1）脏读：事务A读取了事务B更新、未提交的数据，然后B回滚操作，那么A读取到的数据是脏数据(没有用的数据)；2）不可重复读：事务 A 多次读取同一数据，结果读取的数据不一致，也就是说不支持重复读，重复读会有错误；3）幻读：一个事务在执行过程中读取到了另一个事务已提交的插入数据；即在第一个事务开始时读取到一批数据，但此后另一个事务又插入了新数据并提交，此时第一个事务又读取这批数据但发现多了一条，即好像发生幻觉一样','为了解决以上3个并发问题，要用到事务隔离，有以下四种隔离级别：Serializable (串行化)，可避免脏读、不可重复读、幻读的发生。但是效率最低；Repeatable read (可重复读)，可避免脏读、不可重复读的发生。（最常用的mysql默认的级别）；Read committed (读已提交)，可避免脏读的发生；Read uncommitted (读未提交)，最低级别，任何情况都无法保证，但效率最高，最不安全。',NULL,1),
(20,'你所了解的数据库优化都有哪些？','考察数据库性能优化，以及具体的优化措施','1.对查询进行优化，要尽量避免全表扫描，首先应考虑在 where 及 order by 涉及的列上建立索引。2、应尽量避免在 where 子句中对字段进行 null 值判断，否则将导致引擎放弃使用索引而进行全表扫描。3、应尽量避免在 where 子句中使用 != 或 <> 操作符，否则将引擎放弃使用索引而进行全表扫描。4.应尽量避免在 where 子句中使用 or 来连接条件，如果一个字段有索引，一个字段没有索引，将导致引擎放弃使用索引而进行全表扫描。5.in 和 not in 也要慎用，否则会导致全表扫描。6、like模糊全匹配也将导致全表扫描。7.对访问频繁的数据，充分利用数据库cache和应用的缓存',NULL,NULL,1),
(21,'mysql和oracle的区别？（oracle是在ssm之后讲的）','考察Mysql和Oracle数据相关知识','1.单引号的处理 ：MYSQL里可以用双引号包起字符串，ORACLE里只可以用单引号包起字符串。在插入和修改字符串前必须做单引号的替换：把所有出现的一个单引号替换成两个单引号。2.自动增长的数据类型处理：mysql是一个自动增长的数据类型，插入数据的时候，不需要管理，它自己会自动增长，oracle不支持自动增长的数据类型，通过建立一个自动增长的序列号来完成自动增长。3.sql语句的扩展和灵活性：mysql对sql语句有很多非常实用而方便的扩展，比如limit功能，insert可以一次插入多行数据，select某些管理数据可以不加from。oracle在这方面感觉更加稳重传统一些。4.事物提交方式：oracle默认不自动提交，需要用户手动提交。mysql默认是自动提交。不支持事物。',NULL,NULL,1),
(22,'左链接和右链接的语法及区别？','考察对左连接和有链接的区别','left join （左连接）：返回包括左表中的所有记录和右表中连接字段相等的记录。right join （右连接）：返回包括右表中的所有记录和左表中连接字段相等的记录。','left join （左连接）：如果左表中有记录在右表没有对应连接字段相等的记录则会以null的形式补齐。right join （右连接）：如果右表中有记录在左表没有对应连接字段相等的记录则会以null的形式补齐。',NULL,1),
(23,'cookie和session的区别与联系','考察cookie和session的作用、特点以及两者之间的联系','区别：1.存放位置：session保存在服务器，cookie保存在客户端；2.存放的形式：session是以对象的形式保存在服务器，cookie以字符串的形式保存在客户端；3.用途：session适合做客户的身份验证，cookie适合保存用户的个人设置，爱好等；4.路径：session不能区分路径，同一用户在访问一个网站期间，所有的session在任何一个地方都可以访问到；cookie中如果设置了参数路径，那么同一个网站下的cookie互相访问不到；5.安全性：cookie不是很安全，别人可以分析存放在本地的cookie并进行cookie欺骗，session较cookie更安全一些；6.大小及数量限制：单个cookie在客户端的限制是3K，就是说一个站点在客户端存放的COOKIE不能3K。不同浏览器所含cookie的最大个数不同，一般30到50个；一般认为session没有大小限制。联系：session需要借助cookie才能正常工作，如果客户端完全禁止cookie,session将失效，因为session是由应用服务器维持的一个服务端的存储空间，用户在连接服务器时，会由服务器生成唯一的sesssionid，用该sessionid为标识来存取服务端的session空间。而sessionid存储在cookie中，用户提交页面时会将这个sessionid提交到服务端，来存取session数据.这一过程是不用开发人员干预的，所以一旦客户端禁用cookie,那么session也会失效；','session会在一定时间内保存在服务器上。当访问增多，会比较占用你服务器的性能，如果主要考虑到减轻服务器性能方面，应当使用COOKIE，sessionid是服务器和客户端链接时候随机分配的',NULL,2),
(24,'在HTTP请求中，什么情况下我们会选择post方式而非get？反之也是如何考虑的？','考察get请求和post请求方式的区别，两者之间的优缺点，以及在使用时的取舍','get请求可以获取静态页面，也可以把参数放在URL字串后面，传递给servlet。post与get的不同之处在于post的参数不是放在URL字串里面，而是放在http请求的正文内。对于get方式，服务器端用Request.QueryString获取变量的值，对于post方式，服务器端用Request.Form获取提交的数据。get传送的数据量较小，不能大于2KB。post传送的数据量较大，一般被默认为不受限制。但理论上，IIS4中最大量为80KB，IIS5中为100KB。1.使用post请求的情况：使用post请求是会在浏览器上隐藏参数部分的，所有我们在安全要求很严格的部分都会使用到POST请求。如用户登录，数据增上改等等，都会把参数隐藏起来，这样就不会通过你的请求暴露你的参数格式，并且在向服务器传递大数据的时候，使用POST才是最好的方式，get是有限制的。2.使用get请求的情况：get方式才用在前台页面展示，比如分页、内容业等，这样做的好处是get方式本身的效率高，并且在分享页面中页面是永久性的连接，可用来很好的传播。POST中链接地址是不变化的。','建议：1、get方式的安全性较Post方式要差些，包含机密信息的话，建议用Post数据提交方式；2、在做数据查询时，建议用Get方式；而在做数据添加、修改或删除时，建议用Post方式；',NULL,2),
(25,'JSP的九大内置对象及作用分别是什么？','考察jsp九大域对象相关知识','1、HttpServletRequest的 request对象，作用：代表请求对象，用来接收客户端通过http协议连接传输到服务器端的数据；2、HttpServletResponse的response对象，作用：代表响应对象，用来向客户端发送数据；3、JspWriter的 out 对象，作用：主要用于向客户端发送数据。其中JspWriter是out的基类；4、HttpSession 的session 对象，作用：主要用于来分别保存每个用户的个人信息，与请求关联的对话。会话状态的维持是每个web应用开发者都必须面对的问题；5、ServletContext的application对象，作用：主要用于保存用户信息，代码片断的运行环境。它是一个共享的内置对象。即一个容器中多个用户共享一个application对象，故其保存的信息被所有的用户所共享；6、PageContext的PageContext对象，作用：管理网页的属性，为jsp页面包装页面的上下文，管理对属于jsp中特殊可见部分中已经命名对象的访问。它的创建和初始化的工作都是由容器来自动完成的；7、ServletConfig的Config对象，作用：代码片断配置对象，表示对servlet的配置；8、Object 的page（相当于this） 对象，作用：处理jsp网页，是object类的一个实例。即它也是jsp的本身，只有在jsp的页面范围之内它才是合法的；9、Exception，作用：处理jsp页面执行时，发生的错误和异常。','四大域对象：（1）pageContext page 域-指当前页面，在当前 jsp 页面有效，跳到其它页面失效；（2）request request 域-指一次请求范围内有效，从 http 请求到服务器处理结束，返回响应的整个过程。在这个过程中使用  forward（请求转发）方式跳转多个 jsp，在这些页面里你都可以使用这个变量；（3）session session 域-指当前会话有效范围，浏览器从打开到关闭过程中，转发、重定向均可以使用；（4）application context 域-指只能在同一个 web 中使用，服务器未关闭或者重启，数据就有效。',NULL,2),
(26,'servlet的生命周期及常用方法？','考察servlet生命周期相关知识，以及servlet的工作原理','Servlet生命周期，即阐述Servlet从产生到毁灭的整个过程。在Servlet产生到消亡的过程中，有三个生命周期函数，初始化方法init(),处理客户请求的方法service(),终止方法destroy()。1.init方法：在一个Servlet的生命周期中，init方法只会被执行一次，之后无论用户执行多少次请求，都不会在调用该方法。 2.service方法：当一个客户请求改Servlet时，实际的处理工作全部有service方法来完成，service方法用来处理客户端的请求，并生成格式化数据返回给客户端。  每一次请求服务器都会开启一个新的线程并执行一次service方法，service根据客户端的请求类型，调用doGet、doPost等方法。3.destroy方法：该方法在整个生命周期中，也是只会被调用一次，在Servlet对象被销毁是调用，在servlet中，我们可以做一些资源的释放等操作，执行destory方法之后的servlet对象，会等待jvm虚拟机的垃圾回收机制择时回收。4.doGet、doPost方法： 实际的业务处理流程，service根据客户端的请求类型来自动匹配需要执行那个方法。',NULL,NULL,2),
(27,'转发和重定向区别？','考察转发和重定向的定义和两者之间的区别和联系','重定向：服务器向浏览器发送一个302状态码以及一个location消息头，浏览器收到请求后会向重定向地址发出请求。==》response.sendRedirect( );转发：一个web组件将未完成的处理通过容器转交给另一个web组件继续完成。request.setAttribute(绑定名，绑定值)；request.getRequestDispatcher.forWard(request，response)。重定向和请求转发的区别：1、重定向是两次请求，转发是一次请求，因此转发的速度要快于重定向；2、重定向之后地址栏上的地址会发生变化，变化成第二次请求的地址，转发之后地址栏上的地址不会变化，还是第一次请求的地址；3、转发是服务器行为，重定向是客户端行为。重定向时浏览器上的网址改变 ,转发是浏览器上的网址不变；4、重定向是两次request，转发只有一次请求；5、重定向时的网址可以是任何网址，转发的网址必须是本站点的网址','不要仅仅为了把变量传到下一个页面而使用session作用域，那会无故增大变量的作用域，转发也许可以帮助你解决这个问题。重定向：以前的request中存放的变量全部失效，并进入一个新的request作用域。转发：以前的request中存放的变量不会失效，就像把两个页面拼到了一起。',NULL,2),
(28,'ajax书写方式及内部主要参数都有哪些','考察Jquery实现异步请求的相关知识','AJAX即“Asynchronous Javascript And XML”（异步JavaScript和XML），是指一种创建交互式网页应用的网页开发技术。通过在后台与服务器进行少量数据交换，AJAX 可以使网页实现异步更新。这意味着可以在不重新加载整个网页的情况下，对网页的某部分进行更新。传统的网页（不使用 AJAX）如果需要更新内容，必须重载整个网页页面。Ajax实现异步请求的三种方式：1.$.ajax( options );2.$.get(url, data, callback,type) ;3.$.post(url, data, callback, type)。其中几个主要参数分别有：1.url：要求为String类型的参数，（默认为当前地址）发送请求的页面。2.type：要求为String类型的参数，请求方式（post或get）默认为get。注意其他http请求方法，例如put和delete也可以使用，但仅部分浏览器支持。3.data：要求为Object或String类型的参数，发送到服务器的数据。4.dataType：要求为String类型的参数，预期服务器返回的数据类型。如果不指定，jQuery将自动根据HTTP包的mine信息返回responseXML或responseText，并作为回调函数参数传递。5.success:','ajax应用场景:第一、请求的提交是为了页面数据的显示，这时候用户一般不希望看到页面的刷新，是使用AJAX的一个最佳时候。第二、如果请求提交后，用户能从页面感觉到提交结果，这时候，也最好不要有页面刷新，推荐使用AJAX技术。第三、如果请求提交后，用户不能从页面感觉到提交动作，如绝大多数时候的数据的增加和修改，这时候则需要页面刷新，不能使用AJAX技术。第四、复杂的UI，以前对于复杂的C/S模式的UI，B/S模式一向采取逃避的方法，现在则可以放心大胆的使用AJAX来加以解决。常见问题解决：1、输入值校验的问题;2、级联显示的问题; 3、请求结果只改变部分页面 ;4、由于技术原因而使用iframe的问题;5、数据录入和列表显示在同一个页面;6、翻页问题',NULL,2),
(29,'Jquery常用选择器都有哪些？','考察Jquery中选择器的相关知识，以及其相对于传统的选择器比较有什么优势','一、基本选择器：基本选择器是jQuery中最常用也是最简单的选择器，它通过元素的id、class和标签名等来查找DOM元素。1、ID选择器 #id；2、类选择器 .class；3、元素选择器 element；4、* 匹配所有元素，返回元素集合；5、selector1，selector2,...,selectorN 将每个选择器匹配到的元素合并后一起返回，返回合并后的元素集合。二、层次选择器： 层次选择器通过DOM元素间的层次关系来获取元素，主要的层次关系包括父子、后代、相邻、兄弟关系。三、过滤选择器：① 简单过滤选择器：过滤选择器是根据某类过滤规则进行元素的匹配，书写时都以(:)开头；简单过滤选择器是过滤选择器中使用最广泛的一种。② 内容过滤选择器： 内容过滤选择器是根据元素中的文字内容或所包含的的子元素特征获取元素，其文字内容可以模糊或绝对匹配进行元素定位。过滤选择器是根据某类过滤规则进行元素的匹配，书写时都以(:)开头；简单过滤选择器是过滤选择器中使用最广泛的一种。③ 可见性过滤选择器：可见性过滤选择器根据元素是否可见的特征来获取元素。过滤选择器是根据某类过滤规则进行元素的匹配，书写时都以(:)开头；简单过滤选择器是过滤选择器中使用最广泛的一种。④ 属性过滤选择器；⑤ 子元素过滤选择器；⑥ 表单对象属性过滤选择器：此选择器主要是对所选择的表单元素进行过滤，例如选择被选中的下拉框，多选框等元素。四、表单选择器',' jQuery选择器的优势：、(1) 代码更简单；(2) 支持CSS1到CSS3选择器；(3) 完善的处理机制',NULL,2),
(30,'JSP Servlet的区别?jsp和servlet有哪些相同点和不同点，他们 之间的联系是什么？','考察JSP与Servlet相关知识，区别其两者之间的联系和不同之处','区别：1.jsp经编译后就变成了Servlet.(JSP的本质就是Servlet，JVM只能识别java的类，不能识别JSP的代码,Web容器将JSP的代码编译成JVM能够识别的java类)；2.jsp更擅长表现于页面显示,servlet更擅长于逻辑控制；3.Servlet中没有内置对象，Jsp中的内置对象都是必须通过HttpServletRequest对象，HttpServletResponse对象以及HttpServlet对象得到；4.Jsp是Servlet的一种简化，使用Jsp只需要完成程序员需要输出到客户端的内容，Jsp中的Java脚本如何镶嵌到一个类中，由Jsp容器完成。而Servlet则是个完整的Java类，这个类的Service方法用于生成对客户端的响应。联系：JSP是Servlet技术的扩展，本质上就是Servlet的简易方式。JSP编译后是“类servlet”。Servlet和JSP最主要的不同点在于，Servlet的应用逻辑是在Java文件中，并且完全从表示层中的HTML里分离开来。而JSP的情况是Java和HTML可以组合成一个扩展名为.jsp的文件。JSP侧重于视图，Servlet主要用于控制逻辑。',NULL,NULL,2),
(31,'拦截器和过滤器区别','考察拦截器和过滤器的概念和两者之间的区别','拦截器，在AOP（Aspect-Oriented Programming）中用于在某个方法或字段被访问之前，进行拦截然后在之前或之后加入某些操作。拦截是AOP的一种实现策略。过滤器是一个程序，它先于与之相关的servlet或JSP页面运行在服务器上。过滤器可附加到一个或多个servlet或JSP页面上，并且可以检查进入这些资源的请求信息。在这之后，过滤器可以作如下的选择：①以常规的方式调用资源（即，调用servlet或JSP页面）；②利用修改过的请求信息调用资源；③调用资源，但在发送响应到客户机前对其进行修改；④阻止该资源调用，代之以转到其他的资源，返回一个特定的状态代码或生成替换输出。区别：1 、拦截器是基于java的反射机制的，而过滤器是基于函数回调；2 、拦截器不依赖与servlet容器，过滤器依赖与servlet容器；3 、拦截器只能对action请求起作用，而过滤器则可以对几乎所有的请求起作用；4 、拦截器可以访问action上下文、值栈里的对象，而过滤器不能访问；5 、在action的生命周期中，拦截器可以多次被调用，而过滤器只能在容器初始化时被调用一次。',NULL,NULL,2),
(32,'一次完整的http请求是什么样的?','考察对HTTP相关知识的理解','一次完整的HTTP请求所经历的7个步骤：1.建立TCP连接；2.Web浏览器向Web服务器发送请求命令；3. Web浏览器发送请求头信息；4. Web服务器应答；5. Web服务器发送应答头信息；6. Web服务器向浏览器发送数据；7. Web服务器关闭TCP连接。','TCP三次握手：第一次握手，建立连接。客户端发送连接请求报文段，将SYN位置为1，Sequence Number为x；然后，客户端进入SYN_SEND状态，等待服务器的确认；第二次握手，服务器收到SYN报文段。服务器收到客户端的SYN报文段，需要对这个SYN报文段进行确认，设置Acknowledgment Number为x+1(Sequence Number+1)；同时，自己自己还要发送SYN请求信息，将SYN位置为1，Sequence Number为y；服务器端将上述所有信息放到一个报文段（即SYN+ACK报文段）中，一并发送给客户端，此时服务器进入SYN_RECV状态；第三次握手，客户端收到服务器的SYN+ACK报文段。然后将Acknowledgment Number设置为y+1，向服务器发送ACK报文段，这个报文段发送完毕以后，客户端和服务器端都进入ESTABLISHED状态，完成TCP三次握手。为什么要三次握手？为了防止已失效的连接请求报文段突然又传送到了服务端，因而产生错误。',NULL,2),
(33,'ajax提交请求 默认是 异步还是同步  怎么改成同步？','考察异步请求相关知识','Ajax请求默认的都是异步的，如果想同步 async设置为false就可以（默认是true），或者在全局设置Ajax属性 ，$.ajaxSetup({  async: false })，再用post，get就是同步的了',NULL,NULL,2),
(34,'你的项目中使用过那些JSTL标签？','考察JSTL标签的分类和一些常见的标签，主要用途','JSP标准标签库（JSTL）是一个JSP标签集合，它封装了JSP应用的通用核心功能。JSTL支持通用的、结构化的任务，比如迭代，条件判断，XML文档操作，国际化标签，SQL标签。 除了这些，它还提供了一个框架来使用集成JSTL的自定义标签。根据JSTL标签所提供的功能，可以将其分为5个类别：1.核心标签：包括<c:if>、<c:choose>、<c: when>、<c: otherwise>、<c:forEach>等，主要用于构造循环和分支结构以控制显示逻辑；2.格式化标签：<fmt:formatDate>、<fmt:parseDate>',NULL,NULL,2),
(35,'JSP常用的动作标签及作用','考察JSP动作标签的相关知识','Jsp动作标签，这些动作标签是JSP内置的，无需导入标签库，其他的标签都需要<%@taglib%>指令来导入标签库。常见的三个动态标签：1、<jsp:forward>用于请求转发，它与RequestDispatcher接口中的forward方法一样，唯一不同的就是在jsp页面中使用；2、<jsp:param> 用于页面传递数据，简单说，就是用于生成参数；3、<jsp:include>这个标签的作用与jsp中include指令功能是一样的，都是包含操作，只不过include标签为动态包含。','Jsp中静态包含(include指令)与动态包含(include标签)区别?静态包含包含的是内容，而动态包含包含的是结果。静态包含不可以传递参数 ,而动态包含可以传递参数',NULL,2),
(36,'JSP四大作用域及请求范围','考察JSP中四大作用的定义和作用域，以及其主要用用途','JSP四大作用域分别为：page， request ，session， application 。application作用域就是服务器启动到关闭的整段时间，在这个作用域内设置的信息可以被所有应用程序使用。application作用域上的信息传递是通过ServletContext实现的；session作用域比较容易理解，同一浏览器对服务器进行多次访问，在这多次访问之间传递信息，就是session作用域的体现。session是通过HttpSession接口实现的；request，他在当前请求中有效，request可以通过setAttribute()方法实现页面中的信息传递，也可以通过forward()方法进行页面间的跳转，需要注意的是request是转发不是重定向，转发相对于浏览器来说是透明的，也就是无论页面如何跳转，地址栏上显示的依旧是最初的地址；page，他只在当前页面有效，也就是用户请求的页面有效，当当前页面关闭或转到其他页面时，page对象将在响应回馈给客户端后释放。application：服务器启动到停止这段时间。session：HTTP会话开始到结束这段时间。request：HTTP请求开始到结束这段时间。page：当前页面从打开到关闭这段时间。',NULL,NULL,2),
(37,'如何防止表单重复提交问题','1.什么叫表单重复提交？2.什么情况下会出现表单重复提交？3.什么情况需要避免表单重复提交？','表单重复提交问题，说白了，就是同一份信息，重复的提交给服务器。以下情况会出现表达重复提交问题:1.点击F5刷新页面、2.重复点击提交按钮、3.前进后退操作、4.使用浏览器历史记录重复访问等。解决方案：1.js方法解决:关于js方法解决就是说通过js动态控制提交按钮不能多次点击，或者多次点击不起作用；2.设置HTTP报头，控制表单缓存，使得所控制的表单不缓存信息，这样用户就无法通过重复点击按钮去重复提交表单；3.通过PRG设计模式(用来防止F5刷新重复提交表单)；4.如果是注册或存入数据库的操作，可以通过在数据库中字段设立唯一标识来解决，这样在进行数据库插入操作时，因为每次插入的数据都相同，数据库会拒绝写入。这样也避免了向数据库中写入垃圾数据的情况，同时也解决了表单重复提交问题；5.session方法，在struts框架中防止表单重复提交的方法是生成Token存入session，以此判断表单是否是第一次提交。',NULL,NULL,2),
(38,'分别说出http,https,ftp,talnet的默认端口','考察常用传输协议的默认端口号','HTTP服务器，默认的端口号为80/tcp（木马Executor开放此端口）；HTTPS（securely transferring web pages）服务器，默认的端口号为443/tcp 443/udp；Telnet（不安全的文本传送），默认端口号为23/tcp（木马Tiny Telnet Server所开放的端口）；FTP，默认的端口号为21/tcp（木马Doly Trojan、Fore、Invisible FTP、WebEx、WinCrash和Blade Runner所开放的端口）；',NULL,NULL,2),
(39,'常见的http返回状态码（200,301，302,400）','考察http状态码的含义以及常见状态码所代表的含义','http状态码的核心作用是Web Server服务器用来告诉客户端，当前的网页请求发生了什么事，或者说当前Web服务器的响应状态。所以HTTP状态码常用来判断和分析当前Web服务器的运行状况。。常用的http状态码：2200   （成功）  服务器已成功处理了请求。 通常，这表示服务器提供了请求的网页；301   （永久移动）  请求的网页已永久移动到新位置。 服务器返回此响应（对 GET 或 HEAD 请求的响应）时，会自动将请求者转到新位置；302   （临时移动）  服务器目前从不同位置的网页响应请求，但请求者应继续使用原有位置来进行以后的请求；400   （错误请求） 服务器不理解请求的语法。','1开头 （请求已被接受，需要继续处理）这类响应是临时响应，只包含状态行和某些可选的响应头信息，并以空行结束。2开头 （请求成功）表示成功处理了请求的状态代码。3开头 （请求被重定向）表示要完成请求，需要进一步操作。 通常，这些状态代码用来重定向。4开头 （请求错误）这些状态代码表示请求可能出错，妨碍了服务器的处理。5开头（服务器错误）这些状态代码表示服务器在尝试处理请求时发生内部错误。 这些错误可能是服务器本身的错误，而不是请求出错。',NULL,2),
(40,'TCP和UDP区别，你对HTTP协议的理解','考察对TCP、UDP、HTTP的理解，以及具体应用场景','TCP与UDP基本区别：1.基于连接与无连接； 2.TCP要求系统资源较多，UDP较少；  3.UDP程序结构较简单 ；4.流模式（TCP）与数据报模式(UDP);  5.TCP保证数据正确性，UDP可能丢包 ；6.TCP保证数据顺序，UDP不保证 。TCP协议对应于传输层，而HTTP协议对应于应用层，从本质上来说，二者没有可比性。Http协议是建立在TCP协议基础之上的，当浏览器需要从服务器获取网页数据的时候，会发出一次Http请求。Http会通过TCP建立起一个到服务器的连接通道，当本次请求需要的数据完毕后，Http会立即将TCP连接断开，这个过程是很短的。所以Http连接是一种短连接，是一种无状态的连接。所谓的无状态，是指浏览器每次向服务器发起请求的时候，不是通过一个连接，而是每次都建立一个新的连接。如果是一个连接的话，服务器进程中就能保持住这个连接并且在内存中记住一些信息状态。而每次请求结束后，连接就关闭，相关的内容就释放了，所以记不住任何状态，成为无状态连接。',NULL,NULL,2),
(41,'json数据的格式是什么?','考察json的定义、格式、以及作用','通俗来说 就是把java对象转换为一个json的字符串，再到浏览器端把json的字符串转换为javascript的对象。也就是一个序列化和反序列化的过程。json是一种与语言无关的数据交换的格式。Json的作用，使用ajax进行前后台数据交换，移动端与服务端的数据交换。Json的两种格式：1）对象格式：{\"key1\":obj,\"key2\":obj,\"key3\":obj...}；2）数组/集合格式：[obj,obj,obj...]。',NULL,NULL,2),
(42,'xml的解析方式有哪些？','考察xml的解析方式，比较每种解析方式的优缺点。','XML是一种通用的数据交换格式,它的平台无关性、语言无关性、系统无关性、给数据集成与交互带来了极大的方便。XML在不同的语言环境中解析方式都是一样的,只不过实现的语法不同而已。XML的解析方式分为四种：1、DOM解析；2、SAX解析；3、JDOM解析；4、DOM4J解析。其中前两种属于基础方法，是官方提供的平台无关的解析方式；后两种属于扩展方法，它们是在基础的方法上扩展出来的，只适用于java平台。','一、DOM解析：优点：1、形成了树结构，有助于更好的理解、掌握，且代码容易编写；2、解析过程中，树结构保存在内存中，方便修改。缺点：1、由于文件是一次性读取，所以对内存的耗费比较大；2、如果XML文件比较大，容易影响解析性能且可能会造成内存溢出。二、SAX解析：优点：1、采用事件驱动模式，对内存耗费比较小；2、适用于只处理XML文件中的数据时。缺点：1、编码比较麻烦；2、很难同时访问XML文件中的多处不同数据。三、JDOM解析：特征：1、仅使用具体类，而不使用接口；2、API大量使用了Collections类。四、DOM4J解析：特征：1、JDOM的一种智能分支，它合并了许多超出基本XML文档表示的功能；2、它使用接口和抽象基本类方法；3、具有性能优异、灵活性好、功能强大和极端易用的特点；4、是一个开放源码的文件',NULL,2),
(43,'Spring 是如何管理事务的，事务管理机制？以及隔离级别？','考察spring的声明式事务管理的原理和事务的隔离级别相关知识','Spring的事务机制包括声明式事务和编程式事务。编程式事务管理：Spring推荐使用TransactionTemplate，实际开发中使用声明式事务较多。声明式事务管理：将我们从复杂的事务处理中解脱出来，获取连接，关闭连接、事务提交、回滚、异常处理等这些操作都不用我们处理了，Spring都会帮我们处理。声明式事务管理使用了AOP面向切面编程实现的，本质就是在目标方法执行前后进行拦截。在目标方法执行前加入或创建一个事务，在执行方法执行后，根据实际情况选择提交或是回滚事务。Spring事务管理主要包括3个接口，Spring的事务主要是由他们三个共同完成的。1）PlatformTransactionManager：事务管理器--主要用于平台相关事务的管理；2）TransactionDefinition：事务定义信息--用来定义事务相关的属性，给事务管理器PlatformTransactionManager使用；3）TransactionStatus：事务具体运行状态--事务管理过程中，每个时间点事务的状态信息。*事务的隔离级别：read uncommitted: 未提交读，会出现脏读问题，是最低的隔离级别；read committed:提交读，只有事务提交了，才能读取，避免脏读，但是一个事务中两次读取的一行数据不一致的问题，会出现，也就是会出现不可以重复读问题。大多数数据库默认的事务隔离级别；repeatedable read:重复读，就是事务开启了，执行读取操作，不允许对这行数据的修改操作，避免了不可重复读问题。但是仍会出现幻读问题，因为repeatedable read 是禁止了update操作，仍然可以insert；serializable：串行。一个事务一个事务，排队执行，隔离级别最高，不会出现幻读问题，但是性能低。','声明式事务的优缺点：优点，不需要在业务逻辑代码中编写事务相关代码，只需要在配置文件配置或使用注解（@Transaction），这种方式没有侵入性；缺点，声明式事务的最细粒度作用于方法上，如果像代码块也有事务需求，只能变通下，将代码块变为方法',NULL,3),
(44,'Spring AOP的实现原理？','考察AOP定义、具体实现原理、具体应用等相关知识','AOP的全称是Aspect Orient Programming，即面向切面编程。是对OOP（Object Orient Programming）的一种补充，战门用于处理一些具有横切性质的服务。常常用于日志输出、安全控制等。 Spring AOP采用的是动态代理，在运行期间对业务方法进行增强，所以不会生成新类，对于动态代理技术，Spring AOP提供了对JDK动态代理的支持以及CGLib的支持。 JDK动态代理只能为接口创建动态代理实例，而不能对类创建动态代理。需要获得被目标类的接口信息（应用Java的反射技术），生成一个实现了代理接口的动态代理类（字节码），再通过反射机制获得动态代理类的构造函数，利用构造函数生成动态代理类的实例对象，在调用具体方法前调用invokeHandler方法来处理。 CGLib动态代理需要依赖asm包，把被代理对象类的class文件加载进来，修改其字节码生成子类。但是Spring AOP基于注解配置的情况下，需要依赖于AspectJ包的标准注解，但是不需要额外的编译以及AspectJ的织入器，而基于XML配置不需要。','JDK动态代理只能对实现了接口的类生成代理，而不能针对类；CGLIB是针对类实现代理，主要是对指定的类生成一个子类，覆盖其中的方法（继承）。Spring在选择用JDK还是CGLiB的依据： (1)当Bean实现接口时，Spring就会用JDK的动态代理；(2)当Bean没有实现接口时，Spring使用CGlib是实现； (3)可以强制使用CGlib（在spring配置中加入<aop:aspectj-autoproxy proxy-target-class=\"true\"/>）。',NULL,3),
(45,'IOC和DI是什么？','考察IOC和DI的含义、实现原理以及具体作用','Ioc—Inversion of Control，即“控制反转”，不是什么技术，而是一种设计思想。在Java开发中，Ioc意味着将你设计好的对象交给容器控制，而不是传统的在你的对象内部直接控制。传统Java SE程序设计，我们直接在对象内部通过new进行创建对象，是程序主动去创建依赖对象；而IoC是有专门一个容器来创建这些对象，即由Ioc容器来控制对 象的创建；有反转就有正转，传统应用程序是由我们自己在对象中主动控制去直接获取依赖对象，也就是正转；而反转则是由容器来帮忙创建及注入依赖对象；IoC 不是一种技术，只是一种思想，一个重要的面向对象编程的法则，它能指导我们如何设计出松耦合、更优良的程序。DI—Dependency Injection，即“依赖注入”：组件之间依赖关系由容器在运行期决定，形象的说，即由容器动态的将某个依赖关系注入到组件之中。依赖注入的目的并非为软件系统带来更多功能，而是为了提升组件重用的频率，并为系统搭建一个灵活、可扩展的平台。通过依赖注入机制，我们只需要通过简单的配置，而无需任何代码就可指定目标需要的资源，完成自身的业务逻辑，而不需要关心具体的资源来自何处，由谁实现。IOC就是一种软件设计思想，DI是这种软件设计思想的一个实现。而Spring中的核心机制就是DI。',NULL,NULL,3),
(46,'Spring 中用到了那些设计模式？','考察对spring中所设计的设计模式的理解','1.工厂模式，这个很明显，在各种BeanFactory以及ApplicationContext创建中都用到了；2.模版模式，这个也很明显，在各种BeanFactory以及ApplicationContext实现中也都用到了；3.代理模式，在Aop实现中用到了JDK的动态代理；4.策略模式，第一个地方，加载资源文件的方式，使用了不同的方法，比如：ClassPathResourece，FileSystemResource，ServletContextResource，UrlResource但他们都有共同的借口Resource；第二个地方就是在Aop的实现中，采用了两种不同的方式，JDK动态代理和CGLIB代理；5.单例模式，这个比如在创建bean的时候；6.观察者，定义对象间的一种一对多的依赖关系，当一个对象的状态发生改变时，所有依赖于它的对象得到通知并自动更新；7.原型模式：使用原型模式创建对象比直接new一个对象在性能上好得多，因为Object类的clone()方法是一个native方法，它直接操作内存中的二进制流，特别是复制大对象时，性能的差别非常明显；8.迭代器模式：Iterable接口和Iterator接口 这两个都是迭代相关的接口，可以这么认为，实现了Iterable接口，则表示某个对象是可被迭代的；Iterator接口相当于是一个迭代器，实现了Iterator接口，等于具体定义了这个可被迭代的对象时如何进行迭代的','设计模式（Design Pattern）是一套被反复使用、多数人知晓的、经过分类的、代码设计经验的总结。使用设计模式的目的：为了代码可重用性、让代码更容易被他人理解、保证代码可靠性。 设计模式使代码编写真正工程化；设计模式是软件工程的基石脉络，如同大厦的结构一样。',NULL,3),
(47,'Spring中Bean的作用域有哪些？','考察Spring中Bean的作用域的相关知识','当通过spring容器创建一个Bean实例时，不仅可以完成Bean实例的实例化，还可以为Bean指定特定的作用域。Spring支持如下5种作用域：singleton：单例模式，在整个Spring IoC容器中，使用singleton定义的Bean将只有一个实例；prototype：原型模式，每次通过容器的getBean方法获取prototype定义的Bean时，都将产生一个新的Bean实例；request：对于每次HTTP请求，使用request定义的Bean都将产生一个新实例，即每次HTTP请求将会产生不同的Bean实例。只有在Web应用中使用Spring时，该作用域才有效；session：对于每次HTTP Session，使用session定义的Bean豆浆产生一个新实例。同样只有在Web应用中使用Spring时，该作用域才有效；globalsession：每个全局的HTTP Session，使用session定义的Bean都将产生一个新实例。典型情况下，仅在使用portlet context的时候有效。同样只有在Web应用中使用Spring时，该作用域才有效。',NULL,NULL,3),
(48,'spring框架实现实例化和依赖注入的方式分别是什么？','考察spring框架实现实例化的三种方式和依赖注入的三种方式的理解','Spring三种实例化bean的方式：第一种：使用构造器实例化Bean：这是最简单的方式，Spring IoC容器即能使用默认空构造器也能使用有参数构造器两种方式创建Bean；第二种：使用静态工厂方式实例化Bean，使用这种方式除了指定必须的class属性，还要指定factory-method属性来指定实例化Bean的方法，而且使用静态工厂方法也允许指定方法参数，spring IoC容器将调用此属性指定的方法来获取Bean；第三种：使用实例工厂方法实例化Bean，使用这种方式不能指定class属性，此时必须使用factory-bean属性来指定工厂Bean，factory-method属性指定实例化Bean的方法，而且使用实例工厂方法允许指定方法参数，方式和使用构造器方式一样。依赖注入的三种方式:构造方法注入（constructor injection）,构造方法注入，就是被注入对象可以通过在其构造方法中声明依赖对象的参数列表，让外部（通常是IOC容器）知道它需要哪些依赖对象;setter方法注入（setter injection）, 对于JavaBean对象来说，通常会通过setXXX()和getXXX()方法来访问对应属性。这些setXXX()方法统称为settter方法，getXXX()就成为getter方法。通过setter方法，可以更改相应的对象属性，通过getter方法，可以获得相应属性的状态。所以，当前对象只要为其依赖对象所对应的属性添加setter方法，就可以通过setter方法将相应的依赖对象设置到被注入对象中;接口注入（interface injection）,相对于前两种注入方式，接口注入没有那么简单明了。被注入对象如果想要IOC Service provider为其注入依赖对象，就必须实现某个接口。这个接口提供一个方法。用来为其注入依赖对象。IOC Service Provider最终通过这些接口来了解应该为被注入对象注入什么依赖对象.',NULL,NULL,3),
(49,'SpringMVC的工作流程?','考察SpringMVC工作流程','（1）客户端通过url发送请求；（2）核心控制器Dispatcher Servlet接收到请求，通过系统或自定义的映射器配置找到对应的handler，并将url映射的控制器controller返回给核心控制器；（3）通过核心控制器找到系统或默认的适配器；（4）由找到的适配器，调用实现对应接口的处理器，并将结果返回给适配器，结果中包含数据模型和视图对象，再由适配器返回给核心控制器；（5）核心控制器将获取的数据和视图结合的对象传递给视图解析器，获取解析得到的结果，并由视图解析器响应给核心控制器；（6）核心控制器将结果返回给客户端。',NULL,NULL,3),
(50,'spring以及springMVC常用注解有哪些？','考察spring和springMVC中常用的注解以及主要作用','一、Spring部分：1.声明bean的注解：@Component 组件，没有明确的角色；@Service 在业务逻辑层使用（service层）；@Repository 在数据访问层使用（dao层）；@Controller 在展现层使用，控制器的声明（C）。2.注入bean的注解：@Autowired。3.java配置类相关注解：@Configuration 声明当前类为配置类，相当于xml形式的Spring配置（类上）；@Bean 注解在方法上，声明当前方法的返回值为一个bean，替代xml中的方式（方法上）；@Configuration 声明当前类为配置类，其中内部组合了@Component注解，表明这个类是一个bean（类上）；@ComponentScan 用于对Component进行扫描，相当于xml中的（类上）。4.切面（AOP）相关注解：@Aspect 声明一个切面（类上） ，使用@After、@Before、@Around定义建言（advice），可直接将拦截规则（切点）作为参数；@PointCut 声明切点，在java配置类中使用@EnableAspectJAutoProxy注解开启Spring对AspectJ代理的支持（类上）。二、SpringMVC部分：@Controller 声明该类为SpringMVC中的Controller；@RequestMapping 用于映射Web请求，包括访问路径和参数（类或方法上）；@ResponseBody 支持将返回值放在response内，而不是一个页面，通常用户返回json数据（返回值旁或方法上）；@RequestBody 允许request的参数在request体中，而不是在直接连接在地址后面。（放在参数前）',NULL,NULL,3),
(51,'简单介绍下springMVC和struts2的区别有哪些?','考察springMVC和struts2相关知识，以及这两者之间的相同点和不同点，区别和联系','Struts2是一个基于web works的MVC框架，MVC是由Model(模型)、View(视图)、Controller(控制器)组成。相同点：二者都是基于mvc的web层的框架，都是负责接收用户浏览器提交的请求参数，通过某些校验操作调用业务层，而后获取到业务层返回的数据，将数据通过某种方式在前台展示。不同点：(1)springmvc是基于方法开发的，struts2是基于类开发的；(2)因为二者基于的出发点不同，所以在接收请求参数时区别比较大。springmvc是通过参数绑定接收浏览器请求参数（方法上各种形参(request、response、session、Model、ModelMap、简单类型、简单pojo、包装类pojo)浏览器的请求参数），方法执行结束，形参数据就会销毁。struts2是通过类中的成员变量接收浏览器请求参数的；(3)由于接收请求参数方式的不同。springmvc：因为方法之间是线程隔离的，所以springmvc支持单例和多例的开发方式。struts2：成员变量在开发中多线程会存在线程安全问题，所以struts2只能支持多例的开发方式；(4)springmvc是通过存储数据ModelAndView，在前台页面通过jstl(默认)展示数据的，struts2是通过值栈存储数据，在页面通过OGNL展示数据的。',NULL,NULL,3),
(52,'springmvc前端控制器是什么？处理器映射器是什么？','考察对SpringMVC的核心组件的理解和应用','spring MVC中的前端控制器就是DsipatcherServlet，DispatcherServlet其实就是一个Servlet，它继承了HttpServlet这个抽象类。为了使用它，你需要在你的web应用程序中的web.xml中配置。每一个DispatcherServlet都有自己的上下文环境（WebApplicationContext）,它继承了些上下文环境中的bean，而且可以根据条件自己重写。在web.xml中配置好DispatcherServlet后，容器启动时回去WEB-INF文件夹下去找（默认[servlet-name]-servlet.xml）dispatcherServlet-servlet.xml，解析文件初始化里面中的bean等。处理器映射器是指HandlerMapping，HandlerMapping接口负责根据request请求找到对应的Handler处理器即Interceptor拦截器，并将它们封装在HandlerExecutionChain对象中，返回给中央调度器。其常用的实现类有两种：1.BeanNameUrlHandlerMapping，2.SimpleUrlHandlerMapping。BeanNameUrlHandlerMapping处理器映射器，会根据请求的url与spring容器中所定义的处理器bean的name属性值进行匹配，从而在spring容器中找到处理器bean的实例SimpleUrlHandlerMapping处理器映射器，不仅可以将url与处理器的定义分离，还可以对url进行统一的映射管理。SimpleUrlHandlerMapping处理器映射器，会根据请求的url与Spring容器中定义的处理器映射器自标签的key属性进行匹配，匹配上后，再将该key的value值与处理器bean的id值进行匹配，从而在spring容器中找到处理器bean只需修改springmvc.xml文件即可',NULL,NULL,3),
(53,'springmvc如何进行参数绑定','考察SpringMVC中请求参数的绑定的方式','1. 请求参数的绑定说明：1）绑定机制：表单提交的数据都是k=v格式的 username=haha&password=123；SpringMVC的参数绑定过程是把表单提交的请求参数，作为控制器中方法的参数进行绑定的； 要求：提交表单的name和参数的名称是相同的。2） 支持的数据类型： 基本数据类型和字符串类型、实体类型（JavaBean）、 集合数据类型（List、map集合等）。2. 基本数据类型和字符串类型：提交表单的name和参数的名称是相同的；区分大小写。3. 实体类型（JavaBean）： 提交表单的name和JavaBean中的属性名称需要一致；如果一个JavaBean类中包含其他的引用类型，那么表单的name属性需要编写成：对象.属性 例如：address.name。4. 给集合属性数据封装： JSP页面编写方式：list[0].属性。5. 自定义类型转换器：表单提交的任何数据类型全部都是字符串类型，但是后台定义Integer类型，数据也可以封装上，说明Spring框架内部会默认进行数据类型转换；如果想自定义数据类型转换，可以实现Converter的接口。7. 在控制器中使用原生的ServletAPI对象， 只需要在控制器的方法参数定义HttpServletRequest和HttpServletResponse对象。',NULL,NULL,3),
(54,'springmvc获取表单数据的几种方式？','考察SpringMVC获取页面表单参数的方式','1、直接把表单的参数写在Controller相应的方法的形参中；2、通过HttpServletRequest接收；3、通过一个bean来接收：建立一个和表单参数对应的bean；通过这个bean来封装接收的参数；4、通过json 数据来接收参数；5、使用jQuery的serializeArray()方法序列化表单元素， 如果表单元素很多，手工拼装成Json数据很麻烦，可以使用JQuery提供的SerializeArray()方法序列化表单元素，返回Json数据结构数据。',NULL,NULL,3),
(55,'SSM架构的整合流程是怎样的？','考察ssm框架的整合流程的具体步骤','1. lib目录导入jar包；2. mybatis整合【1. 编写mybatis核心配置文件 sqlMapConfig.xml；2. 编写jdbc.properties 连接参数配置文件； 3. 编写 applicationContext-dao.xml（1. 导入 jdbc.properties;2. 配置连接池;3. 配置sqlSessionFactory; 4. dao接口扫描,用户创建dao代理对象）】;3. springmvc整合  【 1. 编写 Springmvc 核心配置文件 springmvc.xml（ 1. 配置 @Controller 注解扫描；2. 配置 映射器,适配器,用注解驱动替代  <!-- 配置处理器映射器 适配器 -->， <mvc:annotation-driven />；3. 配置视图解析器 InternalResourceViewResolver）；2. web.xml配置（ 1. 配置 前置处理器 DispatcherServlet； 2. post乱码处理:配置过滤器）】；4. spring配置【1. 服务器启动监听 ContextLoaderListener --->触发spring开启;2.要在监听器之前配置 全局参数:contextConfigLocation 指定Spring配置文件位置;】',NULL,NULL,3),
(56,'mybatis和hibernate之间的优缺点比较？','考察mybatis和hibernate两种持久层技术的理解以及两者之间优缺点的比较','mybatis：1. 入门简单，即学即用，提供了数据库查询的自动对象绑定功能，而且延续了很好的SQL使用经验，对于没有那么高的对象模型要求的项目来说，相当完美；2. 可以进行更为细致的SQL优化，可以减少查询字段；3. 缺点就是框架还是比较简陋，功能尚有缺失，虽然简化了数据绑定代码，但是整个底层数据库查询实际还是要自己写的，工作量也比较大，而且不太容易适应快速数据库修改；4. 二级缓存机制不佳。hibernate：1. 功能强大，数据库无关性好，O/R映射能力强，如果你对Hibernate相当精通，而且对Hibernate进行了适当的封装，那么你的项目整个持久层代码会相当简单，需要写的代码很少，开发速度很快，非常爽；2. 有更好的二级缓存机制，可以使用第三方缓存；3. 缺点就是学习门槛不低，要精通门槛更高，而且怎么设计O/R映射，在性能和对象模型之间如何权衡取得平衡，以及怎样用好Hibernate方面需要你的经验和能力都很强才行。',NULL,NULL,3),
(57,'MyBatis中使用#和$书写占位符有什么区别？','考察MyBatis中使用#和$书两者之间的区别，以及对于两者都是使用如何做到合适的取舍','1. #将传入的数据都当成一个字符串，会对自动传入的数据加一个双引号。如：order by #user_id#，如果传入的值是111,那么解析成sql时的值为order by \"111\", 如果传入的值是id，则解析成的sql为order by \"id\"；2. $将传入的数据直接显示生成在sql中。如：order by $user_id$，如果传入的值是111,那么解析成sql时的值为order by user_id,  如果传入的值是id，则解析成的sql为order by id；3. #方式能够很大程度防止sql注入；4.$方式无法防止Sql注入；5.$方式一般用于传入数据库对象，例如传入表名；6.一般能用#的就别用$.','MyBatis排序时使用order by 动态参数时需要注意，用$而不是#。字符串替换，默认情况下，使用#{}格式的语法会导致MyBatis创建预处理语句属性并以它为背景设置安全的值（比如?）。这样做很安全，很迅速也是首选做法，有时你只是想直接在SQL语句中插入一个不改变的字符串。比如，像ORDER BY，你可以这样来使用：',NULL,3),
(58,'MyBatis中的动态SQL是什么意思？','考察对MyBatis中的动态SQL的理解，以及所涉及到的常用标签的含义','传统jdbc方法中，在写组合的多表复杂sql语句时，需要去拼接sql语句，稍不注意少写一个空格或“”，就会导致报错。这个Mybatis动态sql的功能，就拥有有效的解决了这个问题，Mybatis动态sql语言可以被用在任意的sql语句映射中。Mybatis采用强大的功能基于OGNL的表达式消除其他元素。mybatis中的动态SQL主要包含如下几种元素：if、choose、when、set。if：非空验证 如id为空时，if标签里的代码，则不会执行。反之，就会if标签里的代码。choose：choose（when，otherwise）标签相当于switch（case，default），如title为空时，when标签里的代码，则不执行。默认会执行otherwise表签里的代码。set：set标签功能和where标签差不多，sql标签代表了sql中的关键字，set表签可以自动去除sql中多余的“，”。',NULL,NULL,3),
(59,'Mybatis中Mapper动态代理规范是什么？','考察Mybatis中Mapper动态代理的相关知识','采用Mapper动态代理方法只需要编写相应的Mapper接口（相当于Dao接口），那么Mybatis框架根据接口定义创建接口的动态代理对象，代理对象的方法体同Dao接口实现类方法。Mapper接口开发需要遵循以下规范：1、Mapper.xml文件中的namespace与mapper接口的全类名相同；2、Mapper接口方法名和Mapper.xml中定义的每个statement的id相同；3、Mapper接口方法的输入参数类型和mapper.xml中定义的每个sql 的parameterType的类型相同；4、Mapper接口方法的输出参数类型和mapper.xml中定义的每个sql的resultType的类型相同。',NULL,NULL,3),
(60,'mybatis的执行流程是什么？','考察mybatis在使用中的具体执行流程理解','1. 加载全局配置文件（mybatisConfig.xml），这个配置文件中通常是别名设置，拦截器的设置（当ssm整合后，环境配置与mapper映射文件的注册会转移到spring配置文件中）；2. xml全局配置文件会产生一个构建者类，叫做xmlConfigBuilder，这个类是用来通过xml配置文件来构建COnfiguration对象实例的，构建的过程就是解析（MBatistConfig.xml）配置文件  调用parse产生configuration对象；3. 随后产生的就是Mybatis的配置类，（configuration），这个类可以作为项目的全局配置对象，',NULL,NULL,3),
(61,'说说你比较熟悉的设计模式及应用场景？','考察对常用设计模式的理解和应用','1、单例模式：控制对象个数；2、装饰者模式：java的IO系统中使用了较多的装饰模式，主要用于给一个对象添加更多更好的功能，比如说给输入输出流添加缓冲；3、工厂模式：需要使用对象的时候使用工厂来创建对象；4、抽象工厂模式：可以创建多个系统的对象；5、适配器模式：在不同的系统之间做耦合的作用；6、建造者模式：将创建过程封装起来；7、观察者模式：当相应的事件发生的时候，通知注册了的对象，比如说ide的双击事件等',NULL,NULL,3),
(62,'动态代理 的2种方式以及区别？','考察两种动态代理模式的实现原理、区别和联系，以及各自的优缺点','简单来说：JDK动态代理只能对实现了接口的类生成代理，而不能针对类，CGLIB是针对类实现代理，主要是对指定的类生成一个子类，覆盖其中的方法（继承）。jdk动态代理是jdk原生就支持的一种代理方式，它的实现原理，就是通过让target类和代理类实现同一接口，代理类持有target对象，来达到方法拦截的作用，这样通过接口的方式有两个弊端，一个是必须保证target类有接口，第二个是如果想要对target类的方法进行代理拦截，那么就要保证这些方法都要在接口中声明，实现上略微有点限制。jdk动态代理是jdk原生就支持的一种代理方式，它的实现原理，就是通过让target类和代理类实现同一接口，代理类持有target对象，来达到方法拦截的作用，这样通过接口的方式有两个弊端，一个是必须保证target类有接口，第二个是如果想要对target类的方法进行代理拦截，那么就要保证这些方法都要在接口中声明，实现上略微有点限制',NULL,NULL,3);

/*Table structure for table `record` */

DROP TABLE IF EXISTS `record`;

CREATE TABLE `record` (
  `status` varchar(10) DEFAULT NULL,
  `id` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `record` */

insert  into `record`(`status`,`id`) values 
('completed',7);

/*Table structure for table `score_record` */

DROP TABLE IF EXISTS `score_record`;

CREATE TABLE `score_record` (
  `username` varchar(10) DEFAULT NULL,
  `grade` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `score_record` */

/*Table structure for table `sequence` */

DROP TABLE IF EXISTS `sequence`;

CREATE TABLE `sequence` (
  `id` int(3) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `score` double(5,2) DEFAULT NULL,
  `status` int(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sequence` */

insert  into `sequence`(`id`,`name`,`score`,`status`) values 
(1,'刘尧',100.00,1),
(2,'付光林',100.00,1),
(3,'王杰（new）',90.00,1),
(4,'刘黎明',-1.00,1),
(5,'冯婧睿',70.00,1),
(6,'向仕均',-1.00,1),
(7,'邓江伟',80.00,1),
(8,'任易',100.00,1),
(9,'王智',-1.00,1),
(10,'黄浩',-1.00,1),
(11,'李培林',-1.00,1),
(12,'程广',-1.00,1),
(13,'周鑫',-1.00,1),
(14,'沈泽',-1.00,1),
(15,'罗亮',-1.00,1),
(16,'张绍野',-1.00,1),
(17,'夏文鑫',-1.00,1),
(18,'邓静',-1.00,1),
(19,'张栋科',-1.00,1),
(20,'罗睿',-1.00,1),
(21,'王东',-1.00,1),
(22,'余伟',-1.00,1),
(23,'郑杭民',-1.00,1),
(24,'晏炜智',-1.00,1),
(25,'向超',-1.00,1),
(26,'张怀玉',-1.00,1),
(27,'杨凡',-1.00,1),
(28,'李靖宇',-1.00,1),
(29,'薛磊',-1.00,1),
(30,'罗宾',-1.00,1),
(31,'喻韬',-1.00,1),
(32,'徐玉挺',-1.00,1),
(33,'李鑫',-1.00,1),
(34,'杨杰',-1.00,1),
(35,'皮锐',-1.00,1),
(36,'彭鑫',-1.00,1),
(37,'吴添',-1.00,1),
(38,'刘耀靖',-1.00,1),
(39,'舒绪',-1.00,1),
(40,'李小斌',-1.00,1),
(41,'刘静',20.00,1),
(42,'宋毅',-1.00,1),
(43,'赵鹏',-1.00,1),
(44,'陈旋',-1.00,1),
(45,'伍柒',20.00,1),
(46,'李辉平',-1.00,1),
(47,'李建',-1.00,1),
(48,'王杰',-1.00,1),
(49,'卢经',-1.00,1),
(50,'邹蜜',-1.00,1),
(51,'周颖',-1.00,1),
(52,'曾德渝',-1.00,1),
(53,'谭川',-1.00,1),
(54,'丁红宇',-1.00,1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `username` varchar(10) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`username`,`name`,`password`) values 
('admin','管理员','cqheima'),
('zhangsan','123','12345678'),
('shadow','zx','11111111'),
('lplin','李培林','12345678'),
('tomtom','薛磊','12345678'),
('yanweizhi','晏炜智','000000000y'),
('fuguanglin','付光林','123456fgl'),
('tom123','你个大坏蛋','11111111'),
('chengguang','程广','chengguang'),
('tc12345','谭川','aa123465'),
('lujing','卢经','lujing018'),
('qwert','舒绪','12345678'),
('luoliang','罗亮','1qaz2wsx'),
('db231','周颖','zy147258369'),
('yangfan','杨凡','565386199'),
('faker','喻韬','qq956877022'),
('op753951','曾德渝','op753951'),
('ljy123','李靖宇','12345678'),
('Robin','罗宾','luobin1995'),
('pirui','皮锐','12345678'),
('yanjiang1','郭嘉','yanjiang1'),
('lijian','李建','lijian12'),
('zhm13','郑杭民','qwer1234'),
('lxb1234567','李小斌','1234567890'),
('djw12345','邓江伟','12345678'),
('qwer111','夏文鑫','xcx199499'),
('tkzchh','huanghao','huanghao'),
('moumouren','某某人','12345678'),
('wangwu','张三','12345678'),
('123456','邹蜜','123456789'),
('doublestar','吴添','star254968263'),
('liuliming','刘黎明','123456789'),
('wangzhi','王智','wangzhi123'),
('zhang','张绍野','12345678'),
('xiang','向超','12345678'),
('pengxin','彭鑫','12345678'),
('lihuiping','李辉平','lihuiping'),
('lj1127','刘静','5486lj177723'),
('yyyyyyyy','yy','yyyyyyyy'),
('zhangfei','你个大坏蛋','11111111'),
('tallyblue','冯婧睿','123456789'),
('liuyaojing','刘耀靖','12345678'),
('djw123','邓江伟','djw123456'),
('smarttally','冯婧睿','12345678'),
('kualiver','王杰1','password74260'),
('wq5757','57','QQqq5200'),
('hsiangpey','汤姆','XP758263818'),
('dengjing','邓静','123456789'),
('robin1995','罗宾','luobin1995'),
('liuyao1995','刘尧','l17941802Y'),
('fgl1991','付光林','fgl035248'),
('lxb0707','李小斌','lxb02750877'),
('zhangsan11','郭嘉','a11111111');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
