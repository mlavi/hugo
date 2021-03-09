---
tags: ['TOTP', '2FA', 'password', 'security']
date: "2020-12-14T16:56:47-06:00"
title: "Why You Want Google Authenticator, but Don't Need It"
---
Two factor authentication is an important safeguard for all of your accounts and it has proven itself by protecting one of the largest software engineering organizations in the world from breach. In order to easily control your safety and privacy without resorting to cloud service providers, let's explore how to adopt dynamic passwords and avoid outsourcing your credentials!<!--more-->

# Static Password Problems

On the Internet, everyone in the world is one-click away, so distance no longer matters because #theworldisflat. When everyone can knock on every door and access every one of your accounts, all passwords need to be regularly maintained. In my line of work, I potentially get a new account on a new system every week. If I am lucky, that new system will be part of a corporate single-sign-on network to prevent the need for yet another password to maintain. When you consider the explosion of mobile phone applications and subscription services, I think it is a reasonable expectations that normal people probably are asked to create a new account and password to remember a few times a year.

We are lazy, security is hard, and with very little exception, all of these passwords do not change, so they can be considered static, unchanging passwords. The normal person does not maintain their password credentials unless forced by a provider's security breach or password expiration policy. Combined with the automated, brute force methods of guessing weak passwords on all of your accounts around the clock, threats are constantly making last year's best practice slowly become insecure this year.

When given some small reflection, our constantly expanding digital footprint is spread across more and more accounts. This means our security attack surface and exposure and is also growing, so the need for password maintenance has become essential. Making all of your passwords strong, unique, and updated regularly for an exploding amount of accounts is daunting task for anyone.

At my employer, the policy is to change your primary corporate account password every six months, which is not too bad because we're given one month notice. Passwords must comply with guidelines to insure some safety, such as preventing reuse of older passwords which may have been disclosed, but the only important criteria for a new password is the minimum amount of entropy.

## Sidebar: Password Entropy

> Minimal static password security requirements vary greatly for use of mixed case, numbers, and non-alphanumeric characters. But their various, inconsistent rules for use does not increase security as much as password length does! So password phrases are increasingly being adopted for static password entropy.
>
> Please see the very instructive humor "Password Strength" from https://xkcd.com/936/
> I found some web implementations, each written in Node.js with open source licenses:
>
> - https://correcthorse.pw/
> - https://www.correcthorsebatterystaple.net/

There needs to be a better solution than trying to keep all of your password written down somewhere safe, kept up to date, and without duplication or reuse of any other static passwords! Because password maintenance is a personal responsibility owned by customers, many service providers are adding and increasingly requiring additional security to address static password risks.

## Sidebar: Static Password Solutions

> There are many solution for static password maintenance, I present a brief overview of [my personal journey and choice](/post/git-for-operators/#2020-04-19-securing-pets-in-git) for an off-line, static password storage vault.

# Two Factor Authentication and Dynamic Passwords

Adding a second password or security challenge compounds the problem for an attacker, but it also doubles the maintenance burden for the account owner. There are many approaches to incorporate [multi-factor authentication](https://en.wikipedia.org/wiki/Multi-factor_authentication), but we will focus on dynamic passwords. A dynamic password is also called [OTP: One-Time Password or a One-Time PIN](https://en.wikipedia.org/wiki/One-time_password).

Dynamic passwords were implemented by leading security vendors as proprietary hardware tokens and algorithms, but standardization for industry interoperability and growth began. [Hash-based Message Authentication Code (HMAC) One-Time Password (OTP), or HOPT](https://en.wikipedia.org/wiki/HMAC-based_One-Time_Password), was published in 2005 as IETF RFC 4226 open standard and extended to [Time-based One-Time Password (TOTP)](https://en.wikipedia.org/wiki/Time-based_One-time_Password_algorithm) in 2011 as RFC 6238. The largest benefit of OTP solutions is that they are simpler to implement, distribute, and train users to adopt when contrasted to the more complex, but more secure Public Key Infrastructure (PKI) solutions.

# Dynamic Password Challenges

If the goal is to change your password periodically, then the shorter the time period, the better to reduce exposure. If an accidental password disclosure or provider's security breach happens between changes, then your account security exposure shortens to the time between password change updates. This is the idea behind dynamic passwords: password changes are required regularly.

How would you feel if you were required to change your password and comply with minimum security guidelines every month? What if required password change was required every week, every day, or every hour? At some point, you would adjust to the shorter period, but eventually you would be arrive at a point of complete frustration and inconvenience.

That is why dynamic passwords, especially the TOTP standard, include automation and the standard period today is 30 second changes!

## Sidebar: Session Tokens and Cookies

> You may not be aware that you use multiple dynamic passwords every day, because they are hidden!
>
> When you login, you start a session and a new dynamic password is created for the session. The switch to use the dynamic password for the session is automatic and invisible, it minimizes static password transmission and potential exposure to login authentication only. The session uses the dynamic password to allow access to protected resources and actions in your web browser, mobile app, laptop account, etc. When your dynamic password expires, you will see "your session has ended or timed out" message and you will be prompted to re-authenticate. By logging in again, you'll start a new session with a new dynamic password, you can learn more about these dynamic passwords for authentication in different systems called a [session identification token](https://en.wikipedia.org/wiki/Session_ID) or a [web browser cookie](https://en.wikipedia.org/wiki/HTTP_cookie).

# Dynamic Password Solutions

Because of the open TOTP standard, there are many implementations to choose: from hardware tokens in your possession to software applications, often called a third party authenticator, which can run on your phone.

[Google Authenticator](https://en.wikipedia.org/wiki/Google_Authenticator) is probably the most widely known TOTP mobile solution on Android and iOS, it is easy to install and use, so many company IT security departments have begun to use it as well as customers using Google services.

In 2017, Google switched their employees from Google Authenticator application (a software TOTP) to hardware keys using a newer standard called U2F implemented in most web browsers today, in order to protect it's 85,000 employees from phishing attacks and [claimed it had succeeded for over a year in practice](https://krebsonsecurity.com/2018/07/google-security-keys-neutralized-employee-phishing/). Even though Google has progressed past TOTP, I am advocating for TOTP adoption as an optimal first step for many to improve their security posture.

However, many people do not realize there are many competing, compatible solutions to Google Authenticator (hence the title of this blog entry: I do not want anyone to think there is any exclusive or proprietary benefit to a TOTP application by Google when there is a market of potentially better and worse implementations, user interfaces, and features, but all must comply with the standard). The security benefits and relative ease of adoption have merited the rise of TOTP as it [spreads to more web sites and services](https://2fa.directory/), so look and ask for this security feature everywhere!

## TOTP Application List

- Meta-list: https://alternativeto.net/software/google-authenticator/
- Curated: https://www.nytimes.com/wirecutter/reviews/best-two-factor-authentication-app/
- *I personally like [andOTP](https://f-droid.org/en/packages/org.shadowice.flocke.andotp/) on Android*

## Making TOTP Portable (No Pets!)

As an operator, I constantly work to remove every single point of failure. One of my colleagues lamented his total dependency on Google because Google Authenticator was a single app with all of his TOTP dynamic passwords on his phone. The application could break during an update or his phone could be lost at any time, either would result in potential lock out or the inability to login to his accounts.

I sought how to solve this problem before I adopted TOTP and it is simple. During setup for a new dynamic password, TOTP depends on a pre-shared secret, which is a static password!

The password is a a short hex string (typically 16 characters), but for ease it is often displayed as a [QR code](https://en.wikipedia.org/wiki/QR_code) to prevent any human error in transmission. You may have to hunt for the hex string, decode the QR, or look for a fall back method during or after the QR code display to find the hex string.

Once you find it, it can be stored as a static password to allow reuse with different TOTP applications on multiple laptops, desktops, tablets, and phones.

> Since my choice of static password manager is cross platform, includes TOTP, and has many compatible web browser plug-ins, I'm already covered!

## Adopting TOTP for your Organization

The [real inspiration for this blog entry](https://github.com/authelia/authelia/issues/1145#issuecomment-744234967) is a wonderfully easy to use Single Sign On, Two Factor Authentication TOTP server called [Authelia](https://Authelia.com). I discovered it via the [LinuxServer.io](https://linuxserver.io) project which uses [Docker containers to deliver all open source services](https://en.wikipedia.org/wiki/Google_Authenticator). I've only started development with it, but I'm very impressed!
