Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795122378;
	b=1kXfmKQuUKhlz7yNMZz+iagj6+UeySFk6H1An7lcGnXt3sbWEv1cVR71FTYW7EZ8Gjjl
	 JMw8PgcmJunzaEP9BMgDd9nT5fDOIWDFgzKwZmYHOGf/8B4kqHU5oLyNST1XmKqlVvWJB
	 ZHPTxiea+171V7xDxt9kAR/LD5qLo/ENZKUhjYN/anEY0zQtJdZCtJsgyPaONnKqOEQDf
	 u8yWkhSotm/30KS6IHZRwJ6K4DvM/Htg/JbCk3qX3t8mZ0HdTzIGNJ3YubTqVxu/bOVk+
	 xeh0vTzuE948zMmdLoKkjR2XX49XmDVpcOv9EeeR1wmDywgqaWolB+7t1W1VmWbOkxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795122378;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=bAoSv+tBU6/V56oBnUvlAkyUpRBXVs9TVLI9K886rME=;
	b=3tjwCC+AgqdreFU79S1466bFL6CBm9/8KkdDKoPaxsboqZk6l+/kv6NVYqlNWRcGfUi8
	 z1/HcU5GSajysuSUkhnkQpVvJa7faAxoucLYcQ9DLQs/wcmlfoAMCv8FpbJS2t0h2XFGo
	 4HFyscniVQs4uMFiaodR2c3c5pulwgCHpEn0h5tRBGbdXHVB9OoPbfAvrGIKc9e5mT/J0
	 z7xf0+r8j+Hu8EyJobX/RPe21BgYOAyupB/Y0naZgvuHZ5Io3WIvtnqBR71PY65rbXecL
	 zQGFWUzdzT6MYLRbDPkTb/Pa27E5HjTi9UM8Nx43v7wPxBbqrf7rkY9TtuFj0aWvcTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="Oua9v/l4";
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346CF606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 346CF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Oua9v/l4
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdb684859cbso117247a12.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:06:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795122377; x=1795727177;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bAoSv+tBU6/V56oBnUvlAkyUpRBXVs9TVLI9K886rME=;
        b=uyjyzh4uIKjam3qV9AcIT630aj6PRR7/GASTXs8cs7U5cyUn7BMBWREaay4fuMHrp1
         41b74jbnqw6Aup82C8ShkOZYKaQxQKYrsJLsHoV/xgV0epMCa/aNZOxVGongNrSyAZAy
         NC9dilPa1GUQ33i0TixnFhzkVAm7CZ+HQoz247a94Es5AZl5Ud2J3fGVPxTS5wDbersW
         TUWGjqx6fFHEfHgcgWbIqH+XnWLh0ByidgeGo/Mj1IJLGY90EtVLdAYcSqF1Y1r25wRF
         6h8j6urAN14SaN717nKwTtMrj058H6drux7pCZVOZhofZKFCKsS/36QhZzkaNakNAkN+
         2GrQ==
X-Forwarded-Encrypted: i=1; AL+hErH8Mkq8RIzS08j8TOpxioGxuLa97y1pSQ0Fgi6wo8bxTXrNiASs+Zx7Poji11AIVDRnDnTGHUg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n/IKeDpYTlZGCpRmsI7Ng4YDZK4U3tl3c/wotCjiXTqIJk/ut
	KjuHPjTAw6RsEIH5kIJ4Dy1xeDycrCD0NMjCFiEge3789NGou/51Ejzng+ZK83P957mV/NdWFrk
	RzDAGPBb7fKT6JY3RggL8XqLChWcIK8MZXtXNwlWNl9EhLIXbaJvy0HLKDMwtJ6GJMWnO1zcs6p
	nxUv2TmCUwnABJjv0+oTmN4Yo7ehR27h4gH2GuXsqNNQ8xzRlsq4nwkc6kg2Nuf63mNQPUnfZ2N
	7q2oK5n1iCo7yPa
X-Gm-Gg: AZFdTZc7DeyHA06U+SExY72lbQotyBg8UUCsHF/2wc6BD5hXrb/p32AflMfFiVr5/GT
	3RCGBzgatRo8xKeQixHU4/fP25DR+OT6IR87Zx54dvs+pRU2RIL7wesFtbTBQF7d3safJxgHb71
	n7rt3ytKfewi3u1AWgvUDqIlaFgqKodeVnpiep6U3deuxR1Ues4RbMnJPeKbdXpSUwEXuxWA2vn
	0r8IpKeohvjR080fefh2nw6Y/QX/F76SypkPNr2GtiWJxkCPqAJ7SiNHxEqwxYCpeOER4Ed93Fg
	irhVF4L0HVNeO3UjFySnIof7+V5b+sDjrsqDtaB7yJtJdpkPFEFNXgJBL9gnvXURO40gPTYMgnL
	1NFOhEbun377Rb1lZV10Rfw++SqJhH7uGQFKtNVAujoz1jHURJiVNzGS+eFVVCzvlWW+xtSP3oT
	x0YxxXkfnwefBcFVxzm5206JCTdiThgbaeg5onKxzC
X-Received: by 2002:a17:90b:388c:b0:3b3:c04e:4b74 with SMTP id 98e67ed59e1d1-3b41c9b2becmr533824a91.15.1795122377398;
        Thu, 19 Nov 2026 13:06:17 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062e6c29sm1789930a91.7.2026.11.19.13.06.14
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:06:17 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so207228eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795122374; x=1795727174; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bAoSv+tBU6/V56oBnUvlAkyUpRBXVs9TVLI9K886rME=;
        b=Oua9v/l4DzJjsr/BXrb5jn76kSpLn8EIktY5l7x/3HZPLSBef1Focw1ih1ir7C5BM9
         kLMlTXEMq22Av425MJll+A4bv1KXlpJ5mhgX1BqQQWYvuuv7xAmLyMx7M1jdH/nBQ2Tf
         0fS1BUkhHGB7UHfACHLDGG3eq0sJflvPW+FwE=
X-Forwarded-Encrypted: i=1; AL+hErGPr5Q34wlSGJ/GjCy22eRqMbDstSkCH3Lqu6kMB4Af+5RbXxDqMl7KRPwO4qMqgXl48TSRHq0=@vger.kernel.org
X-Received: by 2002:a05:693c:3f16:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-3856c5b52eemr520661eec.1.1795122373640;
        Thu, 19 Nov 2026 13:06:13 -0800 (PST)
X-Received: by 2002:a05:693c:3f16:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-3856c5b52eemr520614eec.1.1795122372514;
        Thu, 19 Nov 2026 13:06:12 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm1414862eec.5.2026.11.19.13.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 13:06:11 -0800 (PST)
Message-ID: <c4715b1f-c2cc-4b4f-8610-dd2e0ec71c45@broadcom.com>
Date: Thu, 19 Nov 2026 13:06:09 -0800
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
Subject: Re: [PATCH net-next] net: dsa: bcm_sf2: Use
 devm_clk_get_optional_enabled() in bcm_sf2_sw_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <d772ca26-d7f4-4857-9278-628b87e2252e@web.de>
 <92093067-f11e-4ce8-af0e-698644dc27ba@wanadoo.fr>
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
In-Reply-To: <92093067-f11e-4ce8-af0e-698644dc27ba@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/19/26 12:21, Christophe JAILLET wrote:
> Le 19/11/2026 à 17:37, Markus Elfring a écrit :
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Thu, 19 Nov 2026 17:30:09 +0100
>>
>> Reuse existing functionality from devm_clk_get_optional_enabled()
>> instead of keeping duplicate source code.
>>
>> The source code was transformed by using the Coccinelle software.
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>> ---
>>   drivers/net/dsa/bcm_sf2.c | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/drivers/net/dsa/bcm_sf2.c b/drivers/net/dsa/bcm_sf2.c
>> index 1747a1f20c78..011ce79392e8 100644
>> --- a/drivers/net/dsa/bcm_sf2.c
>> +++ b/drivers/net/dsa/bcm_sf2.c
>> @@ -1467,14 +1467,10 @@ static int bcm_sf2_sw_probe(struct 
>> platform_device *pdev)
>>           base++;
>>       }
>> -    priv->clk = devm_clk_get_optional(&pdev->dev, "sw_switch");
>> +    priv->clk = devm_clk_get_optional_enabled(&pdev->dev, "sw_switch");
>>       if (IS_ERR(priv->clk))
>>           return PTR_ERR(priv->clk);
>> -    ret = clk_prepare_enable(priv->clk);
>> -    if (ret)
>> -        return ret;
>> -
>>       priv->clk_mdiv = devm_clk_get_optional(&pdev->dev, 
>> "sw_switch_mdiv");
>>       if (IS_ERR(priv->clk_mdiv)) {
>>           ret = PTR_ERR(priv->clk_mdiv);
> 
> Hi,
> 
> NACK, this patch is wrong because the remove function and the error 
> handling path of the probe need to be updated.

My bad you are right this creates the following regressions: 
devm_clk_get_optional_enabled() registers a devres action that calls 
clk_disable_unprepare() on detach. The patch leaves the manual
clk_disable_unprepare(priv->clk) in two places in 
drivers/net/dsa/bcm_sf2.c: the probe error path (out_clk:) and 
bcm_sf2_sw_remove().

pw-bot: cr
-- 
Florian
