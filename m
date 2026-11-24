Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545334;
	b=upEoaBLinKZfwZXuYJhBsA2gLfRyvDe5rSyn0amLhSaC0bG4xQA8Csd7mpOKTaHw2z65
	 dMDX2rsJlAcSU6GFLlB2XCuOK3wvfSUIvF1MGxIa7yv6zB0y2P5hFx93cAhgeKgiNZt19
	 p5IKinxSZ+7f1uUAqF3aTvMGHMexyQZ7KZQ8MbQgMx71ElNQDGbc1ZQVOPgWA2IgHoVp9
	 TbzlgfL+Scv8IQR6EBAeQz8bOgoJWQwcDTv+LZxA/x0WyDJPMt3kTUpSJmtK//gzCRZWO
	 KpkrGLwX+tNRfUFD98uK7iCz7lYYiLwaUsiT4yazaiHzvB5fELhEX8CRORGewk7sSyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545334;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Y0TFp2dmAnVbiSLgx1ekPegrqzqmAOaLT4jWECIME5s=;
	b=kSZZZFSkxtWvBNhJt07+meOhSwzeZ9yYvQeA2sWxG29H7ZZna709ZP023dhosjEPHEh4
	 ha+24JF/aicWcwucI9Hos7lEwfnGZas89AuD5w8BwFUVNqNaODL3W1/saRN75mSuAViwe
	 CiskuyviFiYm0iA6J7ZIsxY7pRK4A3qu5ZNo9px34XpNHCpKbWGBWUiYZm/Lu0667YNjf
	 WsTLzRFsVUyxgkXHPVB53G2pJfVFyajXqxAgF4xKGYN8fcIxhWQAS1hJF6t3qs+NTeswd
	 fJdTKgvAPPbWE+24WL0VzAQ8G1QzyJ/0+BOLL/pVlfaNAj3EL11K0tc+g2Ai+g1rOAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KALKw9Bm;
	arc=none smtp.remote-ip=74.125.82.227
Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6935606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:35:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6935606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KALKw9Bm
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-386bd881d39so2688701eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:35:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795545333; x=1796150133;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y0TFp2dmAnVbiSLgx1ekPegrqzqmAOaLT4jWECIME5s=;
        b=WVZ5CMWYiAXkvTylcyrAtLR44n9ewW6oFg/HFlz7cTzcsOAdTimo/tr78y7FJW5zzl
         6+IntO3tvoy+1/e1y55PV7hzl8XPemgppCZeres/ALo71hXkrhER7MB0to0PZYgTgt5d
         s1s7SotSulOSVr64ovvHn0DohIcJXBoHo7c0HeM/fgsgML7799rOpUlotC3AhYScC/6S
         X8n6rHqC3Nzpi/Z2+Wp9EhUyDTGOm4Z1yRoS28LPNBs9N66XJkBPmvzHj/dlo//PgeRK
         y3U7ANhaflcw4sSpitGvydgVrcifrpuxV+Z25v02Az94Xl6vIaDj9vSIvlsTUqM37dIm
         9u8A==
X-Gm-Message-State: APuU4Z8DIuGD1Vs/lj/Zh3MUrXctcbucgmTTJVGTibIUq0QZz0CKPp4V
	MnsgqyJpOJM9A6Mg/vebDVerAPlWhV9Xe/pOvujC7pRXg0FoN04ib0E5K4torlUq/zRH2TW5zyC
	+e8C0jQfqNe/PVbV0ULa0zHQXd1tF1xHwCvM5JQWCL4Te8AuXAD/I6zp4XqVMxt7t0pZFr0Fnok
	g51Nfou650eMkld73WFnQJ8aTEZkvVz1v+O/lInxULpZdrMmXOobB8nhmq4+1rK2H9inqICPsom
	zoIOMIlp7Lh+E8i
X-Gm-Gg: AZFdTZfBvbBXUF2qxH7YBshOJQAjBb9o56kExttQ8Ei/nVMgKdHzmIBxS52uxxFwjZS
	mRVKsimzLLGhQk8EJU3PUdnMbXcaBE1IkzbNs7bdjABjm3jZG0Rq0NhCfXLpip+knzSdWVRPFPd
	HGS+TxWc9ZGxcJzOJCr69MxTrrUfiGJ+eH8e/16a4VaAa8KwlJll0Vc33tyDDSn3ZmtF6OC01CK
	Hjb9JrHifYsDbmj165DLUoj77Y2P4SPmQIH0BIl/RjMHW21CZoEoxPil/whI/BLcCEOYRJCXM/W
	zdFwuZ6CWngOiitaOOwfJ7ADJCxSXsR8HB5Z2Kh8vxFtlPNeigtcEJ7WDe+dCK5oKLbnytTAlNM
	oqdR2VWAjWCHbSZv7j1qv1qr4y9MDrXNXUUD9d5ZNHe6PiMLXlaFZ53J9NV5vyCDpwjLAT50MXQ
	EN/uFXagqUPgPhdFLkKoku01jXTC28jvGJxkT65nbK
X-Received: by 2002:a05:7300:c695:b0:37f:73f9:aee7 with SMTP id 5a478bee46e88-3856c9a6408mr17398166eec.5.1795545332465;
        Tue, 24 Nov 2026 10:35:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385672cea3fsm2096645eec.14.2026.11.24.10.35.31
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:35:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38531c1a566so4446237eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795545331; x=1796150131; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y0TFp2dmAnVbiSLgx1ekPegrqzqmAOaLT4jWECIME5s=;
        b=KALKw9Bmu2xkkLM2a6fR127uHSKsLbVJ7cAZfeFKw13MzS0jo8XGL6hOphaliMl/vq
         +P4BPwqwyLPTB+kcyK1yZSbF5wi7m4Ec/gFrzk0Wqbh9VOL5oPTQRDczh5WzyyosMAZr
         tYeF7KdsTie+ABQKODaLnBeH8HluJT2qR1Owg=
X-Received: by 2002:a05:7300:bf27:b0:36d:3c0f:cc6f with SMTP id 5a478bee46e88-3856c9a7dd1mr18497134eec.3.1795545330449;
        Tue, 24 Nov 2026 10:35:30 -0800 (PST)
X-Received: by 2002:a05:7300:bf27:b0:36d:3c0f:cc6f with SMTP id 5a478bee46e88-3856c9a7dd1mr18497102eec.3.1795545329642;
        Tue, 24 Nov 2026 10:35:29 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm48741341eec.28.2026.11.24.10.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 10:35:29 -0800 (PST)
Message-ID: <188cf356-0757-4b4f-abf9-b12088046714@broadcom.com>
Date: Tue, 24 Nov 2026 10:35:26 -0800
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
Subject: Re: [PATCH net-next v6 4/4] net: mdio: mdio-bcm-unimac: Add Clause 45
 support
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, nb@tipi-net.de, carlos.soto@broadcom.com,
 justin.chen@broadcom.com, opendmb@gmail.com,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
References: <20261123164835.1733304-5-florian.fainelli@broadcom.com>
 <179553896749.3135.9852837290681703615@kernel.org>
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
In-Reply-To: <179553896749.3135.9852837290681703615@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 11/24/2026 8:49 AM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] On ACPI (non-DT) GENET systems, the new C45 scan can create a
>    phy_device that GENET then attaches to instead of the intended PHY.

No change planned. Providing read_c45/write_c45 unconditionally is the 
intended design and has been the same since v1; it is the only way to 
get Clause 45 support from the UniMAC block. The scenario requires 
something that answers C45 ID reads at an address below the real PHY. 
That is not the case on known boards, including the RPi4 BCM54213PE, and 
the C45 scan only runs on addresses that have no C22 device. Should a 
PHY ever ghost C45 frames, mdiobus_prevent_c45_scan() is the existing 
place to handle it.

> - [Low] Adding read_c45/write_c45 slows GENET probe on ACPI (non-DT)
>    systems by much more than the commit message says.

The commit message already documents the extra probe time on the 
unmasked non-DT GENET bus, and that it is the same trade-off the C22 
scan makes there. We do not plan to exclude that bus from the C45 scan.

Please do not flag this again in later revisions.
-- 
Florian

