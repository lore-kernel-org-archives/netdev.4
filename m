Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795473089;
	b=zz6WAyTL5k2jSNPJ/GhhThfBB74nRz1MZzb3otOFnhYQe66kxWe0iY4mLGTDfj/IDsq/
	 1uNW6YZp8KBzTLytgNcVyNfFaryHmnjZsBO4X+Mj33xyKhpJIv93nXjFGlxH7SkcdXsx9
	 cdUak1tw7rOLBhjnTi8jqZPhC1GBFmjkBl8pxAB6d2mGJnlNZxVyltv9zIvCDsc2pDNBL
	 gxrhURBcIr7JNLQqklXDzxAEsRQGG/K/p2sq93SctxjvqldIl7SnaFh1iXk3pomz2PHRS
	 TNhRkeAL0dy+Vx35zgB0ZvKwkU82ij5rsYfmlAcue5atDF55ju3YmT7FXvUrsPqdwYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Ax0eaG/jsWAkDsExZygRxtPuN7mkDGzN/6dMy4dDBRk=;
	b=rpOMMyzYwnBhjiJ3dgcz3TssD+RttKW8lQwg4mvppXXOzVVlZkd0Ij//X4AhojUxz1GR
	 xxMEHANoMllHIr8KcegRHwO62HNjihQePmf7S+bF0m4opc4KgSLTFFPQQ4zMXvYatSGIx
	 jem+gAre8wNVQ3AHCo01G5q73nc8vtw/r/CLhrT0y/g9bfnME76yeCmWfrVRVEATadl8K
	 kiHm7c7RhxtnldTS81k82p19oIapmuJ4Do9cfQUnbtgFV+JX/gJDPWmu3dtFaTOHTF8yH
	 wfaVLdrub6osrjztztWBDp/HWzsJfLYiuk/Mm9LAmDMR5LnPDKjo0vxr3pne1HFP0WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlCAErAB;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42019606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42019606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlCAErAB
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso3160928e87.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 14:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795473087; x=1796077887; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ax0eaG/jsWAkDsExZygRxtPuN7mkDGzN/6dMy4dDBRk=;
        b=YlCAErABvSeA3HncMRsR56t8K9bcfLsLA9UItBrKavJ0SpSC7Lc3NsWwBU6JFHrpLW
         vio/WvPHUN08i3vmw6OXqvtfm+sri6unRkoP4lzi17rUtqVlDgSYGjEbXkq6ob+1y3Oa
         VLp7qG2/eyoRRfamv4pJVW+5GV/T+NN87nr2qskak44iC0g6cZx1PJGYr29Qu//2Ts4b
         YZo5hYRUr/I0llLLEpJcPo380RttdeQFS4LgkCpUSMswutkEMSXhE3lgeXbZXZrKtqFO
         fKt+/dh8nnpIrKJ0bfcZDAMaA1+z6C4HgIr/DSmOrZtnzEznZm0jkHn0eS9YRiTM5Feg
         CssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795473087; x=1796077887;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ax0eaG/jsWAkDsExZygRxtPuN7mkDGzN/6dMy4dDBRk=;
        b=rAilJpQQ9KXNTGxrxeh5WtOJUd7+ymglFzIXQaJ7vQFP1cact+PjOGOu3i8osReZhS
         4BGaVAC8msuyKYc94s7aUsZk6fH2I7wwkb9TjPsn1zs605FuxUStD1IFV42VwLEAPARN
         kuBe9WSnXK6pAmGz8lOmcEr4DMXpvG2ZVS7Me+CfMqAcANmw3yCVoqVWuYrDDVTvx4uJ
         6ofgz+9Em+3/kKySIS0z5kIJKcGeYzvffk0l3JGTHsxQKzAIujcE/Ssk4dxfXmuj7Mly
         DakGt0+g7Rj8OZsxQmEeNGIisJbCR4ZlvfOPy1bcn5i7WMXelbSpQaSl6Ig44ad7yiwx
         kswg==
X-Forwarded-Encrypted: i=1; AL+hErHUJJ/5/D2JYjx47i8Sj0NjVXFoIDMuLxzAk5q8sEGiaZRYei+WzPtLDfA8Jvt+shVMEZ2+Scg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lse83G6o2d7qIANNHhq02VQcarxYU35yWs+2ynMqT2JPGDl03
	ismhUvzIINCs2XjD1Eg8IX9DBd9435togrJwaX4HgC9WZbvWu3jdCHX+
X-Gm-Gg: AZFdTZcEuKsl7IwnC1flqald3jwlQZSy78cpA3pjscaqNKNAje0coGF6FYcT3sMH3He
	JdE6/dzrbHWnf2XLNfOo6HZ4dMxDyyOB1CPFyFcF43epxpmu8qZdSNGkSLVFPNzb9hv75jElZbY
	hmGWQeWA73jY7BpWeUPFnUlnzzcxKW+CV7Sdx4UyuSWkaKfzEmpYASji72Yimu0gY6+GLdzkpvx
	jl5B3XPRLU7/eNUC9L49cubzmue/QRj5Q7Tpq9/+uH+UtaGzFKvJnayqP9qx03AZsQylUSgnxav
	PI0lPmq2XFEmnxNIlFpYU5VTPaks/r11S8qPOjLnWbi4DL8rqHKXy7ioWqJ+NEKWRWVTBysdht8
	MNfyg5ZiI/cX8tVhrQtMn9oecifJT2Qu1QagocCKglg8VpSwOg9QHWmBoXqwUZz0GJZgKexUgfM
	24PxxK9J6y+mK2RJ48EK3YuAmsslD8j2RsHZrXV1oMTpBxtSuR0lepYysXOBKzZYkiGEj8orlA3
	Ki9VyJoDZztFU5x0lZWDFliXIR/hsmQ9XJ+wAP09fuxwrlYkjLFdQ60r0g8V/Y1+OxtpqPbXZB1
	O4WiiGobZvtGSFxvTdcrj2E9cM0c0QDU9aURW9BO/xTFKJGOvoco5sg=
X-Received: by 2002:a05:6512:32cd:b0:5c1:57cd:50b with SMTP id 2adb3069b0e04-5c1bc847888mr3847641e87.14.1795473087230;
        Mon, 23 Nov 2026 14:31:27 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd052d6bsm3315161e87.65.2026.11.23.14.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:31:25 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net-next 3/5] dt-bindings: net: Add Cortina CS7542 network engine
Date: Tue, 24 Nov 2026 01:31:21 +0300
Message-ID: <179547308136.447306.5703918766544571012@gmail.com>
In-Reply-To: <1d4fce88-c959-4bae-993a-c5aa1d792177@lunn.ch>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-3-fdb5e8c2d508@gmail.com>
 <1d4fce88-c959-4bae-993a-c5aa1d792177@lunn.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The hardware has three GMAC interfaces feeding a shared NI/FE, queue
manager, traffic manager and scheduler. The forwarding engine can steer
frames between GMAC ports without the CPU, including rewrite/NAT in the
vendor acceleration path. The posted driver configures CPU forwarding
and exposes the three MAC interfaces; it does not enable hardware flow
forwarding. I should make that shared datapath clearer in the binding.

On Almond+ there is also a separate QCA8337 Ethernet switch. GMAC1 is
wired to its CPU port 0, and GMAC0 to CPU port 6; the external copper
PHYs belong to that switch. Those MAC-to-switch connections are the
reason for the fixed 1 Gbit/s links in the example.

You are right about the phy-mode description. Both QCA CPU port nodes
already use rgmii-id, so qca8k programs the internal clock delays there.
I used rgmii on the SoC side to mean that its peer supplies the delays,
but that is not what the PCB-level phy-mode describes. I have no evidence
of deliberately extended PCB clock traces. I will correct the example
and the SoC MAC nodes to rgmii-id, and explain the fixed MAC-to-switch
connection. The existing QCA delay programming remains in place; the NI
driver does not add another set of internal delays.

I will keep the Ethernet reroll within the requested netdev cadence.

Thanks,
Fil
