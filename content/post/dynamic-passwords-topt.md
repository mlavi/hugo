---
tags: ['totp', '2FA', 'passwords', 'security']
draft: true
date: "2020-12-14T16:56:47-06:00"
title: "Why You Want Google Authenticator, but Don't Need It"
---
Two factor authentication is a safeguard for your accounts and it has proven itself by protecting one of the largest software organizations in the world from breaches. In order to easily control your safety and privacy without resorting to cloud service providers, let's explore how to adopt dynamic passwords and avoid outsourcing your credentials!<!--more-->

# Static Password Problems

On the Internet, everyone in the world is one-click away, so distance no longer matters because #theworldisflat. When everyone can knock on every door and access every one of your accounts, all passwords need to be regularly maintained. In my line of work, I potentially get a new account on a new system every week. If I am lucky, that new system will be part of a corporate single-sign-on network to prevent the need for yet another password to maintain. When you consider the explosion of mobile phone applications and subscription services, I think it is a reasonable expectations that normal people probably are asked to create a new account and password to remember a few times a year.

We are lazy, security is hard, and with very little exception, all of these passwords do not change, so they can be considered static, unchanging passwords. The normal person does not maintain their password credentials unless forced by a provider's security breach or password expiration policy. Combined with the automated, brute force methods of guessing weak passwords on all of your accounts around the clock, threats are constantly making last year's best practice slowly become insecure this year.

When given some small reflection, our constantly expanding digital footprint is spread across more and more accounts. This means our security exposure and attack surface is also growing and the need for password maintenance becomes essential. Making all of your passwords strong, unique, and updated regularly for an exploding amount of accounts is daunting task for anyone.

There needs to be a better solution than trying to keep all of your password written down somewhere safe, kept up to date, and without duplication or reuse of any of your other static passwords! There is a solution for static passwords, but we'll discuss credential storage vaults later. Because password maintenance is a personal responsibility owned by customers, many service providers are adding and sometimes requiring additional security to address the increasing static password risks.

# Dynamic Password Challenges

If the goal is to change your password periodically, then the shorter the time period, the better. If an accidental password disclosure or provider's security breach happens between changes, then your account security exposure shortens to the time between password change updates. This is the idea behind dynamic passwords: password changes are required regularly.

You use multiple dynamic password every day, but they are hidden from you! When you login, you start a session and a new dynamic password is created for the session. The switch to the dynamic password for the session is automatic and invisible, it minimizes static password transmission and potential exposure to logins only. The session allows you access to protected resources and actions in your web browser, mobile app, laptop account, etc. When your dynamic password expires, you will see "your session has ended or timed out" message and you will be prompted to re-authenticate. By logging in again, you'll start a new session with a new dynamic password, typically called a session token or web browser cookie. For more detail, see: [TODO]

At my employer, the password policy is to change your primary corporate account password every six months, which is not too bad because we're given one month notice. Passwords must comply with guidelines to insure some safety, such as preventing reuse of older passwords which may have been disclosed, but the only important criteria for a new password is the minimum amount of entropy.

- Sidebar: [TODO] it turns out mixed case doesn't matter, length does.

How would you feel if you were required to change your password and comply with guidelines every month? What if required password changes happened every week, every day, or every hour? At some point, you would adjust to the shorter period, but eventually you would be arrive at a point of complete frustration and inconvenience.

## Dynamic Password Solutions

That is why dynamic passwords must include automation and the standard period today is 30 second changes!
[TODO] Google engineering 2FA token protection article proof.

# Time-based One Time Password authentication (TOTP RFC 6238)

OTP code (time based one-time-password) or HOTP (counter-based)
