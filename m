Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201490;
	b=saQ/SXjoYoaT+NKdQZWtmxRtDkOdhgtdYLU/K8L55PbVUTCUwb5bDUrCIP2NDwwcu8IR
	 wfGMKEEoSbkszSldU8zv2NfCKm6HaECkcvEe01QLi69sUpukiXTmVYxfARiASyvDeqWit
	 MxbX7yKK/y+78m3MSAq0TZvh1KjhYRnjpMLf9qniqW597mlI5HPX7uuj9WXy+aeSkrnYh
	 oZEphkqgecR2NWyDwrRsQLh6+craskgCgcVMkltMh0Eke1W70juHTrfO9jtnNU/UQaICe
	 6H9QBoDOA2EeqVyZxPx1coG5032Huc0JkUYuNY6OIY9rwWA6PHEp+ZcRUC3A5G3FqOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201490;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=e8tx+aEQeIA2ywUDExvU1fOBJ1ZUFUsks4xrP3holok=;
	b=edbFo1+cJNVC5M99K/wpBGfSjrbDLwW2/xjXpGn4Z7Zu5vpqAlpBhZyH+Ov9MxVmEoTA
	 12aRanN7yLrEHnqT0LHcwcJpMKBWhfcBgGj3rl5xqs38cEWmT2dITHgPUW3H9ZgR960yM
	 R5U5vuBMQdG37WUrhqMIJ8PTqbBeCKnIsq/XQgAvecvSTk3i4cRti9/k6BAi8k2PTh5BQ
	 ohH9vu/keuM9SGq6rj/a6S5RLm7IQQ0qBGYszkJTzI432q1Z4WtKgtB9yOaNe0XYP8LED
	 1/bxvt4FXbVLb63MWT6wVVgND+SODoKOSWVPNXY0bNvwgW/WYr+n2dmp+xEY8q5A3gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bK8fVwWV;
	arc=none smtp.remote-ip=209.85.222.97
Received: from mail-ua1-f97.google.com (mail-ua1-f97.google.com [209.85.222.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD9F60A2637
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 19:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FD9F60A2637
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=bK8fVwWV
Received: by mail-ua1-f97.google.com with SMTP id a1e0cc1a2514c-98301b325c4so390760241.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201488; x=1795806288;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e8tx+aEQeIA2ywUDExvU1fOBJ1ZUFUsks4xrP3holok=;
        b=1/j/+VPHSzQ2c+cnhca3JYNi9O3hezXAdXbeJFkJkZCyxOmvxQRBqyudA/kUEmK0z1
         NTXO4cgtVbBpOhEMTa+NqMunJTYgiLv/8bZzlLJsjw2uDj/1vT/x+K8KFaO7Zs+MxpS/
         vcHjUnQC9ym7PTC7kPS0xfCp3y6du6QB8S+zpShCTRlmjruxCoC1stf87FDQ7pZgLqvL
         hd/4TqgZ6Agicw8OvcA3jw+ZMYVyZU4dILytwot9cgRnF7LZSXqUMljEqalEs72K5jGp
         mW3ZanfB5YR/SY4xPmpcfKiNhX8S+vas46+FoqhbHheaW2nUlKyaW0CYnJ4Ess1osCpX
         Fmig==
X-Gm-Message-State: APuU4Z9A4/GQ6CV2Q7V9shj24V5h8SUq6Fv0FzMf8Jtp4ueFt7niywHJ
	nyHgD3gwsppVtu46IEMqKvhhflLBRtJqymf64TrFKUgAXeGpcqB3r4JHlZnN9PqBDIzfZNMX1eR
	ipcrE0iIn1fe4RAamRvxgLnaBwHDMVSzFEZqqdLoTlhC6vaQCtswxr3jV7i+4FvwrxFY2MDpgXZ
	g9K0wIFp1ahElMDdgDIn/c+G/OxRNv5szKosDvqUw2mQV+96qu97vSmptylaG4SdZCAOLohpere
	cuLIzRyOUke6iQS
X-Gm-Gg: AZFdTZfiXl6uPE9/PG0z6IqAEppthcYQtldhqmCd/imjXxB8R/lPTCditDuwU9u74HZ
	rJOiQTPszuM6sVbWkkP1FPo/vmUPfmmU9MXtMUGcm4orc2bIh7f53qNuPkxJQeS6sGU08CDEnrE
	1mFmJi7T/m37/WdskgkuVssIPP7JZx86Fd9teLG+Apw+TrXRJQLbp0iVGNzEfznVMQy6DWpFUsV
	81TT7epr9MahVO5wTq8Btv9xVscTZ097NdfullYGf3moDxiu/YDZ/JjnQTq1egTRT2hiu/j4kQ5
	J36ZDQUIV943LIkAh/WP/mlq9B325uaXZiitxnGRhCgRfi2rkNS0EunkV2gKFDx1XTltJL1iaKW
	l2PxuvdOmJV/IA4dQWo7uCuI+cAZ6nQMjutMf5lhVh+P4vj8FwZEUC20skcSDmg2/j9JdwPWs5K
	63qoqZf2bdPv2a1aEfT+tYuqPvQ6163a9G1X/noQ43
X-Received: by 2002:a05:6122:208e:b0:5da:a74:d6a4 with SMTP id 71dfb90a1353d-5ee8af2581fmr2269358e0c.15.1795201487722;
        Fri, 20 Nov 2026 11:04:47 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e120c2esm401529241.10.2026.11.20.11.04.47
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:04:47 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so2467890eec.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 11:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795201486; x=1795806286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e8tx+aEQeIA2ywUDExvU1fOBJ1ZUFUsks4xrP3holok=;
        b=bK8fVwWVzTFs9Nq/ua6o6dlslXK+GEmF2zyVXsniG139r/Cah5JZkiANrYGr9Vk7iu
         6qk+3ebabuiMB+0RocdQWMVTr/sN2IqCYsRMRwx3fxClLwpAIdZEVJZZxbsSR0v344y2
         zlmn5hT8UQMUV0/4TdTc9Xa5Pt4tj06JfFyLQ=
X-Received: by 2002:a05:7301:dd94:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3856f559cfemr3485186eec.30.1795201486345;
        Fri, 20 Nov 2026 11:04:46 -0800 (PST)
X-Received: by 2002:a05:7301:dd94:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-3856f559cfemr3485155eec.30.1795201485670;
        Fri, 20 Nov 2026 11:04:45 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm11364080eec.28.2026.11.20.11.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 11:04:44 -0800 (PST)
Message-ID: <47288660-1e56-455f-9686-ee58146bb865@broadcom.com>
Date: Fri, 20 Nov 2026 11:04:43 -0800
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
Subject: Re: [PATCH net-next v4 1/4] net: phy: Map C45 probe read errors to
 -ENODEV during bus scan
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, opendmb@gmail.com, nb@tipi-net.de,
 bcm-kernel-feedback-list@broadcom.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 kudzo51@gmail.com
References: <20261119005943.999981-2-florian.fainelli@broadcom.com>
 <179515311013.3136.13885466048757926038@kernel.org>
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
In-Reply-To: <179515311013.3136.13885466048757926038@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/19/26 21:38, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The -EIO/-ENODEV -> -ENODEV mapping in get_phy_c45_ids()
>    (drivers/net/phy/phy_device.c) applies to every caller, not only…

Agreed. The commit message now says that get_phy_c45_ids() is reached 
through get_phy_device(bus, addr, true) and phy_get_c45_ids(). It lists 
the effect on the other callers: of_mdio logs the missing device and 
registers the bus without it, sfp ends up with "no PHY detected" after 
the usual retries, and gpy_probe() now gets -ENODEV, which the driver 
core treats as a silent match rejection. This matches what C22 callers 
already get from get_phy_c22_id().

> - [Low] The commit message gives the UniMAC MDIO block (MDIO_READ_FAIL)
>    as its example of a controller whose read_c45() reports an empty…

The commit message now says that mdio-bcm-unimac does not provide 
read_c45() yet and that it is enabled by "net: mdio: mdio-bcm-unimac: 
Add Clause 45 support" later in the series.

> - [Low] The patch rewrites the kernel-doc of get_phy_c45_ids() (lines
>    826-828) and of the exported phy_get_c45_ids() (lines 1107-1109).

That call is intentionally left unmapped. It only runs once a device has
  answered, and mapping a bus error there to -ENODEV would make a PHY 
that fails midway disappear silently instead of failing the probe. I 
chose the second option you suggested and reworded the kernel-doc of 
both get_phy_c45_ids() and phy_get_c45_ids() to say "or a negative error 
code from a failed bus access otherwise (usually -EIO)". The commit 
message also states that the vendor MMD presence check and the 
identifier reads are not mapped.

pw-bot: cr
-- 
Florian
