Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795212079;
	b=2eVuRnrRDT//wsl0Tk5w2oCeW+iTC9fQbb35mtGJwSvv2UYdGYAwoBl//IQsiExZSb+6
	 qBnlf6bgNaOErGAqces8E74TUgjLS/+CBbEnEOSNnm/3WfM9wLZrlnP/FYwyhvrLCC0ix
	 b6tzpOPf/5rUHC4yklNl5sDgTRtJ1WaXNwx/ybCtszPigOseg/SMXJRfsGqhuLZnhxsyQ
	 rSs1RrYVST2j5oBIkxPkAg/mRrVfd5mBaQY2MTjnkB9kRAbOO1SmjMMSLNMXGVR1RHhur
	 HQLCXbA5ye950Lh5t0oa29b0zF8DvaPlgEohRzIt+/lYa3rV7BrZhQZvqgkQWLDYjRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795212079;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=kwLDrqnpiUw3OZLU2mtDF7v+FAlv1It0vWx0TeCrCQU=;
	b=pg6+Xhr5wLh5x9EYsylH3LroU7sCFKrRNFV2JxH8E6AxBNJbK95uMHk4OPgrlUhz+OOV
	 Z1T8z4g+D3e/UqIaL9C8W0TXl5Nu7QpFz2549BgzN7OpGRhMZF2tjYOlPnltnwHoLYfEU
	 toWaIbl7yzXhThGC/iZaBCTRUdUimN3Z8w5p7PuPMrLnkKDoOJkhzR0SPWNJQbOmq96AZ
	 PplnCWWWMuEl+qEYa1ja55OH+iBX7W36QUoGt9ae2gmbuhJdkbb0sqnfSpKaZVV762FRG
	 AEnFatB4zRRrRZhHhUL9wphdqxgLLhYT2zi54LM0ULEmWXjKAbH9QFuuB/R3Rqwb9ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WuYfnCTH;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60808606A69E
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 22:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60808606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WuYfnCTH
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b413d04c93so900363a91.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:01:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795212075; x=1795816875;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kwLDrqnpiUw3OZLU2mtDF7v+FAlv1It0vWx0TeCrCQU=;
        b=aOBFUnMWyebaYOWspixtbP9UYXr6X1pYzQphOCHKYj3A+qoYu8yBzm1U5R3Prl063n
         LufLHpmLoGKOnXFCY0s+7ZEBfJglFCksPHZdLjwlu11pRhax5xm+9Hv8OMCpqw9WKT/Y
         j1V1eyIrOstzxESK97iNXIdaBONh8wCIs4Jre9CCyn0sCICE4Wt/pxMd2mKJ+ZdRV/M5
         0AmgaRsUqoj0cUuxRdrx7k07jpuy/TxaEAMXUp6hVlWwu+sC5j4FkerEP4jELArn2NCC
         bNEIZhDP9P1wLiJCBousICSutDHkvBtXKVn6UTgkvHdX3bg6sxu1GFseLOSecdLripZE
         KzSA==
X-Gm-Message-State: APuU4Z8Qc48Jf/XJgzwWYd9oOKKnIaZMwgLWytiD6umKIuU6o9LrxK5f
	lFtWIa6/6sGJyi3MKP3bGF1g9TUliLmMvpQYk/4b4WtZTfSy7mPb71sLOYqEArVEoVKWobQhujP
	4d6sScj01Tgwf++83hiZxOeg6hdchDH1d/zf3DsS0dMExyv4Yxhp2X5K0+Jp0hrYjmGALj1mNzv
	ltDn1kAkK/NSyFu6FLwAzq5+wR1hiMcvSAKnuE1JDFGzhAXiCreH7qkp4PdzYeF1oU+vHfctzQq
	F1uVavsGbnkOLCZ
X-Gm-Gg: AZFdTZesZUmbGhViPyiMowBR3ubMtFJTdtxJGxidHdMdrd1nSI6y3b6QvE4Kxtikm4n
	Kd+7g1IJBkK6uYAhYdkfzGBrE14nDBdpoQ7P2Nj6knKdrMWmHtbBYCth7NIxShFwxteJwpXYyAT
	8a6ijVFC8+LrqE9zgIPwd3ucsZem1fvHXrHJcjF2Df7uUQYLcnXAknvtluDdjAUGx/bB2ijk4t1
	mG5d6HMUVJgBpvhqk+RUDaO3she7cRhfCSW62NlCUKMH+R5kYkOkRrBYJKDfxXfLH2/SRR7Ziob
	mK1a4c4Sxx0X1ImwPKMsJvW3RjVAVY3vcu1TZv3UWO0q4Rk904spE8pwvuL+AL73E55dPQCe4rj
	h30RiIlMoaaoIGXPrXFVwRTD2EaC89kwdlf4MkRysMvpGCVLLCxhxedIPJQCHEcFgF67cQ30/G+
	mF8VB+x8f2KmHqKNShsQvhCcvujSqiCpYqx2b5ovbTWAU=
X-Received: by 2002:a17:90a:e70c:b0:3a8:6045:5a19 with SMTP id 98e67ed59e1d1-3b41cafcc05mr4376016a91.37.1795212074639;
        Fri, 20 Nov 2026 14:01:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b42a5a2de9sm1718749a91.5.2026.11.20.14.01.14
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 14:01:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55c5cbc838aso35741951cf.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 14:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795212073; x=1795816873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kwLDrqnpiUw3OZLU2mtDF7v+FAlv1It0vWx0TeCrCQU=;
        b=WuYfnCTHazmUlGFiBAIrEaINk8ogvcQFNiSTJBSVOM14Qy4AvsAWR9RhGg4JaDArd+
         d502Gqa8B/4RF1VSLegtxGrSoWM/b16aTettU7gUKDYyDnQfca0TFOxOI98QwwqYOFnn
         +ogv8uCy2LKGNSz5xOW3HVuKnQs8hL44jGZ6Y=
X-Received: by 2002:a05:622a:1b0d:b0:55c:2cf5:350b with SMTP id d75a77b69052e-55d76a5899cmr82915601cf.31.1795212073434;
        Fri, 20 Nov 2026 14:01:13 -0800 (PST)
X-Received: by 2002:a05:622a:1b0d:b0:55c:2cf5:350b with SMTP id d75a77b69052e-55d76a5899cmr82914721cf.31.1795212072753;
        Fri, 20 Nov 2026 14:01:12 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb031617sm294067385a.1.2026.11.20.14.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 14:01:12 -0800 (PST)
Message-ID: <b3a4817a-d514-4c3c-840c-8104e6a447c0@broadcom.com>
Date: Fri, 20 Nov 2026 14:01:08 -0800
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
Subject: Re: [PATCH net-next v5 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45
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
References: <20261120194318.3952487-1-florian.fainelli@broadcom.com>
 <20261120194318.3952487-5-florian.fainelli@broadcom.com>
 <905c34c37a843cfc95f95e10b32f513e@tipi-net.de>
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
In-Reply-To: <905c34c37a843cfc95f95e10b32f513e@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/20/26 12:29, Nicolai Buchwitz wrote:
> On 20.11.2026 20:43, Florian Fainelli wrote:
>> Add Clause 45 read/write support to the UniMAC MDIO bus controller driver
>> by implementing the read_c45/write_c45 bus callbacks. Each access 
>> performs
>> the two-step C45 sequence (ADDR cycle followed by a READ/WRITE cycle) 
>> under
>> the bus lock and switches MDIO_CFG between C22 and C45 mode as needed;
>> MDIO_CFG is only written when the mode actually changes.
>>
>> Since MDIO_CFG also holds the clock divider, unimac_mdio_resume() now 
>> takes
>> the bus lock around unimac_mdio_clk_set() so that it cannot race with the
>> read-modify-write done by the accessors. Resume may therefore wait for an
>> MDIO access that is in flight.
>>
>> Some wait_func implementations (e.g.: bcmgenet_mii_wait()) return 0 even
>> when the controller is still busy. For C45 this would let the data cycle
>> or the next access's MDIO_CFG switch start while a frame is in flight, 
>> and
>> return the command bits instead of the read data. Check that the 
>> controller
>> is idle after every cycle, C22 ones included, and report a timeout 
>> instead.
>>
>> Also skip the BMSR workaround read in unimac_mdio_reset() for children
>> compatible with "ethernet-phy-ieee802.3-c45", since such PHYs are not
>> expected to respond to C22 accesses.
>>
>> Note that providing read_c45/write_c45 also makes the MDIO core scan for
>> C45 PHYs at registration time, on addresses that are not masked and do 
>> not
>> already have a C22 device. This is not the case when the bus is 
>> registered
>> from a Device Tree node, which masks all addresses.
>>
>> The platform device that GENET instantiates when it is probed without a
>> Device Tree node (e.g.: ACPI) does not mask any address, so it is scanned
>> too. Its wait_func is bcmgenet_mii_wait(), which sleeps for up to a 
>> timeout
>> per frame since GENET's interrupt is not registered yet when the bus is
>> registered. That makes the scan slower at probe time on such systems, the
>> same way the C22 scan already is.
>>
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
>> Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
>> Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>
>> Co-developed-by: Justin Chen <justin.chen@broadcom.com>
>> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
> 
> Forgot to mention: Your tag needs to go last (v3 had it right).
> You can keep my R-b as the changes are OK.

Indeed I did, thanks!

pw-bot: cr
-- 
Florian
