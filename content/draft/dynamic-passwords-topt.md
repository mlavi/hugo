---
tags: [''totp, '2FA']
draft: true
date: "2020-12-14T16:56:47-06:00"
title: "Why You Want Google Authenticator, but Don't Need It"
---
Two factor authentication is a relatively easy safeguard for your accounts, it has proven itself by protecting one of the largest software organizations in the world. In order to easily control your safety and privacy without resorting to cloud service providers, let's explore how to avoid outsourcing your concerns!<!--more-->

# Static Passwords

On the Internet, everyone in the world is one-click away, so distance no longer matters because #theworldisflat. When everyone can knock on every door and access every one of your accounts, all your passwords need to be regularly maintained. In my line of work, I can get a new account on a new system every week and if I am lucky, it will be part of our single-sign-on network to prevent the needs for yet another password to maintain. Normal people probably are asked to create a new account and password to remember a few times a year.

With very little exception, these passwords do not change, and they can be considered static passwords. Making all of your passwords strong, unique, and updated regularly for an exploding amount of accounts is daunting task for anyone these days. Combined with the automated, brute force methods of guessing weak passwords on all of your accounts around the clock, threats are constantly making last year's best practice slowly become insecure this year.

There needs to be a better solution than trying to keep all of your password written down somewhere safe, kept up to date, and without duplication or reuse of any of your other static passwords!

Well, there is a solution, but we'll discuss it later. Instead of solving that problem, many providers of your accounts and services are adding and sometimes requiring additional security checks to address the increasing security problem of static passwords.

# Dynamic Passwords

If you change your password regularly, it would be useful for a shorter time if a breach or disclosure happens between your changes. This is the idea for dynamic passwords, where password changes are required regularly.

At work, we must change our passwords every 6 months, which is not too bad because we're given a month's notice. Passwords must comply with some guidelines to insure some basic safety, but truthfully, the rules are to force a certain minimum amount of entropy.

- It turns out case doesn't matter, length does.

What if you were required to change your password and comply with  guidelines every month? every week? every day? every hour? At some point, you would adjust to a shorter period, but there would be a point of complete frustration and inconvenience. That is why dynamic passwords must include automation and the standard today is to change every 30 seconds!

# Time-based One Time Password authentication (TOTP RFC 6238)

OTP code (time based one-time-password) or HOTP (counter-based)
https://wiki.alpinelinux.org/wiki/Two_Factors_Authentication_With_OpenSSH
- https://github.com/google/google-authenticator-libpam
