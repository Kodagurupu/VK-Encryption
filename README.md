# VK-Encryption

## Prehistory
### In modern world there are many people who prefer security and anonymity. There are a lot of users in Russia who use VK and wants to get privacy in this messenger. Also, a lot of people asked me for making tool for solve this problem.
There are a lot of messengers which use encryption like Element, Telegram etc. But it’s hard to move from one messenger to another. Nobody wants to lose their status, friends, images etc.
After all I asked my friends and colleague for join to my team for create solution and now, we want to use native VK functions for providing users security.

## App concept
### First of all, our app will secure user messages from strangers who get access to user phone. This function will use AES encryption for store local user keys.
### Also, we want to protect users from MITM (Man in the middle) attacks. Attackers will see encrypted messages and nothing else. 
### The second is user security and anonymity. There are three ways to encrypt messages:
 *	Basic. We will store static key in application for encrypt messages using AES. Will be set by default and will change during app version.
 *	Advanced. There are RSA based algorithm for exchanging keys.
 *	Custom. Users can send custom password to each other’s. 
For a first release we won’t create support communities. It took some time in future. After doing this we will encrypt users’ content like images, docs, videos etc.
## App contents
There will be two parts of app. First there will be encryption algorithms:
 *	AES. This algorithm we will use for fast for storing users’ keys and encrypt user messages.
 *	 RSA. We will use this algorithm for connecting two users and send public and private key witch will be encrypted by public key of interlocutor.
GUI. There will be four pages in our app:
 *	Auth page. We will connect our app with user VK account. 
 *	Main page. There will be page which will provide access to user messages.
 *	Messages page. In this page user can send encrypted messages to his friends etc. who download similar app.
 *	Options page. There is page where you can configure our app:
 * *	Set password for app.
 * *	Choose encryption algorithm.
 * *	Exit from account
 
 # Realization
## GUI
Our app based on Flutter. Is simple framework which allows to create beautiful app in a short time. As I told before there are four pages in our app, and there are few main pages. I will start from login page.

### Login page
<img src="examples/login_page.png" width="250"/> 

As you can see there are plain login page with user authentication elements like: login, password and submit button.  
We don’t store users data. You can see it in code at your github.

After authentication user will be redirected to next page.

### Chats page  
<img src="examples/chats_page.png" width="250"/>

There are page which contains users who wrote to current VK account. It's list with account image, name and last message.  
Also there are a menu button which provides functions for delete encrypted messages, hide or mute user.
<div></div>



### Messages page
<img src="examples/message_page.png" width="250"/>

There are messages page. Our app will automatically decrypt messages and show it to user. In basic version you can just send and read messages.

Also there are app bar with user name and last seen time.





### Options page
<img src="examples/options_page.png" width="250"/>

There page where you can choose encryption methods, select app language, theme and exit from account.
