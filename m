Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861457;
	b=i19f/dzCZVRWgCXbd8+k4mlHFKE3UVkwdIXK1hIStlLWI7ADEz7FAqD4jqXjza5rzMdu
	 js0QoSnGOBdsCmRU/mKJUGfZxTJ1liyLSJyCJ6UvPE49LSvT3EkGeZ68QB4Jw9i/bJF4y
	 lnlaGQw/TGAkjKARjEUToH4o38tYX+tQemEwgwRkzooYq8rs5nbT5xzQtwZeMh6sc83J5
	 vxXwQzsEgWsTjJRPeEtpOpb9b14wuHro5Qztc2uBfkPZ8Gmv+/UQyRqcn8s+OQddy0D+g
	 pPdQqoRVZSkg5UxHeO/e3SA63rYFA/xuKcVUu43LB4Vh1/jW6PqiLNb4FcFflELgEow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861457;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=HLMhkCYPHPrMsfIyKSVOSgdWXqLfs40zSzgqP9SY/BI=;
	b=QF0n7H8QWSYWBNNu2ZvlHj8PpLRAgLE0XEEnjo/gAjWNWvyhgq0yfRoKb0zb0XSW8dQq
	 ky9LGg+KiwVOWBLTJDwtyE/g60u9XSQlW6lIlbgzyb4tdGUvU04lAokVGBle8BM+fGnuC
	 xyjYj/us8LJ8oq+rTCnP2jL39ZCqIA9ehg7HLpmwzPsCJlkd3IwwYgdpVl50+fjmkSluR
	 R8v6fvqHJ8OavZFjyH/zaRTSlZlLtolq5uYgWwJSN/ZZ4zYYVixgDmG8fVaVD1QrRDsD4
	 ELw2iRQDtR2jIFJESidwBuujWYY4E43NhDrf8zu5ZFHtVElAdH/2eqHydL2KMZuRE4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YPRiHJIw;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CAD606A331
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01CAD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YPRiHJIw
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso2135528a91.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861456; x=1795466256;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HLMhkCYPHPrMsfIyKSVOSgdWXqLfs40zSzgqP9SY/BI=;
        b=t0yBOgNi5LS4HkjZgMZ8g2rWxZy9MK7M46pPNPk+qXvkdmO7DInTcFFWR6tTFzFHne
         86gnNP8sZvgC/zuXG3NyPrej1aZWFGFSkEEdePEgqBvsmkBscUlsdVJJAjdgjN01a18B
         uMaqpHyOKd/wj4zDUFsVLDuMI90IL7eIir9yNWgDoT1u/GaY57wXjyh/jqM0xtJqy5T1
         poKkpSjzu7fsY4hy9JOfy8WObHWJGpz7aJXmPJG8AxuvpIMN2DuyHWXaWwQd9QWt5Zx5
         mWDltQwkHwGP82ZgbgMpwv1CpXpQcU1JQ9KTTey4D094gubDRzL4oZoCubQrpjvg9vD0
         TUWw==
X-Gm-Message-State: APuU4Z/+LWCw1ALAuOJN3ARqijxfhk3mL5wfo9a0gAfrPiiLh2oO36HD
	Ji2ji+WKnDL3gUi+aBhNKJu1oNNYCbyZpDwnf2UmdzqMn5qBV0yqpdg32K6otJs9qC6f6fXJiMn
	idVXI/svlJLZWvPKQoR3R0ncAmM/F9qlAuN4T7LNTh0AS9U9MVoBynRXGhsOnIM8LjM0sm+AEqg
	cxG9PseVvZELHsf5GgAI/CKoByFUerDCymMLryLZPI5FLCJ/qmahA8nOhq1FloaCqWE6BQk42su
	OrzJjDiMryNuPcv
X-Gm-Gg: AZFdTZfMuOfM8MVyVOEY3gzke9casINTR465pc0ZjKx97zHAQHBmImeioerPPA5RFMw
	y0XnhtqCCZu/Ol16KfJWSasfuJxD7yVHF1CURMfVtV45uypXz1ZstfHehUS/ePuluAXvQz/ny7H
	dw+3IboJN6fQhTITjxIIizk0pHQjinKnG7A+zb/Z50Gupi5Gf99S/m0N7cE6wrD6rYxBaWKD9Id
	vXIsO85Arf52U8H0Sc5zH7AKijVxxax5eWmJ9rFXN9qLevSDrAo0smWTNYc18jdHDY77a3PZ7uL
	0TVoFfQ/C/klPGdHBzgmqJ7VkNgJ/b4rD6NmKA4zP9ekcNaWyCN7Zj7tsaEO7w6n7ZQtffm9VAP
	xBmQlLC155BAIC/O5jak2IoFGDUCblB2qhDtrGANmAYrOl9n7O1dRMjQBMu5tOd2pFXevwNy2dA
	LQi04TMEB+NOIK1q9a3IPM1N2kcXbyARD9oAtr0s+9
X-Received: by 2002:a17:90b:54cb:b0:3b1:832b:bb3d with SMTP id 98e67ed59e1d1-3b1b0ba66d9mr10485512a91.57.1794861456117;
        Mon, 16 Nov 2026 12:37:36 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abb84cacsm359063a91.1.2026.11.16.12.37.35
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:37:36 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5363fa3d3e4so76421661cf.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794861455; x=1795466255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HLMhkCYPHPrMsfIyKSVOSgdWXqLfs40zSzgqP9SY/BI=;
        b=YPRiHJIwqIsLktC73Fzl29mj+4Vj6oQoBdB6rTaERCD8ykX3j+ogXXeAN94W5jBLaT
         JCE6WLzcIMaZRct8WNXHcGyNW1KAy35nvIf6jOF3v2YDFPujsg4G23qHLHF+h1dOZtTJ
         KC40cRLAWNs2nbYFLDhjgMgkJTPJbS8H+mIjM=
X-Received: by 2002:ac8:5a0e:0:b0:535:a5fb:67fc with SMTP id d75a77b69052e-55ac9f61d43mr177777301cf.72.1794861454955;
        Mon, 16 Nov 2026 12:37:34 -0800 (PST)
X-Received: by 2002:ac8:5a0e:0:b0:535:a5fb:67fc with SMTP id d75a77b69052e-55ac9f61d43mr177776961cf.72.1794861454507;
        Mon, 16 Nov 2026 12:37:34 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55c3b7a4adbsm64637071cf.19.2026.11.16.12.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:37:33 -0800 (PST)
Message-ID: <ba66f497-78fc-4790-93fe-22ff0e44968f@broadcom.com>
Date: Mon, 16 Nov 2026 12:37:30 -0800
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
Subject: Re: [PATCH net v5 3/8] net: dsa: b53: clear stale state when creating
 an ARL entry
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, vivien.didelot@gmail.com,
 linux-kernel@vger.kernel.org
References: <20261112180202.324504-4-florian.fainelli@broadcom.com>
 <179485573753.3136.13658549628439256102@kernel.org>
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
In-Reply-To: <179485573753.3136.13658549628439256102@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/16/26 11:02, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In b53_arl_op() (drivers/net/dsa/b53/b53_common.c), the code
>    does not do what the commit message says about return values.
> 
> --
> 
> net: dsa: b53: clear stale state when creating an ARL entry
> 
> This patch clears the b53_arl_entry in b53_arl_op() before a new ARL
> entry is created, so a multicast add no longer ORs the port into the
> forwarding bitmap of an unrelated bin. It also returns early when
> deleting an entry that is not present, so stale bin contents are no
> longer written back.
> 
>> Deleting an entry which is not present now returns -ENOENT, including
>> when the lookup ran out of space (-ENOSPC), where it previously returned
>> 0 in that case.
> 
> [Severity: Medium]
> Is this paragraph accurate? The code below seems to keep returning 0 for
> a delete of an absent entry in both cases.
> 
> When the lookup misses, b53_arl_read() returns one of two values:
> 
> drivers/net/dsa/b53/b53_common.c:b53_arl_read() {
>      ...
> 	return *idx >= dev->num_arl_bins ? -ENOSPC : -ENOENT;
> }
> 
>> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
>> index 1f5776dfaae2e..dac6013f8fe29 100644
>> --- a/drivers/net/dsa/b53/b53_common.c
>> +++ b/drivers/net/dsa/b53/b53_common.c
>> @@ -2055,9 +2055,13 @@ static int b53_arl_op(struct b53_device *dev, int op, int port,
>>   			addr, vid);
>>   		return is_valid ? ret : 0;
> 
> The -ENOSPC case is not changed by this patch. With is_valid == false it
> still returns 0, not -ENOENT.
> 
>>   	case -ENOENT:
>> +		if (!is_valid)
>> +			return 0;
>> +
> 
> The new early return in the -ENOENT case also gives 0 for a delete.
> 
> Before this patch, the -ENOENT delete path fell through to
> b53_arl_write_entry() and returned b53_arl_rw_op(dev, 0), which is
> normally 0. So b53_fdb_del() and b53_mdb_del() get 0 for an absent entry
> both before and after this change. The real difference is that the stale
> bin is no longer written back.
> 
> Keeping 0 looks like the right behavior. b53_mdb_del() logs an error on
> any non-zero return:
> 
> drivers/net/dsa/b53/b53_common.c:b53_mdb_del() {
>      ...
> 	ret = b53_arl_op(priv, 0, port, mdb->addr, mdb->vid, false);
> 	mutex_unlock(&priv->arl_mutex);
> 	if (ret)
> 		dev_err(ds->dev, "failed to delete MDB entry\n");
>      ...
> }
> 
> Returning -ENOENT there would produce errors during normal teardown.
> 
> None of the later patches in the series touch b53_arl_op(), so the code
> is the same at the end of the series.
> 
> Could this paragraph be dropped, or reworded to describe the change the
> code actually makes? Or was a code change from an earlier version of the
> patch left out?
> 
>>   		/* We could not find a matching MAC, so reset to a new entry */
>>   		dev_dbg(dev->dev, "{%pM,%.4d} not found, using idx: %d\n",
>>   			addr, vid, idx);
>> +		memset(&ent, 0, sizeof(ent));
>>   		break;
> 
> [ ... ]
> 

The paragraph was left over from an earlier version, the code is correct 
and I will send a v6.

pw-bot: cr
-- 
Florian
