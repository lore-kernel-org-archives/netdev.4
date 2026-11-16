Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855270;
	b=mtdu1NzlgrR7ZeWMBR+/u3za02ddo7JPEFoDz/QWQtB3Q1BJwMzVxyltcC/kTW8gFUtW
	 XgWHsUR01o/OxPyQNRDndDSqmYWPyJEFNHS118uweybnHhcVWr3slqd/7DqgapndxevKj
	 WBpxegeoGXvIp8r45WMkPWSvRT+kCXLAb7EDwdVjVUXOTWGreUv1WbYQJSg11OwQ95E2j
	 gZ/Y2j3KxdeiCBlz357/5Hr6yRISKpVilU+rMGApCgRH0cD0QgLHqwqCXZIvVHliH5yjX
	 fea9KrPKZ10+ONHv0votGiWGDKIQFZzBYqdn65+60rOONSuQH/1SOmaUbBFklnFdkUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855270;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=1GcEiI63ck6yvUndLiYdZXSeO/zZHcJWfPdvD4HbxEE=;
	b=mWnsqxDR6xgk2zcGpO7I3vd+sgLS0RLK6Op0Uvlmm824/CK3qi7++rWP9t6m2MgMPt+K
	 omUdNbFSMzH8KusU8z3fqk7/E3gw/rqy1tXvhH/Qo5vOyGBpwkjj0XYUw/4v735J/HTfI
	 +P/vcab22D2sdvDjl9H6jAltjLrPt/JNqZSFuxbJrAu9N5usK7FdIyDFniDPbGzjMmb9e
	 A5pjHE1EQIWmrbdXKYPzAIavHddGK2qk5qPMdCfSXMu2tfiHL/ux9rWRZDy7KjTf3X3xa
	 4H/eBWQexaU8nwfAnXqOWrd+6MKqadnPr+R29t5xvN8ggqcd8f8hj04pMEY+XuVVPsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CaQUDsaU;
	arc=none smtp.remote-ip=209.85.222.98
Received: from mail-ua1-f98.google.com (mail-ua1-f98.google.com [209.85.222.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E796C606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E796C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=CaQUDsaU
Received: by mail-ua1-f98.google.com with SMTP id a1e0cc1a2514c-99e145569c6so370513241.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:54:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855269; x=1795460069;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1GcEiI63ck6yvUndLiYdZXSeO/zZHcJWfPdvD4HbxEE=;
        b=M7y3K2RZE8KXV+CDS5ylNonQtRcssWivvtcUDRfFcILZfbLAQlxigUFgTnwT41yiaH
         6wC6Dqfdxq9g8ocvAjsTx9c1OLFuBLUm4MM/b/VZOv6+DDcgD2LJrgxIu39cMgd47W2m
         to30UbqDVfg3auq7DZptfREmRyTsVsv7fRACQeByEMUCfIG/7SBgHgWiY/MINug2eO5N
         tUmlYR1hUVeavI8QSFJi8wRYNxjhBbK3CcJW7EUwjb6VSeoXpGa4gFLMU0waZGJdm7Ku
         ZJNvZL58Nb5kSbvb5maCTc6JiDbkV5FAHsSb22UvMZIgZ6N+nRHQb83mpsLcPGkmyH4N
         H46g==
X-Gm-Message-State: APuU4Z/u6c2fE/Ey/g7pxOh8D8leOmrgamSRkM0Wsr2L0r+ZH+7byQUo
	wl9UumwoSeb+kF/oLg4PeW6bVpqbz6tSagVHx4HIt6aTVuyEIQfWsier0SBFD3msQtodk81Ax/0
	m8EW5jFzyn+341JXhpdSSeK6FLAW5hFNvH7+YlTmq/G99KGZLlBTxb72yG2B/Ei5Gx0nvS4uKSh
	g6mATzruLWmByTRZvqifqndCxwA1JUPQZgUxQZj5PRaikfTtx+U4O7f7QAd3MWAvDdcbs1F7Llc
	z5/zigIPmyDR4Yy
X-Gm-Gg: AYBFou2CftWvJY6VGsimOlVBvMDfO6zy34hk3B/KpDWVa1QcOs7IjeCOEg71CQahdNm
	95PC9mnpiQECdjfnVmZcj/4W926gUityTOP0xBDOcdeCFz5n6x/LGO+x6t+KBVicMiks56psI6E
	uQsgq8WzHuBbpwlJTLrhVdbVFhyek7r+NUGKWnD25wp3lW3jtFiXlQWM1AHlLGpVkowPp21L+ni
	qbrA0hizeF6Kg8Q/A1e4I19GAApJmxeU6bnJMaMndMnXp0Xer0oHAvZ7UpaFcJAlVpmNb4JnSTu
	4cBto4eTaBCVbiIqPNjiZmEy+XhjBeqNti5njtrPVIJ3IVV1flTl7YXfaEyKFZGFfrhp83n+5VI
	+22S7jY9BgOMKiPZ8pbSBnXz1TbDIaKeeVsmxKjx/e3KWW9SL3PpOER1Se5uOj83ouBrRnVGbP5
	+/pXF2mXNC26LJCnOZNlO/rQJn34xmLVOpvTDFjD2Q
X-Received: by 2002:a05:6102:3fa3:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7d64d6d6b49mr3155093137.9.1794855268685;
        Mon, 16 Nov 2026 10:54:28 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e3387e34asm60199241.11.2026.11.16.10.54.28
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 10:54:28 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94607500fb0so253170785a.2
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794855268; x=1795460068; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1GcEiI63ck6yvUndLiYdZXSeO/zZHcJWfPdvD4HbxEE=;
        b=CaQUDsaULcAggFKXJnWQnC3x6jJwSPsZxbSlkPpL7HXjsYccdXYQyU5EVpw3IYYusr
         7WoKggTbDotkNY4wAKAkEBw9tKHdMPMYS+ofmh7ZhNHR8OSCAXGtx+uLCmgZD1Mit7Ox
         dmEO+nYcLry/Ac5k9W+VQagnXaP95DDkt62Rk=
X-Received: by 2002:a05:620a:454a:b0:949:74d8:46fb with SMTP id af79cd13be357-94974d84ca8mr851101785a.41.1794855267915;
        Mon, 16 Nov 2026 10:54:27 -0800 (PST)
X-Received: by 2002:a05:620a:454a:b0:949:74d8:46fb with SMTP id af79cd13be357-94974d84ca8mr851096385a.41.1794855267248;
        Mon, 16 Nov 2026 10:54:27 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c803fb4sm899033785a.9.2026.11.16.10.54.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 10:54:26 -0800 (PST)
Message-ID: <3996fa8c-3346-40ff-8fa0-afa70262028b@broadcom.com>
Date: Mon, 16 Nov 2026 10:54:24 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: mdio: mdio-bcm-unimac: Add Clause 45
 support
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: netdev@vger.kernel.org, Carlos Soto <carlos.soto@broadcom.com>,
 Justin Chen <justin.chen@broadcom.com>, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
 Mlody12 mlody12 <kudzo51@gmail.com>
References: <20261113211554.2058181-1-florian.fainelli@broadcom.com>
 <20261113211554.2058181-4-florian.fainelli@broadcom.com>
 <7cb0d621e794378956b737530ebade24@tipi-net.de>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <7cb0d621e794378956b737530ebade24@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/15/26 10:59, Nicolai Buchwitz wrote:
> Hi Florian
> 
> On 13.11.2026 22:15, Florian Fainelli wrote:
>> Add Clause 45 read/write support to the UniMAC MDIO bus controller driver
>> by implementing the read_c45/write_c45 bus callbacks. Each access 
>> performs
>> the two-step C45 sequence (ADDR cycle followed by a READ/WRITE cycle) 
>> under
>> the bus lock and switches MDIO_CFG between C22 and C45 mode as needed;
>> MDIO_CFG is only written when the mode actually changes.
>>
>> Also skip the BMSR workaround read in unimac_mdio_reset() for children
>> compatible with "ethernet-phy-ieee802.3-c45", since such PHYs are not
>> expected to respond to C22 accesses.
>>
>> Note that providing read_c45/write_c45 also makes the MDIO core scan for
>> C45 PHYs at registration time, on addresses that are not masked and do 
>> not
>> already have a C22 device.
>>
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
>> Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
>> Co-developed-by: Justin Chen <justin.chen@broadcom.com>
>> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
>> ---
>>  drivers/net/mdio/mdio-bcm-unimac.c | 105 +++++++++++++++++++++++++++--
>>  1 file changed, 98 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/net/mdio/mdio-bcm-unimac.c b/drivers/net/mdio/ 
>> mdio-bcm-unimac.c
> 
>> [...]
> 
>> @@ -301,6 +390,8 @@ static int unimac_mdio_probe(struct 
>> platform_device *pdev)
>>      bus->parent = &pdev->dev;
>>      bus->read = unimac_mdio_read;
>>      bus->write = unimac_mdio_write;
>> +    bus->read_c45 = unimac_mdio_read_c45;
>> +    bus->write_c45 = unimac_mdio_write_c45;
> 
> AFAIU this breaks GENET without DT (e.g. Pi 4 with ACPI). Arguably an 
> edge case,
> but last time I tried it worked at least. With your changes all 
> addresses get
> a C45 scan there for which the empty ones return -EIO. get_phy_c45_ids() 
> passes
> that up instead of mapping it to -ENODEV like the C22 path.
> 
> A cheap fix would be to do the same mapping in get_phy_c45_ids() as we 
> have for C22.

OK, are we the only platform where that is happening? Alignment would 
make sense, and I don't assume we will be breaking someone's use case 
AFAICT.
-- 
Florian
