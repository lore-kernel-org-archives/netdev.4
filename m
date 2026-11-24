Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532562;
	b=vBcM6GPbmXqAkxfG6iee/7fPQdkxxFn9ep9gxXp95MLiaNpizk/EwdJ+fHmwadp8U9Wo
	 Vs7NuqxGNqbI1QGuhm+ZUUSGcS9/7PNQxmv/RDZXi2nXWwjuLS0utakkRjtcSBh4cpwTb
	 G6hOL20bwPpgy0Moj933XGymfU7c3SrkQqi14cAXZnynYfcrBrHXtdmHzGCT0PRKqEUjG
	 n9MGThWGeAcjjaAsVp3MuGvuGfYfKglbhfHxLYOdM6bZaH+Dk82Rpvf21N6+HfZ3Ke7tl
	 qTMpDzi0jcx+CfUH5qXEE92EReAN8CG8Pwv+NE1z+yv+FKJGmiP6z+ddY9LaRts2L+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532562;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ih9iFH4k5c5mFLYN9MmHm03X7lzR9NOg68oId4RPs2s=;
	b=GR4lCdh9gR/lch127CZReJRpiRrOtLyWmgAn7AG+htKObt3+e7P+de5NEn8yFZk0ZQ8p
	 LVobuWrmeKh6L/0Xm8nhu5JZ+ckKXm2ey5MwA7WIHNHr0ld4P4GsR+TNSNoHepTVcS0SB
	 1BLK82sYzWCPbiRgz1BVWQcpKLRAabc72u/ZN/ciCN0GpG/WzAGEaDYl3um2I6SrGp4pb
	 p9tkD93tciymKwG+uiSjQTavRpgQ+Spz9sFk65/APhI9Be1F0FSGXGRbhboqvLvGTWpHb
	 bgun2OqgZqctsO/JzE0XSvJWftQjUhbvApPLL0re9pMkyVslttjDILhSDnpt8cT6CSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="RlX4Jb1/";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tycqwjFR;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD7E606A329
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BD7E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RlX4Jb1/;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tycqwjFR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795532560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ih9iFH4k5c5mFLYN9MmHm03X7lzR9NOg68oId4RPs2s=;
	b=RlX4Jb1/97PVpz1E9QuukQ+l010K9dY+vnSGJyQnVSmaHmFKQaJ8h+6xtZ1f43L8O7TEh8
	gAinSxEQUtg6UKu/ZQy0vXLNmlzLIfxKnbqV8YDX1WWjsgpNn0lsBPCI5DtxRxkhZHKxix
	aP+O3zx6GGQT2X+TLFxCIFHZuvl3IMI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-x_-5toPYMrSqSfEUc9LFbA-1; Tue, 24 Nov 2026 15:02:37 +0000
X-MC-Unique: x_-5toPYMrSqSfEUc9LFbA-1
X-Mimecast-MFC-AGG-ID: x_-5toPYMrSqSfEUc9LFbA_1795532557
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4925ef75fc4so2882229f8f.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795532557; x=1796137357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ih9iFH4k5c5mFLYN9MmHm03X7lzR9NOg68oId4RPs2s=;
        b=tycqwjFR839qqlL51G7UyHfZEPtRHZ4srWw+dYx8z0eWV4xCeB9GoGvpcpG3zeh17O
         40O6H4MuaDdpn/u/ov+z4CHU0mqT9nNhkdt9DLVx0ej8oLQ365U5JzmzUxwiR4wCNu8c
         Nf8euUjlHAAygTo8xkaXp39dMz0fMrwj/K7kM96hGRwcCm2tVOXTW852N9hjjN/TbZ7z
         QQ5bMb09uAaynh3ddHr1G6A0zrurqW6lqqIVbM1O9Kt/RfeH1syq8DUVjVhNDgHPFyEg
         9y84Mpst7C3xP2WA9/U94YQhlKTs/6hIk7X8EtobCUajy/r/q9sDCdYoFuLI9mPmrrfq
         4uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795532557; x=1796137357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ih9iFH4k5c5mFLYN9MmHm03X7lzR9NOg68oId4RPs2s=;
        b=hNPDpwWXG2jra1z+LexnOafPIvadS9upiFfadyi1EelbtQAS47eburkrHRfJ0yzlUc
         vJLeMkSC8kNOBzf/l6pgh6ur+8SEP2yEh6K0Fq6fK6et5GO5fvHJ0eKlm9oc5z5WFplz
         knQ3yPnbSpAbbNGpA3N2USqKlL9vIRg89ebLGxxq/wJNQebc+GlH8Ms51JETwvIaFaxt
         WnZYt/75iwbEfZXJtmS8hHysXStSC0NO8DX7oaZrBJxw3KvzBQvPhXt838DYNrV/ni4l
         6OJLXM+m1oX7/rGeeeD4PA0gBZPjxAdJm3AkSqZgxw4cYxhpt/kpvvSVDHUn91OYJ0ff
         9gRQ==
X-Forwarded-Encrypted: i=1; AL+hErGylJwJkYnVN6YNdekFSYPzQeVJIZT8+RKRweJ6VuQKTeHpOMmQWnccLt707uzrgXVMj+epG/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wcuUXWdNtf28+vzIwRTntg55UEImf4I9t3AN1xcyptffc0ZOe
	8q6JYdbBI4P/RNXHV+r9i77xA0Wy2vPYWZJCeRYeScRCMbNQYAFKHfS0RZHa93xYm1KFwoWqOw1
	mz0NJW6KaNzTVeCj/Q6o5Y8tsnUvEIn5C2uCe8fyeFwLOXek4XD5uJEM3qA==
X-Gm-Gg: AZFdTZcj9IUGNHAcSNEpbZUV3txQXoXjkP6NnfhuguZw8qSiLQA84tSKtXPdWcOeXpT
	ASTcJkCEz8Nbgh95tsLD9EXzcZcjbUX3/QL5XOJ17MbAGkDfnMJapYBwDgFAD0tKFU+lHnMlQ05
	bfnlKDB4/iLUznOu2E5ss7iM76FaVmqO32eO3RsbBbXapTKJjkqwjbvkHllvXDNVBH9yyQ16GgM
	0Z3nqZg07OiHg4ayc8C3SgGh89TXKjbuA336o8sAl6ZLica9XrJ9vZ04HuL+4Yj4DKhcZrN4ZRP
	PGpbJBBC9paoB2K5OvC9vVQDeH/NNjuBlZrD2VVWpLo2OCQeqh4Uc0XdAVWVn2nnnsZj7D6wSVZ
	djtDoDap07RBUlzjty+85GjCkKWWihyQl7Z8JG0sO2ljthUnoFWBUD+QPcNQQU8ARpvwjJVAXB5
	hgJhfJ+IpTCOkdn1TQ7KvWEtd4bt2e9WQs04/fE2iTjgt0
X-Received: by 2002:a05:6000:4812:b0:48d:b650:69aa with SMTP id ffacd0b85a97d-4abb55185e4mr28569269f8f.50.1795532556506;
        Tue, 24 Nov 2026 07:02:36 -0800 (PST)
X-Received: by 2002:a05:6000:4812:b0:48d:b650:69aa with SMTP id ffacd0b85a97d-4abb55185e4mr28569192f8f.50.1795532555837;
        Tue, 24 Nov 2026 07:02:35 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab9cf005f2sm23387637f8f.45.2026.11.24.07.02.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 07:02:35 -0800 (PST)
Message-ID: <c6082ed0-cb7c-4e8b-83bf-a85aa3d43eac@redhat.com>
Date: Tue, 24 Nov 2026 16:02:33 +0100
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
Subject: Re: [PATCH net-next v3 1/2] net: sfp: add 2500base-X quirk for ODI
 DFP-34X-2C3
To: netdev-bot+sashiko@kernel.org, github@bumblecito.com
Cc: linux@armlinux.org.uk, andrew@lunn.ch, hkallweit1@gmail.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261118162323.436219-2-github@bumblecito.com>
 <179520946109.3135.2775052387986633073@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179520946109.3135.2775052387986633073@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/26 22:17, netdev-bot+sashiko@kernel.org wrote:
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
> - [Medium] The only test reported is a 2500 Mb/s link brought up after
>    speed and duplex were forced and autonegotiation was disabled by hand.
> - [Low] The patch adds SFP_QUIRK_S("ODI", "DFP-34X-2C3",
>    sfp_quirk_2500basex) to sfp_quirks[] in drivers/net/phy/sfp.c (lines…
> 
> --
> 
> net: sfp: add 2500base-X quirk for ODI DFP-34X-2C3
> 
> This commit adds an entry to sfp_quirks[] that applies
> sfp_quirk_2500basex to the ODI DFP-34X-2C3 XPON module. It was tested on
> a Horaco ZX-SWTGW2C8F switch, with speed and duplex forced and
> autonegotiation disabled.
> 
>> diff --git a/drivers/net/phy/sfp.c b/drivers/net/phy/sfp.c
>> index 915156743701b..960ac89cc2a0b 100644
>> --- a/drivers/net/phy/sfp.c
>> +++ b/drivers/net/phy/sfp.c
>> @@ -614,6 +614,9 @@ static const struct sfp_quirk sfp_quirks[] = {
>>   	SFP_QUIRK("Lantech", "8330-265D", sfp_quirk_2500basex,
>>   		  sfp_fixup_ignore_los),
>>   
>> +	// ODI DFP-34X-2C3 XPON stick can operate at 2500base-X
>> +	SFP_QUIRK_S("ODI", "DFP-34X-2C3", sfp_quirk_2500basex),
> 
> [Severity: Low]
> What does this module actually report in its EEPROM?
> 
> sfp_module_parse_support() in drivers/net/phy/sfp-bus.c can already turn
> on 2500base-X without a quirk in two cases. One is the FC speed bits
> with br_nominal >= 31. The other is the bit-rate fallback:
> 
> drivers/net/phy/sfp-bus.c:sfp_module_parse_support() {
>      ...
> 	if (linkmode_empty(modes) && br_nom) {
> 		...
> 		if (br_min <= 3200 && br_max >= 2500) {
> 			phylink_set(modes, 2500baseX_Full);
> 			__set_bit(PHY_INTERFACE_MODE_2500BASEX, interfaces);
> 		}
> 	}
>      ...
> }
> 
> So the quirk is only needed if the EEPROM falls outside both rules. A
> typical case is an xPON stick that reports 1000BASE-LX at about 1300MBd.
> 
> Most of the nearby xPON entries record this as "can operate at
> 2500base-X, but reports <X> in its EEPROM". Examples are Huawei MA5671A,
> Hisense LXT-010S-H, Hisense ZNID-GPON-2311NA, HSGQ, FS GPON-ONU-34-20BI
> and Alcatel G010SP. The OEM SFP-2.5G-BX10-D/U and LH03-B/LH20-A entries
> have no such comment, though.
> 
> Could the commit message and the table comment say what the module
> reports for nominal bit rate, BR min/max and compliance codes? The
> vendor name and PN strings would help too, for example from ethtool -m.
> The strings matter because sfp_lookup_quirk() needs an exact vendor/part
> match after trimming.
> 
> The later commit "net: sfp: sort OEM and Turris SFP quirks" does not
> change this entry.
> 
> [Severity: Medium]
> Does the link come up with this entry under the default phylink
> configuration?
> 
> The commit message says the link was established "with speed and duplex
> forced and autonegotiation disabled". sfp_quirk_2500basex() only adds
> the link mode and the interface:
> 
> static void sfp_quirk_2500basex(const struct sfp_eeprom_id *id,
> 				struct sfp_module_caps *caps)
> {
> 	linkmode_set_bit(ETHTOOL_LINK_MODE_2500baseX_Full_BIT,
> 			 caps->link_modes);
> 	__set_bit(PHY_INTERFACE_MODE_2500BASEX, caps->interfaces);
> }
> 
> It leaves the Autoneg bit that sfp_module_parse_support() always sets:
> 
> 	phylink_set(modes, Autoneg);
> 
> sfp_quirk_oem_2_5g(), by contrast, calls sfp_quirk_disable_autoneg().
> 
> With this entry, the default path looks like this:
> 
>    1. sfp_module_parse_support() sets Autoneg.
>    2. sfp_quirk_2500basex() adds 2500base-X and keeps Autoneg.
>    3. phylink_choose_sfp_interface() picks 2500base-X.
>    4. phylink_sfp_set_config() uses mode = MLO_AN_INBAND.
>    5. phylink_pcs_neg_mode() takes the Base-X without a PHY branch. When
>       the PCS reports no inband caps, or reports both enable and disable,
>       the advertised Autoneg bit selects in-band negotiation:
> 
> 		else if (linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
> 					   advertising))
> 			neg_mode = PHYLINK_PCS_NEG_INBAND_ENABLED;
> 
> Suppose the module's 2500base-X SerDes does not do clause 37 style
> in-band negotiation. On such hosts, would users need to run
> ethtool -s ... autoneg off to get a link after inserting the module?
> 
> Could the entry also disable autoneg? Alternatively, could the commit
> message confirm that the module links up with in-band AN enabled?
> Several accepted xPON entries also use sfp_quirk_2500basex with Autoneg
> left set, so this may be fine if the module does negotiate.

I think the above should be explicitly debated or addressed.

/P

