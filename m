Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359546;
	b=nmMKdZxr2+1JryJF6Q0z8Fl28FjeN08sdCXPYm/1bqatUXo0LUEIkquCkw8JZDrsfDgD
	 mlQ3oZIJFVCoS1rUN8lYJAvLHFElqczONI2BxjCKntdzmhl1tSFF4Mij1kXjEzq2ERQ2N
	 aRmtjkqDB98tj5M1ttRvJIp52U5eW786ETpVDgZ2xT80MrBw/7ZopHu44Qr72JhNUcv+Q
	 MIiZFul59QIydSXOFrBFzWX/CmoKf2Xpx0zSrvXdv42C15xsqnNigjrkEC8uF8MpcF4QP
	 kcO6FW4NgWjE2hNMOmAubG1ZhTyf+VaPAvaA9iIc47rOBcrlEWrf98eJo+edaAU2+RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=V9aQgs949bFx55QdEAPtda6DfCwORIxmNpkfLincCtI=;
	b=Bku0ZQ1oX45371+6MXSPOTZgpZblFitjMUeAmHoxXqCe+qTwxKyRUDxzJwzKCPcvdar0
	 F3t8VWYFQ4BCYI8kEffUT9bKZvmImyS/ajvS8mCCZyTERO9rLs4D40pjZ6sLKe9GwApbc
	 FELa+m+YA5EML/TEBXIAjxsW18zJhpI4HgM+5ihsYwYSZdZuDaDR9i2OlaZaF+ezYcHaQ
	 naPYq2FhD1kO1LjG8AlUFD2k6kWdthHNmlf99uht23BgXU8IJCaLvNJjSKHPujYqGI7ST
	 bVbfXrHjmbNdvcx7D3vnMYCTkevDrpnGkQLfKXfwiIdUoBOOtoxOz/rMSOsTLDGZUcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bLT9KzGr;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4D5606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 14:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E4D5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bLT9KzGr
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f0414c1062so12461975ad.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 06:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795359546; x=1795964346; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V9aQgs949bFx55QdEAPtda6DfCwORIxmNpkfLincCtI=;
        b=bLT9KzGrh2Tr356MYIcLuYVLKHo0PpL1IwIVRFIAwPcRonuirzoIguew7yeWhyxzZD
         ZUvP1y50cp19sswWMnJa74cP9C+b8TV8ontKCDf1a0DNCsJN+Tr8vMK622Ryk4ssv+v4
         jBiGwmaqwlNyGPvynbFY7YPmjWZbr8D0f8Znfq9y7RBkadpppas/naLfi2ctiLChB29m
         JhfauowPwGoH5VKxUjLQqxcu4mSTIn0CrAACVeD2mpg57ACN0ULMbO01/SLTD89yta2U
         R2poFeSSUHcla4L9Xtk9i3gMXw7Elqg4qGSo2E+Ac7k8FD4f2Ay6EOdNiLwEuLnMZ3k2
         KGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359546; x=1795964346;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9aQgs949bFx55QdEAPtda6DfCwORIxmNpkfLincCtI=;
        b=BdJeLeal0X2BBx8wvSRD8q8KBJodDkFfen1KtRMsahfseAeFSMtRimyUPS55PYv0RB
         HNGIPg2d2+64TqDrH1FhVq0BltZqn+mdeL6YacPPv2xa8PR9RxRFG3gIA2RZtjaKd7Pe
         ko135qFNZup5dqNYgI9VL3jkNIFG24Mdw1kenwMs0cjKB0KW3dzOrY+gLQSkxRw9EBZX
         KjBW1Cq3uJ+mv+aH0gCVVIW8WDEYbdsAaFNAKcEs5aJaViMOMSC+v4Y3ZDhoakAJkaup
         YfSULcdjlkDNIhMnJB/PfgonOaGlynw7/w9ttiktk0AAeE03rbtz28qTktr/PZFN9KBl
         rUWw==
X-Gm-Message-State: APuU4Z/iuYyIf/zMwQQcVs6L5f9QJfeM0jLeQ5PimPCqOP29w5ojsbKx
	0oTKCs8BW/6mTD5YCFWofiuKLHYrrVt7uW22fSnKqT/j3hyfIZSEP17Y
X-Gm-Gg: AZFdTZcTrzxQUbKCclrT31xuxlvcJaS7wqgKN0b0yovrjNxjtJs/Yaiq+6Jdvc2BPcs
	fp90vn2aq5P9n5cDuhbUM4A+QdWoiOpK7TvdVWEbPZuO887dV+26cbXLrp5WZzchY3FFEPhnZ9Q
	Z+c79WLZMTe4UjMx2PfBPP8Hs27PZjNozAUfWxAiiQ+dZKQz3cFUrsBsElo+DQy36gSu46xRTcR
	yD+FjF4Uetbq6kk1/5T+LwKwF0A2GwBdtTXWQGfbv+FGnC4j8Nc3euMD4hETD3S1APsm/sRafV8
	vt3jU1WYjrTT7RXVvSPuTwKyuz429JX8PZ1I1gS3LyPSZi2MCvX9e/n7wSyykC2hFvTMcZFqflB
	EWEhzw6ow4R3M/bDQnEFg4PjiKd2EQ1ER9FR4Ojn640LfkdtWSou4wu8oG5VOiX3Nfb5EOqQYF0
	yQq46Uh+f39H8J/b2tIzyZtETx6KQat53JIyAcG2eSI9JS0JgU/jlUi9AYTpPuAXtyNIXrBL4Kq
	PhULuaMYmANAx/uFrFzE95BdIq6lckw951uDILM1Im6TL0yaURKWXZuTN94bj6b9iSPunPC
X-Received: by 2002:a17:90b:2e4b:b0:3ab:884b:659e with SMTP id 98e67ed59e1d1-3b41c8e1705mr7082627a91.9.1795359545501;
        Sun, 22 Nov 2026 06:59:05 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40a878d50sm15343634a91.11.2026.11.22.06.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 06:59:05 -0800 (PST)
Date: Sun, 22 Nov 2026 06:59:05 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Hangbin Liu <hangbin.liu@linux.dev>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] bonding: reject a non-Ethernet 802.3ad slave even
 when the type matches
In-Reply-To: <179535255333.3135.10581087211469618015@kernel.org>
References: <179500849159.1877154.14715369660816392826@gmail.com>
 <179535255333.3135.10581087211469618015@kernel.org>
Message-ID: <179535949326.2658908.10317801004319925337@gmail.com>
Content-Type: text/plain; charset="us-ascii"
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

On Sun, 22 Nov 2026 13:02:33 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: High]
> Is this check enough to keep a non-Ethernet slave out of an 802.3ad bond?
> It only looks at the slave's type when the slave is enslaved. A slave that
> is itself a bond can still change type after that.

The issue is real: the nested case gives the same KASAN report in
bond_open(), also with v2 applied. v3 adds a second patch that refuses
NETDEV_PRE_TYPE_CHANGE for a slave of an 802.3ad bond, as team does for
its ports; other modes still allow it, as bond-eth-type-change.sh
expects.

Kyuwon Cho

pw-bot: cr
