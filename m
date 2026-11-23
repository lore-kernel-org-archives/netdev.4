Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440277;
	b=MPb8Cu9AyXWB6NHxNOuUUvBgKFno5KOaKnAaEGTWsz7Y39U6BCrysQ6hRIqXrYHV1iJ6
	 +19GAdXUIBq9J2onUN48s+qhYAP3gp0KonT0FxcT8Yrl1wfVUrxwdp3454zSKQTnJ2MbX
	 LUPo7VyXyBnCNWgsBk7iyNcGmro5xC5qQv7HrBQ4cuj65iFcnAFikmyXNpMas13nbFx1C
	 HriARi1iIsD32RTDmpi/mEwaAIFMdNZgmpxip4qGkK6P5u1UNh/ZSQv/wDgJGMRUXadJY
	 q2R6jeNynT46mdWdEhXD9ubR/Yd6ELxl5KJ8eyPZxsqCXgJjadTGkVRRewnaF+Enz8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440277;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=oTTNKhcDuIn46gIcY42LpngctAWTR9fAWsQGYxr7PjU=;
	b=LHCjkxMfsPU7wRnRIv5sl+DBGMTd+9i8P4h9sqLpXyMX1eJx6r0D4enSkVdflXUlp3Vt
	 U141oKjmoNiEsnILeiu/owxWCkS3qiGPlInri21efWyZaC9sE6QjRS/2H8s8pVaCbqe+K
	 qCnrzA3lvVQZl1vjcwH3HH4Xelk9/wd1sBVRoyZFHMsHvuHEnHDlf25VZ64ba2AAbg7r5
	 0uK6jfh4zBlnOd839/IqcVELt90JUqPwaJYsMkSXQWqJrjb/CKOzxGMLyYmAXF5wbV7Ml
	 Ucyx2Q5DvxR2Q+rnga4uhPN2fTDp2oBhRreR+tNXI4DbKJZzJ891KS6fyMF70o4puMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ETTRC+TQ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C95606A31A;
	Mon, 23 Nov 2026 13:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C95606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ETTRC+TQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1A7864E41648;
	Mon, 23 Nov 2026 13:24:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E33FC601E1;
	Mon, 23 Nov 2026 13:24:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0CD4411E6A07F;
	Mon, 23 Nov 2026 14:24:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795440274; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=oTTNKhcDuIn46gIcY42LpngctAWTR9fAWsQGYxr7PjU=;
	b=ETTRC+TQZPmFHu4lHZT7cI4u9uhW/HwWQOFWbIN4DWzUdtbhoAf18mmCDnKfC3DVFWF7d5
	AEf4Vr/zCz7CBElLHgNkSe3+sf+1Oqqf3NkY2noD4YhALRNMZlQsDTDZTxnJN7nwaANIaJ
	3CDg0ZFlkwIv1lD6457FcI4HkBhNR0gvbwzAzQKLTMq5vRz1J6IiYMnpLrHC72+4QHFmYB
	gCmsuM4SbLPW6Wm0ZUI+5nhOL7fw8iJMMa/4ljhLn8cZho8t9yEu0C0Ts+ac3qJtJAwSOw
	cPBdxx4av02IZVPuzbkGltgaxUjMwML5HqKAWSrJ6h22BKjoaN/Hb1pVKJT9Ew==
Message-ID: <30533c91-65b0-446b-9937-7a9900549bd1@bootlin.com>
Date: Mon, 23 Nov 2026 14:24:29 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH net] net: pse-pd: tps23881: Fix reported power class
To: netdev-bot+sashiko@kernel.org
Cc: pabeni@redhat.com, o.rempel@pengutronix.de, kuba@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org
References: <20261119112511.239208-1-kory.maincent@bootlin.com>
 <179543375923.3135.13985748487135407652@kernel.org>
From: Kory Maincent <kory.maincent@bootlin.com>
Content-Language: en-US
In-Reply-To: <179543375923.3135.13985748487135407652@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/23/26 12:35, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 1 · Medium: 0 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [High] The new lookup table in tps23881_pi_get_pw_class()
>    (drivers/net/pse-pd/tps23881.c) maps four raw class codes to -ERANGE:…
> 
> --
> 
> net: pse-pd: tps23881: Fix reported power class
> 
> This commit adds a lookup table to tps23881_pi_get_pw_class() that
> translates the raw classification register value into the IEEE 802.3
> class number. Before this, the raw value was reported directly.
> 
>> diff --git a/drivers/net/pse-pd/tps23881.c b/drivers/net/pse-pd/tps23881.c
>> index 244ce596d845c..58ea7e0ffa996 100644
>> --- a/drivers/net/pse-pd/tps23881.c
>> +++ b/drivers/net/pse-pd/tps23881.c
>> @@ -402,6 +402,25 @@ tps23881_pi_get_chan_current(struct tps23881_priv *priv, u8 chan)
>>   	return (int)tmp_64;
>>   }
>>   
>> +static int tps23881_class_table[] = {
>> +	-ERANGE,
>> +	1,
>> +	2,
>> +	3,
>> +	4,
>> +	0,
>> +	0,
>> +	-ERANGE,
>> +	5,
>> +	6,
>> +	7,
>> +	8,
>> +	4,
>> +	5,
>> +	-ERANGE,
>> +	-ERANGE,
>> +};
>> +
> 
> [ ... ]
> 
>> @@ -416,7 +435,8 @@ static int tps23881_pi_get_pw_class(struct pse_controller_dev *pcdev,
>>   	if (ret < 0)
>>   		return ret;
>>   
>> -	return tps23881_calc_val(ret, chan, 4, 0x0f);
>> +	ret = tps23881_calc_val(ret, chan, 4, 0x0f);
>> +	return tps23881_class_table[ret];
> 
> [Severity: High]
> Will this make the whole PSE status query fail on a port with no
> classified PD?

Yes indeed.
> The error then goes back to userspace through this path:
> 
>    pse_prepare_data()
>      -> pse_get_pse_attributes()
>        -> pse_ethtool_get_status()
>          -> tps23881_pi_get_pw_class()  /* returns -ERANGE */
> 
> The admin state and power status, which were already read, are thrown
> away. Actual power, power limit and limit ranges are never read.
> 
> Before this patch, raw 0 set c33_pw_class to 0. pse_fill_reply() in
> net/ethtool/pse-pd.c then just left the attribute out:
> 
> 	if (st->c33_pw_class > 0 &&
> 	    nla_put_u32(skb, ETHTOOL_A_C33_PSE_PW_CLASS,
> 			st->c33_pw_class))

I am wondering about this. Class 0 is a valid class, it means 
classification is not implemented. Then on this case should we report it 
or not. A unknown class is kind of similar to a classification not 
implemented. I will change ERANGE value to 0.

-- 
Köry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

