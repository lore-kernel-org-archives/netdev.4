Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643750;
	b=gTfuKK/iGepKwaXh+65EWWZxpSJUMVHKfSLhgGAgIqIUFoNcrS0LUdS/6Mv/RBqTbqmx
	 Xvf8WOg1qvqulS6bE3bwWA1CBH82GCbIBRPvWXyTU7AIc/UTdSfMxnzcja42lQIf+JTHq
	 3IpjyQ+Dmji670YzHNV3gOIBjjOmVrHqPvF4+7DYUHJeMaJrZr+/H2pCQlXUnG6Vyfzjm
	 e2J9DfT1/N9VWsrxu7KvyKErl5IQfn+B/6cHSoG0feKT64T9uK0haYnTOL/dH08SIOALU
	 5NZV7E02TTJA8ZFZxEaFCU2bOMJ16EoL0zE5QDfpJD8oGtcnjtr+alCoYZNKK1BQHsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Transfer-Encoding:MIME-Version:Content-Type;
	bh=r/GY1L0M/Jj/tnpXLztwrdoGc8kg+51R6Plf4ICZ1dQ=;
	b=HWJFuRqCOzl4br6m6FsOQ4513uO3OcZu3pE8XFY/+VGgwQH7g0F8rXzw9I664Yoqhmd3
	 Z6wnH0jgjxKxl6J2AYinoFSxSmBzkrJlI4u1Hrrtoi+hHuY8YHmkhgT5lR9AdTCMEC+js
	 683XSXBWVHiFUyxgH5MZO4kFfGOQMSYbwS7kizgX88DQpNaiJlfSU7aeXy6rki+qiXieZ
	 1xdFcbpK2nn4tfsBHmUaGDF3CpUl7XHhzX8uEn5wsXmKMUwSupi2V2qxYSReoXrfQxBZD
	 iYQemZpf5Ra/f900gtU9EYylHean0TtDNakiTX202ote+dzM9tJvjynXPazncGPb8BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R9/rbOd1";
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E3F606A326
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 21:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E3F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R9/rbOd1
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so3704160f8f.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 13:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643748; x=1796248548; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/GY1L0M/Jj/tnpXLztwrdoGc8kg+51R6Plf4ICZ1dQ=;
        b=R9/rbOd1mzzJwriho6oqu3CgC7K1wSlhXe9zeuBxmFvrEDJLsbJoEnk8sCgoc6cYsC
         5EALMtdGI5m13pWRUFyc9uNG9bQEXiDQGldI/blAVQj5EuXkESLqrcf7obe0PPkPb6lc
         jrR7ca1lWajN38Yu8/44Puy170gP+ANH29Qvz49gu8S/jVkfvocflfkB4V/Jd5CVvaBI
         rfK4//0M452A+GFovixi5kSLnULRU1gFXDdt2Zm0ATaGwbNuf26MuQ4VIg+AfgJ3b8H8
         YlhboLSrWvXvSrSKb1xIUjsVCol3049mQf32029TwiC9KjNK9iegXnvepXPp6kEHvk42
         HPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643748; x=1796248548;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r/GY1L0M/Jj/tnpXLztwrdoGc8kg+51R6Plf4ICZ1dQ=;
        b=B1hH2Yy6I0lDBqVLppcJBLVGxej2tBgIrTrIj9DwvweOB9em0pwGDVSxkXYN2+3kJd
         pUghOw/SIOSVEgiktSojoJtubxKLEH7FoxJfU1Ay6vYqPeJtiwNXsElBNla6stCkP9Jb
         2wm9BE8hbmU33YvtlrhVBB5O7BLyi2x15zSp5azd3Wo7kY8y/B2o8oWA589sMltvd2xs
         JofZ0qVShnmkf9u0hGz8F+2MNOpXPBXpr1M2trBe5C21/xdc+ECJHMECg1js4sxwe9dY
         30jJezI2DpSkIu6cpsBQMy+d2NLUU4MZOMXfXTBcHM5CyEdE/uGJOlkzDrvlT+oyDjOx
         YynQ==
X-Forwarded-Encrypted: i=1; AL+hErEhMFKsZQXrCnF0G09BoXwWTrgFHKqr+6klKnFPFD0CdBFVajpz4tQO0ySGuiOm65Ofpm2IjFk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XCBr4NlF/6uOEVcdiPi8yhdERHtysDAbjADtup1zLHdYxFEpO
	rahqGOp4FJL7k3z9eC8gzfZmXC/vAlRpIucmjokqvET9kP3/K8SETuq2
X-Gm-Gg: AZFdTZdIIuuidySE6gBBldkIiGl2WRyPPuUmWXzArjD6Ros29PEyfxMmdQjl3yS+pBm
	eYY40YJpNwjAgDaV3jpt1N6Ht9ykaI+HnMtH6uR8Pl1KYGrTF+4RDMJDUHt6TorvxMmNi/4FG47
	VPH7H7Qv6STy2D4gz6p6xHJllpKFdPJ3JcoXJq45ybafJho9joHnt7LEpjvc2pjkHTbI5YT47H1
	93QPYf8USyYyuQSJfBlSockDHdV7pLS3ehQAtxOtcAZO5hanc8Pk5GgZxe79di2IljQ9fkWBvBp
	6wsv056yEDSC05BrATWHqCenATs44dbBnrela7jbL7nKWK7mdcd8xnQ8yc6tEu6O1mYFxpD3mVc
	eMujMzigKfHQb082rrwxDPun14pMqIh3Yk+MILjAaJjkGkmVpICbVx5ZU/yujNdKm2shVCTsFSN
	HqGrp3tEaG4BEMbKtT+oXP6AZtF38N8ykVNvManlkRYURa44Xik17w/6O/PlyMNaY69QqWL3S3n
	Q4xXGGKO4ZzNZrlY9tBmoSvn9Bah6P8ZkAqg7N/F0C+gVQW92HE7tezH37fMEGzliaM0ukQlmrF
	Q1uUSGxxFcjiYgEDvFuZwudONH28rDHUZSG/pFE0g+ff9lohCrRRPhA=
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb8881c630mr403408355e9.27.1795643747772;
        Wed, 25 Nov 2026 13:55:47 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm566394855e9.3.2026.11.25.13.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:55:46 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christian Marangi <ansuelsmth@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC net-next 0/7] net: cortina: CS7542 wired IPv4 hardware
 flowtable offload
In-Reply-To: <7252b836-e375-4550-90c9-b0e3ab7fbb6d@lunn.ch>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
 <7252b836-e375-4550-90c9-b0e3ab7fbb6d@lunn.ch>
Date: Thu, 26 Nov 2026 00:55:27 +0300
Message-ID: <179564372798.5.10006827612276789857@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Andrew,

This is the first standalone offload RFC, v1. The prerequisite CPU-only
Ethernet series is v2; this RFC does not replace that series. I should
have made the relationship and architecture much clearer. The next
revision will carry an explicit v2 and a changelog.

There are two separate chips on Almond+:

  LAN1..4, WAN
       |
  QCA8337 external switch (existing qca8k DSA driver)
       | CPU port 0                 | CPU port 6
       | RGMII                     | RGMII
       v                           v
  CS7542 GMAC1 (eth1)          CS7542 GMAC0 (eth0)
       \                           /
        CS7542 network/forwarding engine and shared DMA
                         |
                        CPU

The proposed CS7542 Ethernet driver exposes two full Ethernet netdevs,
eth1 and eth0, despite sharing the DMA engine. Those are the conduits
for the external QCA8337. I am not modelling the CS7542 forwarding
engine itself as another DSA switch.

The CPU receive path is QCA8337 -> RGMII -> CS7542 DMA -> eth1/eth0 ->
DSA tagger -> lanN/wan. Transmit follows the reverse path. Ordinary L2
switching remains the existing QCA8337 driver's responsibility.

The accelerated routed IPv4 path in this RFC is QCA8337 -> GMAC1 ->
CS7542 FE lookup/NAT rewrite -> GMAC1 -> QCA8337 destination port. It
bypasses the CPU DMA path. The frontend accepts standard nftables
hardware flowtable requests through TC_SETUP_FT; it is not a new L2
switchdev implementation.

This explains the QCA changes in patch 5: its optional four-byte CPU
header adds an identifier before the normal QCA metadata. With the
identifier set to 0x8100, the CS7542 FE parser can locate the inner IPv4
header. It cannot do that with the ordinary two-byte QCA header. The
new tagger therefore describes the external switch's wire format, not
a DSA interface inside CS7542. Header length is global to QCA8337, so
both CPU ports must agree, although the present accelerated path uses
only CPU port 0/GMAC1. Management uses MDIO in this mode.

Your patch-2 comment is also correct: the unrelated blank-line changes
in include/net/dsa.h were my mistake. I have removed them locally;
only the two protocol-ID additions remain. No replacement series is
being sent while this discussion is ongoing.

Thanks,
Fil

