Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483854;
	b=kwJUOGm21fGYCoLWpbE0hUT/4IuyMlwU8tLrniTp417+uyNnpQuiUflHNH+4PAxLgzlV
	 u1weXsQBdwwtZN2XihquLBLovHF+NGHbfgyRWhHeZZYSxUWw3HmgR75yB3uJ/3ehnJ0UI
	 i3HmC3OLhPddMZiruR+BRV0mD09i8B6v/PhVbMsNnoXjSt06T/mo+BXu3lE3dpYuXBE+g
	 nlHvypJF0olTtVBchjA+cdEbfk0SAFPWtIuoLdFpYpQ73csd9vclLs7CJum29WJvAI+5w
	 yWHCBG3mv8y53BZfxcxMrPjUSdtO7+Uz/ma0xl3in37ot57KVVOCOOFsYfX9p/Iw0ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483854;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=uRAJYpbt0y9vhxeRJCzQmJFDBMkbju9GCV3kfKpg0Cs=;
	b=2AsAf75IXEIpKFOCd7OL7PDUH/nEbs7GibOGSIAk/HKEj7iIRMCppMJb1OB83gRWiSRo
	 WXR8qwkCbT0zc7ckOtfPjA6JnAxkEDnngVss1DSPA65taghxDPLAfsW139s0oHA+Kou/C
	 vnDKkpv0Or+9V7YXGLaVWq6TScwj+RUCirZC/YIyeD4HW+Emt49XXmWBR/meQYn+dFoMO
	 KEER1V83BoNKdvZnBXnRhOs0Ne6nYexmiypCKN3+vsOMBL0ylJpBjjmKgJ97wgciSPrHI
	 CtAKK0okV6FkxkjhOpRYbiceIq15OCMpqJK0ktznwtRmZdAmNiO/N13e5fAg6y8WSHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TdIWVRaP;
	arc=none smtp.remote-ip=74.125.82.226
Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F50606A68E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 01:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F50606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=TdIWVRaP
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-36a315ed211so4989807eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:30:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795483853; x=1796088653;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uRAJYpbt0y9vhxeRJCzQmJFDBMkbju9GCV3kfKpg0Cs=;
        b=0+pj06hC/eGznsBE44KU80Rl2Zpe+4i0iaOAM7/T0WSEVMn3dj/aPJswLl83MhqQYj
         nqUE5MUF3V6ytbCRlkf/PzJc464Dfs5xz28urQ/W/Zm5yLsaMZK/SaaOwMvlNjol4EjK
         4hImJSdVT5cRiSC7t5K7crCDLX9mTxO97nc1UCPJI9TlDoiQFNSbDqqFOzKbCHrbjHTM
         qi/vAqTzeG6cl2MYZGZ28tq6gmXLzoliHoSxRj3ZXbo5BhKoEWMpCbShFIURZuvWovBC
         p2fKxQbzVQb+7RTo1rVo+Z/KiiagDELf13Cts+34cZ3kj59dYTQjbWJC4UxcWr/x7wXu
         gggw==
X-Gm-Message-State: APuU4Z+aQzlCD7bwCaTHkStSD2dqRx7XH2rAUBkDjmcnb65TNyQPWR01
	L+DO4DWv9eEpFcbT24ZRuRIKDhRo1WpoGmkvHB+e0iLc4BOoTeqmNTtPVDY2/a+i06t4xvig+IV
	bFAm2xwWKevkN1wQl77xlLizfyBacc8jfx6jGf2hAHfXU/3ReeszKfA3HWVucb3K14hv9YVv7FB
	GObKnqJd8ajTRZqhpuMNBshDrQmijwITBe7jkwWTDxCiMNa+LfNcoilcqc5rtdIA8lprHMw8XdY
	s3ljPyTtyY5HZzx
X-Gm-Gg: AZFdTZfG83LK5I7qikkzAA96cEAM1MY6FQB3hx3v//I71nx4MjusDC+EG6I3c4rGjBT
	6ZGeSPtbuax8TCkD5UX1+zKw82AIgB32cBcU1ZZ5Yd/nBza0RFzIs9Ogy4+VlegJGD0kY5qtXAc
	g0nd2FpBJuMVeIFIYbxyxKI+cpoW0mM2IUUfUU/r6NNB04cnzJ+4WNcmI96kslhbv1rlS+/H9yt
	ARL+0iTeOKz9xKgMO7ZkqOr7u4Ycli2CnqLkucCErjE3EzlmdyybLXb36BfkuNcUWqXGFwbhL/S
	hyM/dO0kHM9oiAlXcIy6Da62qyK/h5NVzrcOuXd5Q/VTY87AS6+IUOzEj6K7VH1xxh2WgyBgQhz
	h+7xxPTmdUSEdbx9vv9kXlSLQTEyeLUA7g0+GsFQVgayN+gWZjlyOLZ8dYYpBt4HvdxTJ4htnDn
	lLuVcHW6TkHWoRftkL0ZF0yFu3sNGWrx8JqZzJ4ncV5PQ=
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr14754935eec.7.1795483852317;
        Mon, 23 Nov 2026 17:30:52 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385677c01dcsm1720618eec.20.2026.11.23.17.30.51
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2026 17:30:52 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so4387792eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795483850; x=1796088650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRAJYpbt0y9vhxeRJCzQmJFDBMkbju9GCV3kfKpg0Cs=;
        b=TdIWVRaPH2LcY7MXPXm5Cf5QsNiCNtivUxxcJXeiRJJKrG4MJ7mrI07UGFElxszsRB
         n6n/aSMALilWPFqOBHQ0EDA7rzvxBqtKEetRx2LblRzRF/EvPnU8ql0FQWs8rt+BpiqR
         m+AphIMFnib8xptlkNr1gESyZnT9bt3ZGyVI8=
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr11948538eec.18.1795483850295;
        Mon, 23 Nov 2026 17:30:50 -0800 (PST)
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr11948501eec.18.1795483849484;
        Mon, 23 Nov 2026 17:30:49 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm68971663eec.3.2026.11.23.17.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 17:30:48 -0800 (PST)
Message-ID: <94d6d8a3-b686-4916-ac18-60e7450a2017@broadcom.com>
Date: Mon, 23 Nov 2026 17:30:46 -0800
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
Subject: Re: [PATCH net v7 6/6] net: dsa: b53: fix mirror destination and
 source state tracking
To: Joseph Telaak <joseph@telaak.dev>
Cc: netdev@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, linux-kernel@vger.kernel.org
References: <20261119190348.2317702-1-florian.fainelli@broadcom.com>
 <20261119190348.2317702-7-florian.fainelli@broadcom.com>
 <20261124000849.25327-1-joseph@telaak.dev>
Content-Language: en-US
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
In-Reply-To: <20261124000849.25327-1-joseph@telaak.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/23/2026 4:08 PM, Joseph Telaak wrote:
> I tested this on a BCM53125 over SPI, with the series applied to v7.3.3,
> using skip_sw matchall mirred rules and the switch MIB counters:
> 
> - ingress and egress mirroring to one port work, and stop when the
>    rules are deleted
> - a rule for a second destination is refused
> - with two ingress filters on one source, deleting one keeps mirroring
>    and deleting both stops it
> - once all rules are gone, a different destination is accepted
> 
> Tested-by: Joseph Telaak <joseph@telaak.dev>

Thank you Joseph for testing!
-- 
Florian

