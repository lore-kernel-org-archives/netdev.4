Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795156694;
	b=WdOHfcInx06PE8ysizO0anpQSLKOARd0KRN/TVcRXzSn+5N6032NcHDNaCRQ56ej6/+d
	 HGBiJGXjVzl0rId2XFq7iM2MnWcAKV7sqRsNoVRbDik84jHBwMMxw2KQNPxkw3jSacTed
	 w3jSxx2vGamWFbpw6HcBkPZ+podtFsEaHLaoCkn5RBYTwCDUANBwSEt1qRlKoKQ4eimzm
	 VAf10M+z7MGNKRHv0PjiGkyR98C32140k+K54WTIX9FWocCoh3QhzaLTGtXAeIZmHatwm
	 E/3rTVK/VqgbdoK6O2uwT6SgjBDUYwjkjCrAPHk2/YABNXJiGSg0weVZJTIE3efFrNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795156694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Qv03CEIHDG7aZNX977ikZUuYrJV4v5YKIpDxeExPffM=;
	b=fMvL85OVG7iWmr+D8Su9LNViMAPDYAfBqAk3Is7tPu8HNesfL08gU5Sh/SeIhxOViYtb
	 znvMtgYE0MTwLEe72eZ3WbCYs8PUupKUFcs0ZMA5UaGT4wde1wW7w98p+bgYLz1YHzWSi
	 uAFPbgXSYXutLnpk8GNR4l7S8DZUKh/Lvtqa6LF1W30sR4li+u3nS7vmjcUQXkHw/XWrT
	 RHs5MlvaTUmSSYeGx8pNKji+cJSGszXuiugiFrZ6gmUW1MaLjTezpAsEmFXZMIAfj4t1V
	 jE9KIP6R5L7s+5rncr181NPCddi5P+6djPkeUMxKO1348PHCPC1c7Z/n+j7FIHNf2yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+XDxsXn;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC720606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 06:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC720606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x+XDxsXn
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c505186727fso91789366b.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 22:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795156692; x=1795761492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qv03CEIHDG7aZNX977ikZUuYrJV4v5YKIpDxeExPffM=;
        b=x+XDxsXnl/swmva9I36QHxRv4IltRymEvq+Lb4Fdmxh2aY+NZlp0mueiADYR53O/nF
         dAWR6VsT4ean31a/YYb9SlZgdHA6/qN8mwCHAzBr1+VtATpCu8UycevpcefFIgnPnj1r
         yoBj+yBVNIcaSNXsNO2jaEg5XhE+qpQ0UsOFUFgfuFErdKftv7B5NUloXWzVl+pv38lU
         oqAWzFdtZZlJzhqi/h7BzgZlnp3Di9pJHObSf3HIMxOlshdCcTkilRNHxAhYRedB2DMq
         /dYqhF6uKMSqX3xpc6sVEPjqxAqLsrf9DsbvzQ2qro1FBhFc0HkCCSqKfB9iYWYUNMMN
         weHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795156692; x=1795761492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qv03CEIHDG7aZNX977ikZUuYrJV4v5YKIpDxeExPffM=;
        b=JRADo3eTTP4XmMynuqVbPswAK9tMQPTK/9AT7nnTcS2VYyqv1Rq3TnnTZYAOEFlROu
         owbRqpS9LgT83ukLtqC2mpajnVrdzG0DDqaADzbqiRkeqBZcZaoQf4OSLtpn0iIxmDAE
         98W9p9g48C/Glmpd51IeMyq/MnChkUqQl+JLkzNRHPY5Vgu4PKMCEgBHdNcpUC55xwW1
         Q0aqWzsg6k/05gSgyp2Suk6c/09BFH3d3Ycs3nWxocbjqkGuhbfkhGfgF4C5/bNzcnB/
         XzmFu9VLIB1OxgQGYPTntDol9ioUsipks6Og96nuTLjzQJyY3wX7fezV7ZLgs35xnbIo
         psxQ==
X-Gm-Message-State: APuU4Z9MlNQNSVB1v2XiIBB1Jtb+tZ8jjyCSyJ3jsYjmC27rreTs5Rvc
	N8M0kpDA141PauTzmBETJHMWswBsGayQh1cv/JM7zH8T3Mue2xUg+gaT
X-Gm-Gg: AYBFou3kNtqP/daVpxY0Y4EAx9J7nqCdGvcFU7crwtTAj5EHRPReBprebSNX1CIBRVa
	VBaWnA83cLhl/nQuDetfKh1uTQn4lbQqxjvnsVKVUmzbt5QUw2hnq0aKTzy+Kd31FFvYdBkXsu+
	hkziDJd57uG+0hcxSNA8IbhNDdoMVyUfr+pwbq1nWLM6KSCWbpeeiQO12DogNwGmY+8+/bIavo8
	PTaI69fUyEk8j/Zr7VBc9QnkH+aIzKxFQieG5SHRtO2vjAXlmIgbhuY3WeD6XK/BaeaFsSKPeOr
	foLggTUY5Ia/7fR97DOIDcrmXk8R4x/KoT0o9K03zfOzPBOWEABluCxzC112fgMcWGDk88HHgP4
	y+FaHvQL+cvXbiAaF2slxCa8dIrxK4J0B33VzrJo1KQ5BjrQtCZkKqs1Ft/2K4+gUl7uDHYKLMl
	J0v7YJVuOuYuWBhJ5w+2Q2T1J2iTHDmq+peQQrtKhVRsbbzE/TOgA8oo+q+MdD3IWsE/ysXat4i
	JDly0/p4yCwCUXBnMT0xjwE13BOs/L97J5s/EET4gS8hdfWfWKFG5f4RVh3EVlDkhgZgUKU+Tqk
	ceK33imNr3DX4osmsUF+98o8X+aehHojAL1GgBb40Eo6vztahLEGg/cLzS9BrhTciV2hUYwpDaj
	kEzY7XDLHX0BZO6Jk8AY5tTUQCWPI3Vf+3mA8lO/pRsqeLdQm9c1PDgquzXc05YAsTUbYfGG4
X-Received: by 2002:a17:906:99d4:b0:c46:ca2b:84bd with SMTP id a640c23a62f3a-c513a8929c4mr193659066b.30.1795156692151;
        Thu, 19 Nov 2026 22:38:12 -0800 (PST)
Received: from dpawlik-thinkpadp1gen7.rmtpl.csb ([46.205.218.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc2455sm66530966b.57.2026.11.19.22.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 22:38:11 -0800 (PST)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk
Cc: netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kabel@kernel.org,
	petr.wozniak@gmail.com,
	maxime.chevallier@bootlin.com,
	olek2@wp.pl,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH net-next v3 0/2] net: sfp: skip PHY probe on bridge-less OEM SFP-10G-T
Date: Fri, 20 Nov 2026 07:37:54 +0100
Message-ID: <20261120063756.3677554-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some "OEM SFP-10G-T" copper modules have no RollBall I2C-to-MDIO
bridge, but the SFP-10G-T quirk forces RollBall on all of them. The PHY
probe then retries for over nine minutes under rtnl_lock before the
module links up without a PHY. This series skips the PHY probe for the
bridge-less revisions A and B, and leaves other revisions, which do
have a bridge, unchanged.

Patch 1 moves sfp_strlen() so the fixup can use it, with no functional
change. Patch 2 adds the fixup.

This does not re-introduce the generic RollBall bridge probe reverted
in commit b521003c27eb ("Revert "net: phy: sfp: probe for RollBall
I2C-to-MDIO bridge in mdio-i2c""): the probe path, its timeouts and the
MDIO bus creation for genuine RollBall modules are untouched. Further
bridge-less revisions of this part number may exist; they can be added
once their lack of a bridge is confirmed on hardware.

Changes in v3:
- Target net-next and drop the Fixes: tag: rev A never worked without
  the stall, so this is not a regression (Andrew Lunn).
- Split the sfp_strlen() move into its own patch (Andrew Lunn).

Changes in v2:
- Match the vendor revision with sfp_strlen(), so NUL-padded revisions
  are accepted like the rest of the quirk matching.
- Spell out in the commit message how the rev B module reaches this
  quirk entry (its part number depends on the peer speed).

v2: https://lore.kernel.org/netdev/20261118221450.1764790-1-pawlik.dan@gmail.com/
v1: https://lore.kernel.org/netdev/20261116093605.294365-1-pawlik.dan@gmail.com/

Daniel Pawlik (2):
  net: sfp: move sfp_strlen() above the quirk fixups
  net: sfp: skip PHY probe on bridge-less OEM SFP-10G-T revisions A and
    B

 drivers/net/phy/sfp.c | 54 +++++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 15 deletions(-)

-- 
2.56.1

